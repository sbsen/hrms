using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class AllEmployeeDocuments
    {
        [Required(ErrorMessage="Please Select Employee Name")]
        public Int64 Employee_Id { get; set; }

        [Required]
        public Int64 Documents { get; set; }


    }
}