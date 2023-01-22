using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System_UML
{
    public class Course
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public List<Exam> Exams { get; set; }

        public List<Topic> Topics { get; set; }

        public List<Question> Questions { get; set; }

        public override string ToString()
        {
            return $"Course ID: {Id}\nCourse name: {Name}";
        }
    }
}
