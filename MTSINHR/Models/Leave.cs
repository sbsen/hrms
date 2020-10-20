using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Models
{
    public class Leave
    {
        public Int64 id { get; set; }
        
        public Int64 Employee_Id { get; set; }

        [Display(Name = "Employee Name")]
        public string EmployeeName { get; set; }

        [Required(ErrorMessage="Select Leave type")]
        [Display(Name = "Leave Type")]
        public Int64 LeaveType { get; set; }

        [Required(ErrorMessage = "Select From Date")]
        [Display(Name = "From Date")]
        public DateTime FromDate { get; set; }

        [Display(Name = "FromSession")]
        [Required(ErrorMessage = "Select From Session")]
        public string LeaveFromSession { get; set; }
        

        [Required(ErrorMessage = "Select To Date")]
        [Display(Name = "To Date")]
        public DateTime ToDate { get; set; }


        [Display(Name = "ToSession")]
        public string LeaveToSession { get; set; }


        [Display(Name = "Reason")]
        [Required(ErrorMessage = "Enter Reason")]
        [MaxLength(25, ErrorMessage = "Reason cannot be longer than 25 characters.")]
        public string Reason { get; set; }


        public Int64 Approval { get; set; }

        [Required(ErrorMessage = "Select your Manager")]
        [Display(Name = "Send To")]
        public Int64 Managerid { get; set; }

        public Int64 CanceledBy { get; set; }

        public Int64 ApprovedBy { get; set; }

        public decimal NumberOfDays { get; set; }

        public decimal NumberOfDaysForMonth { get; set; }

        public decimal leavebalance { get; set; }

         [Display(Name = "Lop Days")]
        public decimal lopDays { get; set; }
        [Required]
        public string Year { get; set; }

        [Required]
        public string Month { get; set; }

        public string DateRange { get; set; }

        public DateTime ReportYear { get; set; }

        public DateTime ReportMonth { get; set; }

        public string[] ReportDays { get; set; }

        public bool isLOP { get; set; }
    }
}