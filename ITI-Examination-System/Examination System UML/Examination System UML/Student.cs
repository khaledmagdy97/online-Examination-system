using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Examination_System_UML
{
    // call Helpers.Hold(); at the end of every function to hold the state
    public class Student : Person
    {
        public string Phone { get; set; }

        public string Address { get; set; }

        public Department Department { get; set; }

        public List<Course> Courses { get; set; }

        public List<StudentExam> Exams { get; set; }

        private void TakeExam()
        {
            if (Exams.Count == 0)
            {
                Console.WriteLine("No available exams.");
                Helpers.Hold();
                return;
            }

            if (Exams.Where((e) => e.Taken == false).Count() == 0)
            {
                Console.WriteLine("There is no assigned exams.");
                Helpers.Hold();
                return;
            }

            for (int i = 0; i < Exams.Count; i++)
            {
                if (!Exams[i].Taken)
                    Console.WriteLine(Exams[i]);
            }

            int examId;
            do
            {
                Console.WriteLine("choose the targeted exam ID...");
            } while (!int.TryParse(Console.ReadLine(), out examId));

            StudentExam ex = Exams.Where((e) => e.Exam.Id == examId).FirstOrDefault();
            if (ex == null)
            {
                Console.WriteLine("No Exam with the given ID");
                return;
            }
            Console.Clear();
            //Console.WriteLine(ex.Exam);

            ex.Taken = true;
            for (int i = 0; i < ex.Exam.Questions.Count; i++)
            {
                Console.WriteLine($"\n{i+1}- {ex.Exam.Questions[i]}");
                ex.Answers += $"{Console.ReadLine()}";
                if (i != ex.Exam.Questions.Count - 1)
                    ex.Answers += ",";
            }

            CorrectExam(ex);

            Helpers.Hold();
        }

        private void GetGrades()
        {
            if (Exams.Count == 0)
            {
                Console.WriteLine("No available exams.");
                Helpers.Hold();
                return;
            }

            if (Exams.Where((e) => e.Taken == true).Count() == 0)
            {
                Console.WriteLine("There is no taken exams.");
                Helpers.Hold();
                return;
            }

            for (int i = 0; i<Exams.Count; i++)
			{
                Console.WriteLine(Exams[i]);
            }
            Helpers.Hold();
        }

        private void GetGrade()
        {
            int courseId;

            do
            {
                Console.WriteLine("Enter course ID:");
            } while (!int.TryParse(Console.ReadLine(), out courseId));
	    
            Course crs = Program.Courses.Where((c) => c.Id == courseId).FirstOrDefault();

            if (crs == null)
            {
                Console.WriteLine("No course with the given ID");
                return;
            }

            var tmp = Exams.Where((e) => e.Taken == true && e.Exam.CourseId == courseId).ToList();
            if (tmp.Count() == 0)
                Console.WriteLine("There is no taken exams for this course.");
            else
                tmp.PrintList();
            
            Helpers.Hold();
            return;
        }

        private void CorrectExam(StudentExam studentEx)
        {
            int numberOfCorrectAnswers = 0;
            Exam generalExam = studentEx.Exam;
           
            // converting student answers from string to char array
            string[] studentAnswers = studentEx.Answers.Split(',');


          
            //checking the student answer with model answer
            for(int i = 0;i < generalExam.Questions.Count; i++)
            {
                if (generalExam.Questions[i].Answer == studentAnswers[i][0])
                {
                    numberOfCorrectAnswers += 1;
                }
            }
            studentEx.Grade = ((double)numberOfCorrectAnswers / generalExam.Questions.Count) * 100;
        }

        public override string ToString()
        {
            return $"Student ID: {Id}\nStudent Name: {FirstName + " " + LastName}\nDepartment Name: {Department.Name}";
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
                    "1- Take exam\n" +
                    "2- Get all exams grades\n" +
                    "3- Get exam grade\n" +
                    "4- ESC to logout");

                var choice = Console.ReadKey();
                switch (choice.Key)
                {
                    case ConsoleKey.D1:
                    case ConsoleKey.NumPad1: { Console.Clear(); TakeExam(); break; }
                    case ConsoleKey.D2:
                    case ConsoleKey.NumPad2: { Console.Clear(); GetGrades(); break; }
                    case ConsoleKey.D3:
                    case ConsoleKey.NumPad3: { Console.Clear(); GetGrade(); break; }
                    case ConsoleKey.Escape: { Program.CurrentUser = null; Program.Type = ""; return; }
                }
            }
        }
    }
}
