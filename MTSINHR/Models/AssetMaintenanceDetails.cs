using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace MTSINHR.Models
{
    public class AssetMaintenanceDetails
    {
        [Display(Name = "Asset Classification")]
        public Int64 AssetTypeId { get; set; }
        public List<SelectListItem> Assettypelist { get; set; }
        [Required]
        [Display(Name ="Category")]
        public string AssetName { get; set; }
        public List<SelectListItem> Assetnamelist { get; set; }
        [Required]
        public string Item { get; set; }
        public List<SelectListItem> Itemlist { get; set; }

        [Display(Name = "Date of Purchase")]
        public DateTime Dateofpurchase { get; set; }
        [Required]
        public string Vendor { get; set; }
        public List<SelectListItem> Vendornamelist { get; set; }
        public string Maintenance_Carried_out { get; set; }
        public double Cost { get; set; }
        public string Notes { get; set; }
    }
}