using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Nationality
    {
        public Int64 Id { get; set; }
        [Required]
        public string nationality { get; set; }
    }
}