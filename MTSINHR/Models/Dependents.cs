using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Dependents
    {

        public Int64 id { get; set; }

        [Required]
        public Int64 Employee_Id { get; set; }

        [Required]
        public string DependentName { get; set; }

        [Required]
        public Int64 Relation { get; set; }

        [Required]
        public DateTime DateofBirth { get; set; }

    }
}