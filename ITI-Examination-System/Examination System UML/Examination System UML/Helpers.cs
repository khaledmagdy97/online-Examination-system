using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System_UML
{
    public static class Helpers
    {
        public static void PrintList<T>(this IList<T> ls)
        {
            foreach (var item in ls)
            {
                Console.WriteLine(item.ToString());
            }
        }

        public static List<Question> AddQuestions()
        {
            List<string> files = new List<string>() { "Questions/c++ mcq.txt", "Questions/c++ tf.txt", "Questions/DB_MCQ.txt", "Questions/DB_TF.txt", "Questions/HTML5 mcq.txt", "Questions/HTML5 tf.txt", "Questions/MCQ_JS_Questions.txt", "Questions/T&F_JS_Questions.txt" };
            
            List<Question> questions= new List<Question>();

            int i = 1, j = 1, id = 1;

            foreach (var file in files)
            {
                string contents = File.ReadAllText(file);
                var lines = contents.Split("$$$$$$\r\n");
                int k = 0;

                while(k< lines.Length)
                {
                    if (i == 1)
                    {
                        var statment = lines[k];
                        var c1 = lines[k + 1];
                        var c2 = lines[k + 2];
                        var c3 = lines[k + 3];
                        var c4 = lines[k + 4];
                        var ans = lines[k + 5];
                        k += 6;


                        questions.Add(new Question
                        {
                            Id = id++,
                            CourseId = j,
                            Answer = ans[0],
                            Statement = statment.Substring(0, statment.Length - 2),
                            Type = "MCQ",
                            Choices = new List<string> { c1.Substring(0, c1.Length - 2), c2.Substring(0, c2.Length - 2), c3.Substring(0, c3.Length - 2), c4.Substring(0, c4.Length - 2) },
                        });

                    }
                    else
                    {
                        var statment = lines[k];
                        var ans = lines[k + 1];
                        k += 2;

                        questions.Add(new Question
                        {
                            Id = id++,
                            CourseId = j,
                            Answer = ans[0],
                            Statement = statment.Substring(0, statment.Length - 1),
                            Type = "TF",
                            Choices = new List<string> { "True", "False" },
                        });
                    }
                }

                i++;

                if(i == 3)
                {
                    i = 1;
                    j++;
                }
            }

            Program.Courses.ForEach(delegate (Course course)
            {
                course.Questions.AddRange(questions.Where((q)=>q.CourseId == course.Id));
            });

            return questions;
        }

        public static void Hold()
        {
            Console.WriteLine("Press y to return");
            while (Console.ReadKey().Key != ConsoleKey.Y) ;
        }

        
    }
}

