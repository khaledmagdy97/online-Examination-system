using Examination_System_UML;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System_UML
{
    public class Question
    {
        public int Id { get; set; }
        
        public string Statement { get; set; }

        public List<string> Choices { get; set; }

        public char Answer { get; set; }

        public string Type { get; set; }

        public int CourseId { get; set; }

        public override string ToString()
        {
            string s = $"{Statement}\n";
            char c = 'a';

            foreach (var item in Choices)
            {
                s += $"{c++}. {item}\n";
            }

            return s;
        }
    }
}