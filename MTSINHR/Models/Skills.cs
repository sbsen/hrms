using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class EmployeeSkills
    {
        
        public Int64 Id { get; set; }

        [Required]
        public string Employee_Id { get; set; }

        [Required]
        public string[] Skill { get; set; }

        [Required]
        public string Certificationname { get; set; }

    }

    public class Skills
    {

        public Int64 Id { get; set; }

        [Required]
        public string Skill { get; set; }
    }

}