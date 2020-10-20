using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Education
    {

        [Key]
        public Int64 Id { get; set; }

        [Required]
        public Int64 Employee_Id { get; set; }
        [Required]
        public string SchoolName { get; set; }

        [Required]
        public DateTime? SchoolPassedoutyear { get; set; }

        [Required]
        public string CollegeName { get; set; }

        [Required]
        public DateTime? CollegePassedoutyear { get; set; }

        [Required]
        public string Qualifications { get; set; }


    }
}