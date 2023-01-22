using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System_UML
{
    public class StudentExam
    {
        public Exam Exam { get; set; }
        
        public DateOnly Date { get; set; }
        
        public string Answers { get; set; }
        
        public double Grade { get; set; }

        public bool Taken { get; set; }

        public override string ToString()
        {
            return $"Exam ID: {Exam.Id}\nExam Date: {Date}\nGrade:{Grade}%";
        }
    }
}
