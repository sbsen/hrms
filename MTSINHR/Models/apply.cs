using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LeaveApply.Models
{
    public class apply
    {
        public string EmployeeID { get; set; }

        public string EmployeeName { get; set; }

        [Required(ErrorMessage="Select Leave type")]
        [Display(Name = "Leave Type")]
        public string leavetype { get; set; }

        [Required(ErrorMessage = "Select From Date")]
        [Display(Name = "From Date")]
        public DateTime fromdate { get; set; }

        [Display(Name = "FromSession")]
        [Required(ErrorMessage = "Select From Session")]
        public string fromsession { get; set; }
        

        [Required(ErrorMessage = "Select To Date")]
        [Display(Name = "To Date")]
        public DateTime todate { get; set; }

        [Display(Name = "ToSession")]
        public string tosession { get; set; }

        [Required(ErrorMessage="Enter Comment")]
        [Display(Name="Comment")]
        public string comment { get; set; }

    }
}