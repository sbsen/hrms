using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class AMC_Insurance
    {
        public Int64 Category { get; set; }
        public string VendorName { get; set; }
        public Int64 AssetTypeId { get; set; }
        public string AssetName { get; set; }
        public Int64 AmcType { get; set; }
        public Int64 InsuranceType { get; set; }
        public double AmcCharges { get; set; }
        public double PremiumCharges { get; set; }
        public double InsuredAmount { get; set; }
        public string PaymentType { get; set; }
        public DateTime PaymentRefDate { get; set; }
        public Int64 PaymentRefNumber { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public string ContactPerson { get; set; }
        public Int64 ContactPhone { get; set; }
        public string Notes { get; set; }
    }
}