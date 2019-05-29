using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MTSINHR.Models
{
    public class Vendors
    {
        public Int64 Id { get; set; }

        public string Type { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Address { get; set; }

        [Required]
        public string City { get; set; }

        [Required]
        [RegularExpression("^([0-9]+)$", ErrorMessage = "Please Enter Numbers only")]
        public string Phone { get; set; }

        [Required]
        [Display(Name = "Contact Person ")]
        public string ContactPerson { get; set; }

        [Required]
        [Display(Name="Mobile Number")]
        [RegularExpression("^[+]+[0-9]{12,15}$", ErrorMessage = "Invalid Phone number ex:+919876543210")]
        public string MobileNo { get; set; }

        [Required]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Invalid EmailId")]
        public string Email { get; set; }

    }
}