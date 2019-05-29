using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace MTS.LoginModels
{
    public class PasswordLengthAttribute : ValidationAttribute
    {
        public static int _maximum { get; set; }
        public static int _minimum { get; set; }
        public static string PasswordRegex { get; set; }
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            
            if (value != null)
            {
                Regex regexPass = new Regex(PasswordRegex);
                Match m = regexPass.Match(value.ToString());
                string pass = value.ToString();
                string sErrorMessage = "Password should be minimum of 8 character and maximum of 10 character";
                string RegexErrorMessage = "Only alphanumeric characters are allowed";
                if (!(pass.Length >= _minimum))
                {
                    return new ValidationResult(sErrorMessage);
                }
                if (!(m.Success))
                {
                     return new ValidationResult(RegexErrorMessage);
                }
            }
            return ValidationResult.Success;
        }
    }
}