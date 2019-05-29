using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Address
    {
        public Int64 Id { get; set; }

        public Int64 Employee_Id { get; set; }

        public string Current_Building { get; set; }

        public string Current_City { get; set; }

        public string Current_State { get; set; }

        public Int64 Current_Pincode { get; set; }

        [Required]
        public string Permanent_Building { get; set; }

        [Required]
        public string Permanent_City { get; set; }

        [Required]
        public string Permanent_State { get; set; }

        [Required]
        public Int64 Permanent_Pincode { get; set; }


    }
}