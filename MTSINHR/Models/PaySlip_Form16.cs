using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

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

         
    }
}