using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class BankDetails
    {
        
        public Int64 id { get; set; }

        public bool Flag { get; set; }

        [Required]
        [Display(Name = "Employee Id")]
        public Int64 Employee_Id{get;set;}
       
        [Required]
        [Display(Name = "Bank Name")]
        public string Bankname { get; set; }

        [Required]
        [Display(Name = "Branch Name")]
        public string Branchname { get; set; }

        [Required]
        [Display(Name = "Account Number")]
        public string Accountnumber { get; set; }

        [Required]
        [Display(Name = "IFSC Code")]
        public string Ifsccode { get; set; }

        public DateTime FromDate { get; set; }

        public DateTime ToDate { get; set; }


    }
}