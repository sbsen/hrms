using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace MTS.LoginModels
{
    public class EmailTemplate
    {
        public Int64 TempId { get; set; }
        public Int64 SMTPId { get; set; }
        public string TempName { get; set; }
        [RegularExpression("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", ErrorMessage = "Please enter a valid Email id."), StringLength(50, ErrorMessage = "Maximum 50 characters is acceptable.")]
        [Display(Name = "To mail")]
        public string ToMail { get; set; }
        [Required(ErrorMessage = "From mail is required"), RegularExpression("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", ErrorMessage = "Please enter a valid Email id."), StringLength(50, ErrorMessage = "Maximum 50 characters is acceptable.")]
        [Display(Name = "From mail")]
        public string FromMail { get; set; }
        [RegularExpression("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", ErrorMessage = "Please enter a valid Email id."), StringLength(50, ErrorMessage = "Maximum 50 characters is acceptable.")]
        [Display(Name = "Cc mail")]
        public string CcMail { get; set; }
        [RegularExpression("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", ErrorMessage = "Please enter a valid Email id."), StringLength(50, ErrorMessage = "Maximum 50 characters is acceptable.")]
        [Display(Name = "BCc mail")]
        public string BCcMail { get; set; }
        [Required(ErrorMessage = "Subject is required"), StringLength(50, ErrorMessage = "Maximum 50 characters is acceptable.")]
        [Display(Name = "Subject")]
        public string Subjects { get; set; }
        [Required(ErrorMessage = "Body is required"), StringLength(500, ErrorMessage = "Maximum 500 characters is acceptable.")]
        [Display(Name = "Body")]
        public string Body { get; set; }
        [Display(Name = "Active")]
        public bool Active { get; set; }
    }
}
