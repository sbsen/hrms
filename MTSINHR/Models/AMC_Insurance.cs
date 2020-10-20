using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Models
{
    public class AMC_Insurance
    {
        [Required]
        [Display(Name = "Type")]
        public string Category { get; set; }

        [Required]
        public string VendorName { get; set; }

        [Required]
        [Display(Name = "Asset Classification")]
        public Int64 AssetTypeId { get; set; }

        [Required]
        public string[] Item { get; set; }

        [Required]
        [Display(Name = "Category")]
        public Int64 AssetName { get; set; }

        public Int64 AmcType { get; set; }
        public Int64 InsuranceType { get; set; }
        public double AmcCharges { get; set; }
        public double PremiumCharges { get; set; }
        public double InsuredAmount { get; set; }

        [Required]
        public string PaymentType { get; set; }

        [Required]
        public DateTime PaymentRefDate { get; set; }

        [Required]
        public Int64 PaymentRefNumber { get; set; }

        [Required]
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }

        public string ContactPerson { get; set; }

        [RegularExpression("^[0-9]{10}$", ErrorMessage = "Invalid Phone number ex : 9876543210")]
        public Int64? ContactPhone { get; set; }
        public string Notes { get; set; }

        public Int64? Amc_Document_Id { get; set; }
    }
}