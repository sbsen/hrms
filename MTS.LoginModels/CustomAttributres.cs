using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MTS.LoginModels.CustomAttributres
{
    public class DynamicRegexAttribute : RegularExpressionAttribute
    {

        public DynamicRegexAttribute( string RegexName ): base(GetRegex(RegexName))
        {
            ErrorMessage = DynamicErrorMessage;
            
        }

        private static string DynamicErrorMessage { get; set; }

        private static string GetRegex(string RegexName)
        {
            // TODO: Get your RegEx here from Database
            string gg = RegexName;
            DynamicErrorMessage = "Message From Database";
            return @"^[159-]{3,6}$";
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            String fdff = value.ToString();
            return ValidationResult.Success;
        }

    }

    public class ExcludeChar : ValidationAttribute
    {
        private readonly string _chars;

        public ExcludeChar(string chars)
            : base("{0} contains invalid character.")
        {
            _chars = chars;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                for (int i = 0; i < _chars.Length; i++)
                {
                    var valueAsString = value.ToString();
                    if (valueAsString.Contains(_chars[i]))
                    {
                        var errorMessage = FormatErrorMessage(validationContext.DisplayName);
                        return new ValidationResult(errorMessage);
                    }
                }
            }
            return ValidationResult.Success;
        }
    }
}