using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace MTSINHR.Models
{
    public class AssetDetails
    {
        //[Required(ErrorMessage = "Select From Date")]
        [Display(Name = "From Date")]
        public DateTime FromDate { get; set; }
        //[Required(ErrorMessage = "Select To Date")]
        [Display(Name = "To Date")]
        public DateTime ToDate { get; set; }
    }
}