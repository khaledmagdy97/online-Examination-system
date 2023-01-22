using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System_UML
{
    // call Helpers.Hold(); at the end of every function to hold the state
    public class Admin : Instructor
    {
        #region CRUD operations
        public void AddStudent()
        {
            Student student = new Student();

            Console.WriteLine("Enter student id :");

            int id;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                student.Id = id;
            }
            else
            {
                Console.WriteLine("This student id should be a number");
                Helpers.Hold();
                return;
            }

            if (Program.Students.Where((s) => s.Id == student.Id).FirstOrDefault() != null)
            {
                Console.WriteLine("This student is already exists");
                Helpers.Hold();
                return;
            }

            Console.WriteLine("Enter student Phone :");
            student.Phone = Console.ReadLine();

            Console.WriteLine("Enter student Address :");
            student.Address = Console.ReadLine();

            Console.WriteLine("Enter student FirstName :");
            student.FirstName = Console.ReadLine();

            Console.WriteLine("Enter student LastName :");
            student.LastName = Console.ReadLine();


            Department Dept;
            int deptId;
            do
            {
                Console.WriteLine("Enter student Department id :");
                //deptId = int.Parse(Console.ReadLine());
                if (int.TryParse(Console.ReadLine(), out deptId))
                {
                    Dept = Program.Departments.FirstOrDefault(d => d.Id == deptId);
                }
                else
                {
                    Console.WriteLine("This department id should be a number");
                    Helpers.Hold();
                    return;
                }
                //Dept = Program.Departments.FirstOrDefault(d => d.Id == deptId);
                if (Dept != null)
                {
                    student.Department = Dept;
                }
                else
                {
                    Console.WriteLine("Invalid Department ID");
                }
            } while (Dept == null);

            List<Course> Courses = new List<Course>();
            int crsID;
            Course crs;
            Console.WriteLine("Enter courses number :");
            int crsCount;

            if (!int.TryParse(Console.ReadLine(), out crsCount))
            {
                Console.WriteLine("The courses number should be a number");
                Helpers.Hold();
                return;
            }

            if (crsCount > 0)
            {
                do
                {
                    Console.WriteLine("Enter student Course id :");
                    //crsID = int.Parse(Console.ReadLine());
                    if (int.TryParse(Console.ReadLine(), out crsID))
                    {
                        crs = Program.Courses.FirstOrDefault(c => c.Id == crsID);
                    }
                    else
                    {
                        Console.WriteLine("This course id should be a number");
                        Helpers.Hold();
                        return;
                    }
                    //crs = Program.Courses.FirstOrDefault(c => c.Id == crsID);
                    if (crs != null)
                    {
                        Courses.Add(crs);
                    }
                    else
                    {
                        Console.WriteLine("Invalid Course ID");
                    }
                } while (Courses.Count < crsCount);
            }

            student.Courses = Courses;

            Program.Students.Add(student);
            Helpers.Hold();
        }

        private void AddDepartment()
        {
            Department department = new Department();

            Console.WriteLine("Enter department id :");
            //department.Id = int.Parse(Console.ReadLine());
            int deptId;
            if (int.TryParse(Console.ReadLine(), out deptId))
            {
                department.Id = deptId;
            }
            else
            {
                Console.WriteLine("This department id should be a number");
                Helpers.Hold();
                return;
            }

            if (Program.Departments.Where((d) => d.Id == department.Id).FirstOrDefault() != null)
            {
                Console.WriteLine("This department is already exists");
                Helpers.Hold();
                return;
            }

            Console.WriteLine("Enter department name :");
            department.Name = Console.ReadLine();

            Instructor ins;
            int insId;
            do
            {
                Console.WriteLine("Enter Department Manager id :");
                //insId = int.Parse(Console.ReadLine());
                if (int.TryParse(Console.ReadLine(), out insId))
                {
                    ins = Program.Instructors.FirstOrDefault(i => i.Id == insId);
                }
                else
                {
                    Console.WriteLine("This instructor id should be a number");
                    Helpers.Hold();
                    return;
                }
                //ins = Program.Instructors.FirstOrDefault(i => i.Id == insId);
                if (ins != null)
                {
                    department.Manager = ins;
                }
                else
                {
                    Console.WriteLine("Invalid Department ID");
                }
            } while (ins == null);

            Program.Departments.Add(department);
            Helpers.Hold();
        }

        private void AddQuestion()
        {
            Question question = new Question();

            Console.WriteLine("Enter question id :");
            //question.Id = int.Parse(Console.ReadLine());
            int qId;
            if (int.TryParse(Console.ReadLine(), out qId))
            {
                question.Id = qId;
            }
            else
            {
                Console.WriteLine("This question id should be a number");
                Helpers.Hold();
                return;
            }
            if (Program.Questions.Where((q) => q.Id == question.Id).FirstOrDefault() != null)
            {
                Console.WriteLine("This question is already exists");
                Helpers.Hold();
                return;
            }

            Console.WriteLine("Enter question Statement :");
            question.Statement = Console.ReadLine();

            Console.WriteLine("Enter question Type :");
            question.Type = Console.ReadLine();

            Console.WriteLine("Enter question Answer :");
            question.Answer = Console.ReadLine()[0];

            Console.WriteLine("Enter course id :");
            //question.CourseId = int.Parse(Console.ReadLine());
            int crsId;
            if (int.TryParse(Console.ReadLine(), out crsId))
            {
                question.Id = crsId;
            }
            else
            {
                Console.WriteLine("This course id should be a number");
                Helpers.Hold();
                return;
            }

            List<string> Choices = new List<string>();
            String choice = String.Empty;
            do
            {
                Console.WriteLine("Enter Course choice :");
                choice = Console.ReadLine();
                Choices.Add(choice);
            } while (Choices.Count < 4);
            question.Choices = Choices;

            Program.Questions.Add(question);
            Helpers.Hold();
        }

        private void AddInstructor()
        {
            Instructor instructor = new Instructor();
            Console.WriteLine("Enter instructor id :");
            //instructor.Id = int.Parse(Console.ReadLine());
            int insId;
            if (int.TryParse(Console.ReadLine(), out insId))
            {
                instructor.Id = insId;
            }
            else
            {
                Console.WriteLine("This instructor id should be a number");
                Helpers.Hold();
                return;
            }
            if (Program.Instructors.Where((i) => i.Id == instructor.Id).FirstOrDefault() != null)
            {
                Console.WriteLine("This instructor is already exists");
                return;
            }

            Department Dept;
            int deptId;
            do
            {
                Console.WriteLine("Enter instructor Department id :");
                //deptId = int.Parse(Console.ReadLine());
                if (int.TryParse(Console.ReadLine(), out deptId))
                {
                    Dept = Program.Departments.FirstOrDefault(d => d.Id == deptId);
                }
                else
                {
                    Console.WriteLine("This department id should be a number");
                    Helpers.Hold();
                    return;
                }
                //Dept = Program.Departments.FirstOrDefault(d => d.Id == deptId);
                if (Dept != null)
                {
                    instructor.Department = Dept;
                }
                else
                {
                    Console.WriteLine("Invalid Department ID");
                }
            } while (Dept == null);

            List<Course> Courses = new List<Course>();
            int crsID;
            Course crs;
            Console.WriteLine("Enter instructor's courses number :");
            int crsCount;
            //crsCount = int.Parse(Console.ReadLine());
            if (int.TryParse(Console.ReadLine(), out crsCount))
            {
                do
                {
                    Console.WriteLine("Enter instructor Course id :");
                    crsID = int.Parse(Console.ReadLine());
                    crs = Program.Courses.FirstOrDefault(c => c.Id == crsID);
                    if (crs != null)
                    {
                        Courses.Add(crs);
                    }
                    else
                    {
                        Console.WriteLine("Invalid Course ID");
                    }
                } while (Courses.Count < crsCount);
            }
            else
            {
                Console.WriteLine("This course id should be a number");
                Helpers.Hold();
                return;
            }
            //do
            //{
            //    Console.WriteLine("Enter instructor Course id :");
            //    crsID = int.Parse(Console.ReadLine());
            //    crs = Program.Courses.FirstOrDefault(c => c.Id == crsID);
            //    if (crs != null)
            //    {
            //        Courses.Add(crs);
            //    }
            //    else
            //    {
            //        Console.WriteLine("Invalid Course ID");
            //    }
            //} while (Courses.Count < crsCount);
            instructor.Courses = Courses;

            Program.Instructors.Add(instructor);

            Helpers.Hold();
        }

        private void AddCourse()
        {
            Course course = new Course();
            Console.WriteLine("Enter course id :");
            //course.Id = int.Parse(Console.ReadLine());
            int crsId;
            if (int.TryParse(Console.ReadLine(), out crsId))
            {
                course.Id = crsId;
            }
            else
            {
                Console.WriteLine("This course id should be a number");
                Helpers.Hold();
                return;
            }
            if (Program.Courses.Where((c) => c.Id == course.Id).FirstOrDefault() != null)
            {
                Console.WriteLine("This course is already exists");
                return;
            }

            Console.WriteLine("Enter course name :");
            course.Name = Console.ReadLine();

            List<Topic> Topics = new List<Topic>();
            int topID;
            Topic top;
            Console.WriteLine("Enter courses Topic :");
            int topicCount;
            //topicCount = int.Parse(Console.ReadLine());
            if (int.TryParse(Console.ReadLine(), out topicCount))
            {
                do
                {
                    Console.WriteLine("Enter Topic id :");
                    //topID = int.Parse(Console.ReadLine());
                    if (int.TryParse(Console.ReadLine(), out topID))
                    {
                        top = Program.Topics.FirstOrDefault(t => t.Id == topID);
                    }
                    else
                    {
                        Console.WriteLine("This topic id should be a number");
                        Helpers.Hold();
                        return;
                    }
                    //top = Program.Topics.FirstOrDefault(t => t.Id == topID);
                    if (top != null)
                    {
                        Topics.Add(top);
                    }
                    else
                    {
                        Console.WriteLine("Invalid Course ID");
                    }
                } while (Topics.Count < topicCount);
            }
            else
            {
                Console.WriteLine("This course id should be a number");
                Helpers.Hold();
                return;
            }
            //do
            //{
            //    Console.WriteLine("Enter Topic id :");
            //    topID = int.Parse(Console.ReadLine());
            //    top = Program.Topics.FirstOrDefault(t => t.Id == topID);
            //    if (top != null)
            //    {
            //        Topics.Add(top);
            //    }
            //    else
            //    {
            //        Console.WriteLine("Invalid Course ID");
            //    }
            //} while (Topics.Count < topicCount);
            course.Topics = Topics;

            Program.Courses.Add(course);
            Helpers.Hold();
        }

        private void AddTopic()
        {
            Topic topic = new Topic();
            Console.WriteLine("Enter topic id :");
            //topic.Id = int.Parse(Console.ReadLine());
            int topId;
            if (int.TryParse(Console.ReadLine(), out topId))
            {
                topic.Id = topId;
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }
            if (Program.Topics.Where((t) => t.Id == topic.Id).FirstOrDefault() != null)
            {
                Console.WriteLine("This topic is already exists");
                return;
            }

            Console.WriteLine("Enter topic name :");
            topic.Name = Console.ReadLine();

            Program.Topics.Add(topic);
            Helpers.Hold();
        }


        private void UpdateStudent()
        {
            Console.WriteLine("Enter student id :");
            int id;
            Student student;
            //id = int.Parse(Console.ReadLine());
            if (int.TryParse(Console.ReadLine(), out id))
            {
                student = Program.Students.Where((s) => s.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }
            //Student student = Program.Students.Where((s) => s.Id == id).SingleOrDefault();
            if (student == null)
            {
                Console.WriteLine("This student doesn't exist");
                return;
            }

            Console.WriteLine("Enter student Phone :");
            student.Phone = Console.ReadLine();

            Console.WriteLine("Enter student Address :");
            student.Address = Console.ReadLine();

            Console.WriteLine("Enter student FirstName :");
            student.FirstName = Console.ReadLine();

            Console.WriteLine("Enter student LastName :");
            student.LastName = Console.ReadLine();


            Department Dept;
            int deptId;
            do
            {
                Console.WriteLine("Enter student Department id :");
                //deptId = int.Parse(Console.ReadLine());
                if (int.TryParse(Console.ReadLine(), out deptId))
                {
                    Dept = Program.Departments.FirstOrDefault(d => d.Id == deptId);
                }
                else
                {
                    Console.WriteLine("This topic id should be a number");
                    Helpers.Hold();
                    return;
                }
                //Dept = Program.Departments.FirstOrDefault(d => d.Id == deptId);
                if (Dept != null)
                {
                    student.Department = Dept;
                }
                else
                {
                    Console.WriteLine("Invalid Department ID");
                }
            } while (Dept == null);

            List<Course> Courses = new List<Course>();
            int crsID;
            Course crs;
            Console.WriteLine("Enter courses number :");
            int crsCount = int.Parse(Console.ReadLine());
            do
            {
                Console.WriteLine("Enter student Course id :");
                //crsID = int.Parse(Console.ReadLine());
                if (int.TryParse(Console.ReadLine(), out crsID))
                {
                    crs = Program.Courses.FirstOrDefault(c => c.Id == crsID);
                }
                else
                {
                    Console.WriteLine("This topic id should be a number");
                    Helpers.Hold();
                    return;
                }
                //crs = Program.Courses.FirstOrDefault(c => c.Id == crsID);
                if (crs != null)
                {
                    Courses.Add(crs);
                }
                else
                {
                    Console.WriteLine("Invalid Course ID");
                }
            } while (Courses.Count < crsCount);
            student.Courses = Courses;

            Helpers.Hold();
        }

        private void UpdateDepartment()
        {
            Console.WriteLine("Enter department id :");
            int id;
            Department department;
            //id = int.Parse(Console.ReadLine());
            if (int.TryParse(Console.ReadLine(), out id))
            {
                department = Program.Departments.Where((s) => s.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }

            //Department department = Program.Departments.Where((s) => s.Id == id).SingleOrDefault();
            if (department == null)
            {
                Console.WriteLine("This department doesn't exist");
                return;
            }

            Console.WriteLine("Enter department name :");
            department.Name = Console.ReadLine();

            Instructor ins;
            int insId;
            do
            {
                Console.WriteLine("Enter Department Manager id :");
                //insId = int.Parse(Console.ReadLine());
                if (int.TryParse(Console.ReadLine(), out insId))
                {
                    ins = Program.Instructors.FirstOrDefault(i => i.Id == insId);
                }
                else
                {
                    Console.WriteLine("This topic id should be a number");
                    Helpers.Hold();
                    return;
                }
                //ins = Program.Instructors.FirstOrDefault(i => i.Id == insId);
                if (ins != null)
                {
                    department.Manager = ins;
                }
                else
                {
                    Console.WriteLine("Invalid Department ID");
                }
            } while (ins == null);

            Helpers.Hold();
        }

        private void UpdateQuestion()
        {
            Question question = new Question();
            Console.WriteLine("Enter question id :");
            int id;
            //id = int.Parse(Console.ReadLine());
            Question qs;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                qs = Program.Questions.Where((q) => q.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }
            //Question qs = Program.Questions.Where((q) => q.Id == id).SingleOrDefault();
            if (qs == null)
            {
                Console.WriteLine("This question doesn't exist");
                return;
            }

            Console.WriteLine("Enter question Statement :");
            question.Statement = Console.ReadLine();

            Console.WriteLine("Enter question Type :");
            question.Type = Console.ReadLine();

            Console.WriteLine("Enter question Answer :");
            question.Answer = Console.ReadLine()[0];

            Console.WriteLine("Enter course id :");
            //question.CourseId = int.Parse(Console.ReadLine());
            if (int.TryParse(Console.ReadLine(), out int qId))
            {
                question.CourseId = qId;
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }
            List<string> Choices = new List<string>();
            String choice = String.Empty;
            do
            {
                Console.WriteLine("Enter Course choice :");
                choice = Console.ReadLine();
                Choices.Add(choice);
            } while (Choices.Count < 4);
            question.Choices = Choices;

            Helpers.Hold();
        }

        private void UpdateInstructor()
        {
            Instructor instructor = new Instructor();

            Console.WriteLine("Enter question id :");
            int id;
            //id = int.Parse(Console.ReadLine());
            Instructor ins;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                ins = Program.Instructors.Where((i) => i.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }
            //Instructor ins = Program.Instructors.Where((i) => i.Id == id).SingleOrDefault();
            if (ins == null)
            {
                Console.WriteLine("This instructor doesn't exist");
                return;
            }

            Department Dept;
            int deptId;
            do
            {
                Console.WriteLine("Enter instructor Department id :");
                deptId = int.Parse(Console.ReadLine());
                if (int.TryParse(Console.ReadLine(), out deptId))
                {
                    Dept = Program.Departments.FirstOrDefault(d => d.Id == deptId);
                }
                else
                {
                    Console.WriteLine("This topic id should be a number");
                    Helpers.Hold();
                    return;
                }
                //Dept = Program.Departments.FirstOrDefault(d => d.Id == deptId);
                if (Dept != null)
                {
                    instructor.Department = Dept;
                }
                else
                {
                    Console.WriteLine("Invalid Department ID");
                }
            } while (Dept == null);

            List<Course> Courses = new List<Course>();
            int crsID;
            Course crs;
            Console.WriteLine("Enter instructor's courses number :");
            int crsCount;
            //crsCount =int.Parse(Console.ReadLine());
            if (int.TryParse(Console.ReadLine(), out crsCount))
            {
                do
                {
                    Console.WriteLine("Enter instructor Course id :");
                    crsID = int.Parse(Console.ReadLine());
                    crs = Program.Courses.FirstOrDefault(c => c.Id == crsID);
                    if (crs != null)
                    {
                        Courses.Add(crs);
                    }
                    else
                    {
                        Console.WriteLine("Invalid Course ID");
                    }
                } while (Courses.Count < crsCount);
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }
            //do
            //{
            //    Console.WriteLine("Enter instructor Course id :");
            //    crsID = int.Parse(Console.ReadLine());
            //    crs = Program.Courses.FirstOrDefault(c => c.Id == crsID);
            //    if (crs != null)
            //    {
            //        Courses.Add(crs);
            //    }
            //    else
            //    {
            //        Console.WriteLine("Invalid Course ID");
            //    }
            //} while (Courses.Count < crsCount);
            instructor.Courses = Courses;
            Helpers.Hold();
        }

        private void UpdateCourse()
        {
            Course course = new Course();
            Console.WriteLine("Enter question id :");
            int id;
            // id = int.Parse(Console.ReadLine());
            Course crs;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                crs = Program.Courses.Where((c) => c.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This course id should be a number");
                Helpers.Hold();
                return;
            }

            //Course crs = Program.Courses.Where((c) => c.Id == id).SingleOrDefault();
            if (crs == null)
            {
                Console.WriteLine("This Course doesn't exist");
                return;
            }
            Console.WriteLine("Enter course name :");
            course.Name = Console.ReadLine();

            List<Topic> Topics = new List<Topic>();
            int topID;
            Topic top;
            Console.WriteLine("Enter courses Topic :");
            //int topicCount = int.Parse(Console.ReadLine());

            if (int.TryParse(Console.ReadLine(), out int topicCount))
            {
                do
                {
                    Console.WriteLine("Enter Topic id :");
                    //topID = int.Parse(Console.ReadLine());
                    if (int.TryParse(Console.ReadLine(), out topID))
                    {
                        top = Program.Topics.FirstOrDefault(t => t.Id == topID);
                    }
                    else
                    {
                        Console.WriteLine("This topic id should be a number");
                        Helpers.Hold();
                        return;
                    }
                    //top = Program.Topics.FirstOrDefault(t => t.Id == topID);
                    if (top != null)
                    {
                        Topics.Add(top);
                    }
                    else
                    {
                        Console.WriteLine("Invalid Course ID");
                    }
                } while (Topics.Count < topicCount);
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }
            //do
            //{
            //    Console.WriteLine("Enter Topic id :");
            //    topID = int.Parse(Console.ReadLine());
            //    top = Program.Topics.FirstOrDefault(t => t.Id == topID);
            //    if (top != null)
            //    {
            //        Topics.Add(top);
            //    }
            //    else
            //    {
            //        Console.WriteLine("Invalid Course ID");
            //    }
            //} while (Topics.Count < topicCount);
            course.Topics = Topics;
            Helpers.Hold();
        }

        private void UpdateTopic()
        {
            Topic topic = new Topic();
            Console.WriteLine("Enter question id :");

            int id;
            // id = int.Parse(Console.ReadLine());
            Topic tp;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                tp = Program.Topics.Where((t) => t.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This course id should be a number");
                Helpers.Hold();
                return;
            }
            //Topic tp = Program.Topics.Where((t) => t.Id == id).SingleOrDefault();
            if (tp == null)
            {
                Console.WriteLine("This topic doesn't exist");
                return;
            }
            Console.WriteLine("Enter topic name :");
            topic.Name = Console.ReadLine();
            Helpers.Hold();
        }


        private void DeleteStudent()
        {
            Console.WriteLine("Enter student id :");
            int id;
            Student student;
            //id = int.Parse(Console.ReadLine());
            if (int.TryParse(Console.ReadLine(), out id))
            {
                student = Program.Students.Where((s) => s.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }

            //Student student = Program.Students.Where((s) => s.Id == id).SingleOrDefault();
            if (student == null)
            {
                Console.WriteLine("This student doesn't exist");
                return;
            }
            if (student != null) Program.Students.Remove(student);
            Helpers.Hold();
        }

        private void DeleteDepartment()
        {
            Console.WriteLine("Enter department id :");
            int id;
            Department department;
            //id = int.Parse(Console.ReadLine());
            if (int.TryParse(Console.ReadLine(), out id))
            {
                department = Program.Departments.Where((s) => s.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }

            //Department department = Program.Departments.Where((d) => d.Id == id).SingleOrDefault();
            if (department == null)
            {
                Console.WriteLine("This department doesn't exist");
                return;
            }
            if (department != null) Program.Departments.Remove(department);
            Helpers.Hold();
        }

        private void DeleteQuestion()
        {
            Console.WriteLine("Enter department id :");
            int id;
            Question question;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                question = Program.Questions.Where((q) => q.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }

            //Question question = Program.Questions.Where((q) => q.Id == id).SingleOrDefault();
            if (question == null)
            {
                Console.WriteLine("This department doesn't exist");
                return;
            }
            if (question != null) Program.Questions.Remove(question);
            Helpers.Hold();
        }

        private void DeleteInstructor()
        {
            Console.WriteLine("Enter department id :");
            int id;
            //id = int.Parse(Console.ReadLine());
            Instructor instructor;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                instructor = Program.Instructors.Where((i) => i.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This topic id should be a number");
                Helpers.Hold();
                return;
            }

            //Instructor instructor = Program.Instructors.Where((i) => i.Id == id).SingleOrDefault();
            if (instructor == null)
            {
                Console.WriteLine("This department doesn't exist");
                return;
            }
            if (instructor != null) Program.Instructors.Remove(instructor);
            Helpers.Hold();
        }


        private void DeleteCourse()
        {
            Console.WriteLine("Enter department id :");
            int id;
            // id = int.Parse(Console.ReadLine());
            Course course;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                course = Program.Courses.Where((c) => c.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This course id should be a number");
                Helpers.Hold();
                return;
            }

            //Course course = Program.Courses.Where((c) => c.Id == id).SingleOrDefault();
            if (course == null)
            {
                Console.WriteLine("This department doesn't exist");
                return;
            }
            if (course != null) Program.Courses.Remove(course);
            Helpers.Hold();
        }


        private void DeleteTopic()
        {
            Console.WriteLine("Enter department id :");
            int id;
            // id = int.Parse(Console.ReadLine());
            Topic topic;
            if (int.TryParse(Console.ReadLine(), out id))
            {
                topic = Program.Topics.Where((t) => t.Id == id).SingleOrDefault();
            }
            else
            {
                Console.WriteLine("This course id should be a number");
                Helpers.Hold();
                return;
            }

            //Topic topic = Program.Topics.Where((t) => t.Id == id).SingleOrDefault();
            if (topic == null)
            {
                Console.WriteLine("This department doesn't exist");
                return;
            }
            if (topic != null) Program.Topics.Remove(topic);
            Helpers.Hold();
        }

        private void DisplayStudents()
        {
            Program.Students.ForEach(std =>
            {
                Console.WriteLine(std + "\n\n");
            });

            Helpers.Hold();
        }

        private void DisplayDepartments()
        {
            Program.Departments.ForEach(dept =>
            {
                Console.WriteLine(dept + "\n\n");
            });

            Helpers.Hold();
        }

        private void DisplayCourses()
        {
            Program.Courses.ForEach(crs =>
            {
                Console.WriteLine(crs + "\n\n");
            });

            Helpers.Hold();
        }

        private void DisplayInstructors()
        {
            Program.Instructors.ForEach(ins =>
            {
                Console.WriteLine(ins + "\n\n");
            });

            Helpers.Hold();
        }

        private void DisplayTopics()
        {
            Program.Topics.ForEach(top =>
            {
                Console.WriteLine(top + "\n\n");
            });

            Helpers.Hold();
        }
        #endregion        

        #region Assign
        //Promote an instructor to be admin
        public void AssignAdmin()
        {
            int instructorId;
            do
            {
                Console.WriteLine("Enter Instructor Id");
            } while (!int.TryParse(Console.ReadLine(), out instructorId));

            Admin instructor = (Admin)Program.Instructors.Where((i) => i.Id == instructorId).SingleOrDefault();
            if (instructor != null)
            {
                Program.Instructors.Remove(Program.Instructors.Where((i) => i.Id == instructorId).Single());
                Program.Instructors.Add(instructor);
            }
            else
            {
                Console.WriteLine("ID doesn't exist");
            }
                
        }

        //add a course to the instructor courses
        public void AssignInstrucor()
        {
            int instructorId;
            do
            {
                Console.WriteLine("Enter Instructor Id");
            } while (!int.TryParse(Console.ReadLine(), out instructorId));

            int courseId;
            do
            {
                Console.WriteLine("Enter Course Id");
            } while (!int.TryParse(Console.ReadLine(), out courseId));

            Instructor instructor = Program.Instructors.Where((i) => i.Id == instructorId).SingleOrDefault();
            Course course = Program.Courses.Where((c) => c.Id == courseId).SingleOrDefault();

            if (instructor != null && course != null)
            {
                instructor.Courses.Add(course);
            }
            else if (course != null)
                Console.WriteLine("Instructor ID doesn't exist");
            else
                Console.WriteLine("Course ID doesn't exist");
        }

        //add a course to the student courses
        public void AssignStudent()
        {
            int studentId;
            do
            {
                Console.WriteLine("Enter Student Id");
            } while (!int.TryParse(Console.ReadLine(), out studentId));

            int courseId;
            do
            {
                Console.WriteLine("Enter Course Id");
            } while (!int.TryParse(Console.ReadLine(), out courseId));

            Student student = Program.Students.Where((s) => s.Id == studentId).SingleOrDefault();
            Course course = Program.Courses.Where((c) => c.Id == courseId).SingleOrDefault();

            if (student != null && course != null)
                student.Courses.Add(course);
            else if (course != null)
                Console.WriteLine("Student ID doesn't exist");
            else
                Console.WriteLine("Course ID doesn't exist");
        }
        #endregion

        #region Reports
        private void GenerateReportInstructorCourses()
        {
            Console.Write("Enter instructor ID: ");
            int instructorId = Convert.ToInt32(Console.ReadLine());

            var instructor = Program.Instructors.Where((i) => i.Id == instructorId).SingleOrDefault();

            if (instructor != null)
                instructor.Courses.ForEach(delegate (Course course) { Console.WriteLine(course.ToString()); });

            else
                Console.WriteLine("ID doesn't exist");

            Helpers.Hold();
        }

        private void GenerateReportCourseInstructors()
        {
            Console.Write("Enter course ID: ");
            int courseId = Convert.ToInt32(Console.ReadLine());

            var course = Program.Courses.Where((i) => i.Id == courseId).SingleOrDefault();

            if (course != null)
            {
                var result = Program.Instructors.Where((i) => i.Courses.Contains(course)).ToList();

                if (result != null)
                    result.ForEach(delegate (Instructor instructor) { Console.WriteLine(instructor.ToString()); Console.WriteLine("************************"); });
                else
                    Console.WriteLine("No Program.Instructors for this course");
            }

            else
                Console.WriteLine("ID doesn't exist");

            Helpers.Hold();
        }

        private void GenerateReportStudentCourses()
        {

            Console.Write("Enter student ID: ");
            int studentId = Convert.ToInt32(Console.ReadLine());

            var student = Program.Students.Where((s) => s.Id == studentId).SingleOrDefault();

            if (student != null)
                student.Courses.ForEach(delegate (Course course) { Console.WriteLine(course.ToString()); });

            else
                Console.WriteLine("ID doesn't exist");

            Helpers.Hold();
        }

        private void GenerateReportCourseStudents()
        {

            Console.Write("Enter course ID: ");
            int courseId = Convert.ToInt32(Console.ReadLine());

            var course = Program.Courses.Where((i) => i.Id == courseId).SingleOrDefault();

            if (course != null)
            {
                var result = Program.Students.Where((i) => i.Courses.Contains(course)).ToList();

                if (result != null)
                    result.ForEach(delegate (Student student) { Console.WriteLine(student.ToString()); });
                else
                    Console.WriteLine("No Program.Students for this course");
            }

            else
                Console.WriteLine("ID doesn't exist");

            Helpers.Hold();
        }

        private void GenerateReportCourseTopics()
        {

            Console.Write("Enter course ID: ");
            int courseId = Convert.ToInt32(Console.ReadLine());

            var course = Program.Courses.Where((c) => c.Id == courseId).SingleOrDefault();

            if (course != null)
                course.Topics.ForEach(delegate (Topic topic) { Console.WriteLine(topic.ToString()); });
            else
                Console.WriteLine("ID doesn't exist");

            Helpers.Hold();
        }

        private void GenerateReportStudentExamsGrades()
        {

            Console.Write("Enter student ID: ");
            int studentId = Convert.ToInt32(Console.ReadLine());

            var student = Program.Students.Where((s) => s.Id == studentId).SingleOrDefault();

            if (student != null)
            {
                student.Exams.ForEach(delegate (StudentExam studentExam) { Console.WriteLine(studentExam.ToString()); });
            }

            else
                Console.WriteLine("ID doesn't exist");

            Helpers.Hold();
        }
        #endregion


        public void PresentAdminMenu()
        {
            while (true)
            {
                Console.Clear();
                string welcome = "******************************************************************************\n" +
                                $"****Welcome {FirstName + " " + LastName} to ITI Examination System\n" +
                                 "******************************************************************************\n\n";

                Console.WriteLine(welcome + "\nPlease choose an option:");
                Console.WriteLine(
                    "1- Create, Update, or Delete a user\n" +
                    "2- Grant or Revoke authorization\n" +
                    "3- Generate a Report\n" +
                    "4- Instructor menu\n" +
                    "5- ESC to logout");


                var choice = Console.ReadKey();
                Console.Clear();
                switch (choice.Key)
                {
                    case ConsoleKey.D1:
                    case ConsoleKey.NumPad1: { CUDMenu(); break; }
                    case ConsoleKey.D2:
                    case ConsoleKey.NumPad2: { AssignMenu(); break; }
                    case ConsoleKey.D3:
                    case ConsoleKey.NumPad3: { ReportMenu(); break; }
                    case ConsoleKey.D4:
                    case ConsoleKey.NumPad4: { PresentMenu(); break; }
                    case ConsoleKey.Escape: { Program.CurrentUser = null; Program.Type = ""; return; }
                }
            }
        }

        private void CUDMenu()
        {
            Console.WriteLine(
                "1- Add Student                                 2- Add Department\n" +
                "3- Add Question                                4- Add Instructor\n" +
                "5- Add Course                                  6- Add Topic\n" +
                "7- Update Student                              8- Update Department\n" +
                "9- Update Question                             10- Update Instructor\n" +
                "11- Update Course                              12- Update Topic\n" +
                "13- Delete Student                             14- Delete Department\n" +
                "15- Delete Question                            16- Delete Instructor\n" +
                "17- Delete Course                              18- Delete Topic\n" +
                "19- Assign Admin                               21- Assign Instrucor\n" +
                "22- Assign Student                             23- Generate ReportInstructorCourses\n" +
                "24- Generate ReportCourseInstructors           25- Generate ReportStudentCourses\n" +
                "26- Generate ReportCourseStudents              27- Generate ReportCourseTopics\n" +
                "28- GenerateReportStudentExamsGrades           29- Display Students\n" +
                "30- Display Departments                        31- Display Instructors\n" +
                "32- Display Courses                            33- Display Topics\n");
            
            int choice;
            do
            {
            
                Console.WriteLine("Invalid Choice");   
                
            } while (!int.TryParse(Console.ReadLine(), out choice));

            Console.Clear();
            
            switch (choice)
            {
                case 1: AddStudent(); break;
                case 2: AddDepartment(); break;
                case 3: AddQuestion(); break;
                case 4: AddInstructor(); break;
                case 5: AddCourse(); break;
                case 6: AddTopic(); break;
                case 7: UpdateStudent(); break;
                case 8: UpdateDepartment(); break;
                case 9: UpdateQuestion(); break;
                case 10: UpdateInstructor(); break;
                case 11: UpdateCourse(); break;
                case 12: UpdateTopic(); break;
                case 13: DeleteStudent(); break;
                case 14: DeleteDepartment(); break;
                case 15: DeleteQuestion(); break;
                case 16: DeleteInstructor(); break;
                case 17: DeleteCourse(); break;
                case 18: DeleteTopic(); break;
                case 19: AssignAdmin(); break;
                case 21: AssignInstrucor(); break;
                case 22: AssignStudent(); break;
                case 23: GenerateReportInstructorCourses(); break;
                case 24: GenerateReportCourseInstructors(); break;
                case 25: GenerateReportStudentCourses(); break;
                case 26: GenerateReportCourseStudents(); break;
                case 27: GenerateReportCourseTopics(); break;
                case 28: GenerateReportStudentExamsGrades(); break;
                case 29: DisplayStudents(); break;
                case 30: DisplayDepartments(); break;
                case 31: DisplayInstructors(); break;
                case 32: DisplayCourses(); break;
                case 33: DisplayTopics(); break;
                default: Console.WriteLine("Invalid Choice"); break;
            }
        }

        private void AssignMenu()
        {
            Console.WriteLine(
                "1- AssignAdmin\n" +
                "2- AssignInstrucor\n" +
                "3- AssignStudent\n");

            int choice = Convert.ToInt32(Console.ReadLine());

            switch (choice)
            {
                case 1: AssignAdmin(); break;
                case 2: AssignInstrucor(); break;
                case 3: AssignStudent(); break;
                default: Console.WriteLine("Invalid Choice"); break;
            }
        }

        private void ReportMenu()
        {
            int choice;
            do
            {
                Console.WriteLine(
                                "1- GenerateReportInstructorCourses\n" +
                                "2- GenerateReportCourseInstructors\n" +
                                "3- GenerateReportStudentCourses\n" +
                                "4- GenerateReportCourseStudents\n" +
                                "5- GenerateReportCourseTopics\n" +
                                "6- GenerateReportStudentExamsGrades\n");
            } while (!int.TryParse(Console.ReadLine(),out choice));

            switch (choice)
            {
                case 1: GenerateReportInstructorCourses(); break;
                case 2: GenerateReportCourseInstructors(); break;
                case 3: GenerateReportStudentCourses(); break;
                case 4: GenerateReportCourseStudents(); break;
                case 5: GenerateReportCourseTopics(); break;
                case 6: GenerateReportStudentExamsGrades(); break;
                default: Console.WriteLine("Invalid Choice"); break;
            }
        }
    }
}
