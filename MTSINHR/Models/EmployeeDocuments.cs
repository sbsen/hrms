using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class EmployeeDocuments
    {


        [Required]
        public string Documents { get; set; }
    }
}