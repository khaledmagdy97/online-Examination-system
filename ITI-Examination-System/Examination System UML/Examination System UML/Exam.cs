using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System_UML
{
    public class Exam
    {
        public int Id { get; set; }

        public int CourseId { get; set; }

        public List<Question> Questions { get; set; }

        public override string ToString()
        {
            string exam = "";
            int i = 1;
            foreach (var question in Questions)
            {
                exam+= $"{i}- {question}";
                exam += "\n\n";
                i++;
            }

            return exam;
        }
    }
}
