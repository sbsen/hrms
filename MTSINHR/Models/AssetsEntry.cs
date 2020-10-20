using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MTSINHR.Models
{
    public class AssetsEntry
    {
        public Int64? Id { get; set; }

        [Display(Name = "Purchase Order Number")]
        public string PurchaseOrderNumber { get; set; }


        [Required]
        [Display(Name = "Category")]
        public Int64 AssetName { get; set; }

        [Required]
        [Display(Name = "Asset Classification")]
        public Int64 AssetType { get; set; }

        [Required]
        [Display(Name = "Asset Description")]
        public string AssetDescription { get; set; }

        [Required]
        [Display(Name = "Cost In Rs")]
        public double CostInRs { get; set; }

        
        [Display(Name = "Cost Type ")]
        public int CostType { get; set; }

        [Required]
        [Display(Name = "Category")]
        public Int64 CategoryId { get; set; }

        [Required]
        [Display(Name = "Make")]
        public string Make { get; set; }

        
        public string InvoiceFile { get; set;}

        [Display(Name = "Model")]
        public string Model { get; set; }


        [Display(Name = "Serial Number")]
        public string SerialNumber { get; set; }

       
        [Display(Name = "Purchase Order Date")]
        public DateTime? PurchasedOn { get; set; }

        [Display(Name = "Location")]
        public Int64 LocationId { get; set; }

        [Display(Name = "Assigned To")]
        public Int64 AssignedTo { get; set; }

        [Display(Name = "Discarded On")]
        public DateTime DiscardedOn { get; set; }

        [Required]
        [Display(Name = "In Use")]
        public Boolean InUse { get; set; }

        [Required]
        [Display(Name = "Purchased Date ")]
        public DateTime BillDate { get; set; }

        [Required]
        [Display(Name = "Bill Number")]
        public string BillNumber { get; set;}

        [Required]
        [Display(Name = "Vendor Name")]
        public Int64 VendorName { get; set;}

        [Display(Name = "Vendor Name")]
        public Int64 VendorNames { get; set; }

        [Display(Name = "Warranty Months")]
        public Int64? WarrantyMonths { get; set;}


     //   [Required]
        [Display(Name = "Asset Code")]
        public string IdentificationCode { get; set; }

        [Display(Name = "Warranty Start Date")]
        public DateTime? WarrantyStartDate { get; set; }

        [Display(Name = "Warranty End Date")]
        public DateTime? WarrantyEndDate { get; set; }

        [Required]
        [Display(Name = "Asset Classification")]
        public Int64 AssetTypeId { get; set; }

        [Required]
        [Display(Name = "Category")]
        public Int64 AssetNameId { get; set; }

        public Int64? InvoiceId { get; set; }
    }
}