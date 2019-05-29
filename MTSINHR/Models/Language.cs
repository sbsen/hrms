using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Language
    {
        [Key]
        public Int64 Id { get; set; }

        [Required]
        [RegularExpression(@"^[a-zA-Z]+[ a-zA-Z]*$", ErrorMessage = "Use Characters only")]
        public string Languagename { get; set; }
    }
}