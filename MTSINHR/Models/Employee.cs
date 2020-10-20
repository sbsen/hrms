using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Employee
    {
        public Int64 id { get; set; }

        [Required]
        [Display(Name = "Employee Id")]
        public string Employee_ID { get; set; }

        [Required]
        [Display(Name = "First Name")]
        [RegularExpression("^([a-zA-Z .]+)$", ErrorMessage = "Invalid Firstname")]
        public string Firstname { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        [RegularExpression("^([a-zA-Z .]+)$", ErrorMessage = "Invalid Lastname")]
        public string Lastname { get; set; }

        [Required]
        [Display(Name = "Gender")]
        public Int64 Gender { get; set; }

        [Required]
        [Display(Name = "Date of Birth")]
        public DateTime Dateofbirth { get; set; }


        [Required]
        [Display(Name = "Date of Join")]
        public DateTime Dateofjoin { get; set; }

        [Required]
        [Display(Name = "Designation")]
        public Int64 Designation { get; set; }


        //[Required]
        //public string Department { get; set; }
        [Required]
        [Display(Name = "Department")]
        public Int64 DepartmentId { get; set; }

        
        [Required]
        [Display(Name = "Functional Role")]
        public Int64 FunctionalRole { get; set; }

        [Required]
        [Display(Name = "Nationality")]
        public Int64 Nationality { get; set; }


        [Required]
        [Display(Name = "Father Name")]
        [RegularExpression("^([a-zA-Z .]+)$")]
        public string Fathername { get; set; }

        [Required]
        [Display(Name = "Marital Status ")]
        public Int64 Maritalstatus { get; set; }


        [Display(Name = "Spouse Name")]
        [RegularExpression("^([a-zA-Z .]+)$")]
        public string Spousename { get; set; }

        [Required]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$",ErrorMessage = "Invalid EmailId")]
        public string Email { get; set; }

        [Required]
        [RegularExpression("^[+]+[0-9]{12,15}$", ErrorMessage = "Invalid Phone number ex:+919876543210")]
        public string Mobile { get; set; }

        //[Required]
        [RegularExpression("^([0-9]+)$", ErrorMessage = "Please Enter Numbers only")]
        public Int64? Aadhar { get; set; }

        //[Required]
        [RegularExpression("^([a-zA-Z0-9]+)$", ErrorMessage = "Please Enter AlphaNumeric Values only")]
        public string Pancard { get; set; }


        [Display(Name = "ESI Number")]
        [RegularExpression("^([0-9]+)$", ErrorMessage = "Please Enter Numbers only")]
        public string ESI_Number { get; set; }
      

        //[Required]
         [Display(Name = "PF Account Number")]
        [RegularExpression("^([a-zA-Z0-9]+)$", ErrorMessage = "Please Enter AlphaNumeric Values only")]
        public string PF_AccountNumber { get; set; }

        //[Required]
        [Display(Name = "PF UAN")]
        [RegularExpression("^([0-9]+)$", ErrorMessage = "Please Enter Numbers only")]
        public Int64? PF_UAN { get; set; }

        
       
    }
   
}