using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System_UML
{
    public class Department
    {
        public int Id { get; set; }
        
        public string Name { get; set; }

        public Instructor Manager { get; set; }

        public override string ToString()
        {
            return $"Department ID: {Id}\nDepartment name: {Name}";
        }
    }
}
