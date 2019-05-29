using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MTSINHR.Models
{
    public class Location
    {
        public Int64 LocationID { get; set; }
        public Int64 LocationName { get; set; }
    }

    public class AddEditLocation
    {
        public Int64 LocationID { get; set; }
        [Required]
        public string LocationName { get; set; }
    }

}