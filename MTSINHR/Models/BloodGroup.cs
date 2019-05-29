using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class BloodGroup
    {

        public Int64 Id { get; set; }

        [Required]
        public string Blood_Group { get; set; }

    }
}