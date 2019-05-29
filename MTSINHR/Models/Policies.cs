using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Policies
    {
        public Int64 Id { get; set; }

        [Required]
        [Display(Name ="Policy Name")]
        public string PolicyName{ get; set; }

       

    }
}