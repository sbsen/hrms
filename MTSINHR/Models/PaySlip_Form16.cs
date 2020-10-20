using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Models
{
    public class PaySlip_Form16
    {

        [Required(ErrorMessage = "Please Choose the option")]
        [Display(Name = "Select Payslip/Form16")]

        public object datas { get; set; }
		
        public string Payform { get; set; }

         [Required]
         public string Date { get; set; }

        [Display(Name = "Select Employee")]
        public string Employee_ID { get; set; }
        public List<SelectListItem> EmployeeList { get; set; }

    }
}