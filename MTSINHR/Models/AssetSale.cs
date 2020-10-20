using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MTSINHR.Models
{
    public class AssetSale
    {
        [Display(Name ="Asset Classification")]
        public Int64 AssetTypeId { get; set; }
        [Required]
        [Display (Name ="Category")]
        public string AssetName { get; set; }
        [Required]
        public string Item { get; set; }
        public DateTime Date { get; set; }
        public string TypeOfSale { get; set; }
        [Display(Name ="Sale Price")]
        public double SalePrice { get; set; }
        [Display(Name = "Sold To")]
        public string SoldTo { get; set; }
        [Display(Name = "Approved Date")]
        public DateTime ApprovedDate { get; set; }
        public string ApprovedRef { get; set; }
        public string ApprovedBy { get; set; }
        public string Notes { get; set; }
    }
}