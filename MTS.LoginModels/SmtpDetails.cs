using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;
using System.Web.Mvc;

namespace MTS.LoginModels
{
    public class SmtpDetails
    {

        [Required(ErrorMessage = "The SMTP Name field is required"), StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string smtpname { get; set; }

        [Required(ErrorMessage = "The SMTP Host Name field is required"), StringLength(100, ErrorMessage = "Maximum 100 characters is acceptable."), RegularExpression("\\w+\\.\\w+\\.\\w+", ErrorMessage = "Please enter a valid SMTP Host Name.")]
        public string SmtpHostName { get; set; }

        [Required(ErrorMessage = "The SMTP Port field is required")]
        [Display(Name = "Smtp Port")]
        public int? SmtpPort { get; set; }

        [Required(ErrorMessage = "The User Name field is required"), RegularExpression("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", ErrorMessage = "Please enter a valid User Name."), StringLength(50, ErrorMessage = "Maximum 50 characters is acceptable.")]
        public string username { get; set; }

        public string CreatePassword { get; set; }
        [System.ComponentModel.DataAnnotations.Compare("CreatePassword", ErrorMessage = "The Password and Confirm Password do not match.")]
        public string CreateConfirmPassword { get; set; }

        [Required(ErrorMessage = "The Confirm Password field is required")]
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "The Password and Confirm Password do not match")]
        public string ConfirmPassword { get; set; }
        [StringLength(100, ErrorMessage = "Maximum 100 characters is acceptable.")]
        public string Domain { get; set; }

        public string OldPassword { get; set; }
        public Int64 SmtpID { get; set; }

        public bool EnableSSL { get; set; }

        [Required(ErrorMessage = "The Time Out field is required.")]
        public Int32? TimeOut { get; set; }

        [Required(ErrorMessage = "The Delivery Method field is required"), Range(0, 255, ErrorMessage = "The field Delivery Method must be between 0 to 255.")]
        [Display(Name = "Delivery Method")]
        public byte? DeliveryMethod { get; set; }

        public bool DefaultCredentials { get; set; }

        [Required(ErrorMessage = "The Password field is required")]
        public string Password { get; set; }

        public string HidOldPassword { get; set; }


    }
}