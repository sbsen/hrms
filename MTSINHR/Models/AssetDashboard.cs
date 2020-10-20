using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class AssetDashboard
    {
        [Required]
        [Display(Name ="Unassign date")]
        public DateTime UnassignedDate { get; set; }
    }
}