using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Examination_System_UML
{
    // call Helpers.Hold(); at the end of every function to hold the state
    public class Instructor : Person
    {
        static int Examcount =1;

        public Department Department { get; set; }
        public List<Course> Courses { get; set; }

        /// <summary>
        /// This function should generate an exam randomly from pre-existing questions according to choosen course id.
        /// </summary>
        /// <param name="courseId"></param>
        /// <exception cref="NotImplementedException"></exception>
        private void GenerateExam()
        {
            int courseId;
            do
            {
                Console.Write("Enter course ID: ");
            } while (!int.TryParse(Console.ReadLine(), out courseId));

            Course course = Program.Courses.Where((c) => c.Id == courseId).FirstOrDefault();
            
            if(course == null)
            {
                Console.WriteLine("No course with the given ID");
                Helpers.Hold();
                return;
            }

            if (!Courses.Contains(course))
            {
                Console.WriteLine("You aren't assigned to this course");
                Helpers.Hold();
                return;
            }

            Random rnd = new Random();

            var mcq = course.Questions.Where((q) => q.Type == "MCQ").OrderBy(x => rnd.Next()).Take(5).ToList();
            var tf = course.Questions.Where((q) => q.Type == "TF").OrderBy(x => rnd.Next()).Take(5).ToList();

            Program.Exams.Add(new Exam { Id = Examcount++, CourseId = courseId, Questions = mcq.Concat(tf).ToList() }); 

            Helpers.Hold();
        }

        /// <summary>
        /// This function should ask the instructor if he wants to add assign an exam to a single or group of students, or he wants to asign it to all students in the course,
        /// and handel both cases.
        /// HANDEL EACH CASE IN A DIFFERENT *PRIVATE* FUNCTION
        /// </summary>
        /// <param name="examId"></param>
        /// <exception cref="NotImplementedException"></exception>
        private void AssignExamForSingleStudent()
        {
            #region Course

            int courseId;
            do
            {
                Console.Write("Enter course ID: ");
            } while (!int.TryParse(Console.ReadLine(), out courseId));

            Course crs = Program.Courses.Where((c) => c.Id == courseId).FirstOrDefault();

            if (!Courses.Contains(crs))
            {
                Console.WriteLine("You aren't assigned to this course!");
                Helpers.Hold();
                return;
            }

            #endregion

            #region Student
            int stuid;
            do
            {
                Console.Write("Enter student ID: ");
            } while (!int.TryParse(Console.ReadLine(), out stuid));

            Student stu = Program.Students.Where((s) => s.Id == stuid).FirstOrDefault();

            if (stu == null)
            {
                Console.WriteLine("No student with the given ID");
                Helpers.Hold();
                return;
            }

            if (!stu.Courses.Contains(crs))
            {
                Console.WriteLine("Student isn't assigned to this course!");
                Helpers.Hold();
                return;
            }

            #endregion
            
            Random rnd = new Random();
            Exam ex = Program.Exams.Where((e)=>e.CourseId == courseId).OrderBy(x => rnd.Next()).FirstOrDefault();

            if (ex != null)
            {
                stu.Exams.Add(new StudentExam { Exam = ex  , Date = DateOnly.FromDateTime(DateTime.Now)}) ;
                Console.WriteLine($"Exam {ex.Id} was assigned to the student.");
                Helpers.Hold();
            }
            else
            {
                Console.WriteLine("No Exams generated...");
                Helpers.Hold();
            }

            return; 
        }

        private void AssignExamForGroupStudent()
        {
            int courseId;

            do
            {
                Console.Write("Enter course ID: ");
            } while (!int.TryParse(Console.ReadLine(), out courseId));

            Course crs = Program.Courses.Where((c) => c.Id == courseId).FirstOrDefault();

            if (!Courses.Contains(crs))
            {
                Console.WriteLine("You aren't assigned to this course!");
                Helpers.Hold();
                return;
            }

            if (crs == null)
            {
                Console.WriteLine("No course with the given ID");
                Helpers.Hold();
                return;
            }

            var studentGroup = Program.Students.Where((s) =>  s.Courses.Any((c)=> c.Id == courseId )).ToList();

            if (studentGroup == null)
            {
                Console.WriteLine("No students where choosen...");
                Helpers.Hold();
                return;
            }

            Random rnd = new Random();
            Exam ex = Program.Exams.OrderBy(x => rnd.Next()).FirstOrDefault();

            if (ex != null)
            {
                for(int i = 0;i< studentGroup.Count;i++)
                {
                    studentGroup[i].Exams.Add(new StudentExam { Exam = ex, Date = DateOnly.FromDateTime(DateTime.Now) });
                }
                Console.WriteLine($"Exam with id {ex.Id} was assigned");
            }
            else
            {
                Console.WriteLine("no Exams generated...");
            }

            Helpers.Hold();
            return;
        }

        public override string ToString()
        {
            return $"Instructor ID: {Id}\nInstructor Name: {FirstName + " " + LastName}\nDepartment Name: {Department.Name}";
        }

        public override void PresentMenu()
        {
            while (true)
            {
                Console.Clear();
                string welcome = "******************************************************************************\n" +
                                $"****Welcome {FirstName + " " + LastName} to ITI Examination System\n" +
                                 "******************************************************************************\n\n";

                Console.WriteLine(welcome + "\nPlease choose an option:");
                Console.WriteLine(
                    "1- Generate an exam\n" +
                    "2- Assign exam to a single student\n" +
                    "3- Assign exam to a group of student\n" +
                    "4- ESC to logout");


                var choice = Console.ReadKey();
                switch (choice.Key)
                {
                    case ConsoleKey.D1:
                    case ConsoleKey.NumPad1: { Console.Clear();  GenerateExam(); break; }
                    case ConsoleKey.D2:
                    case ConsoleKey.NumPad2: { Console.Clear(); AssignExamForSingleStudent(); break; }
                    case ConsoleKey.D3:
                    case ConsoleKey.NumPad3: { Console.Clear(); AssignExamForGroupStudent(); break; }
                    case ConsoleKey.Escape: { Program.CurrentUser = null; Program.Type = ""; return; }
                }
            }
        }
    }
}
