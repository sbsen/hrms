using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Assets
    {
        public Int64 Id { get; set; }
        public string PurchaseOrderNumber { get; set; }
        public Int64 AssetName { get; set; }
        public Int64 AssetType { get; set; }
        public string AssetDescription { get; set; }
        public double CostInRs { get; set; }
        public int CostType { get; set; }
        public Int64 CategoryId { get; set; }
        public string Make { get; set; }
        public string InvoiceFile { get; set;}
        public string Model { get; set; }
        public string SerialNumber { get; set; }
        public DateTime PurchasedOn { get; set; }
        public Int64 LocationId { get; set; }
        public Int64 AssignedTo { get; set; }
        public DateTime DiscardedOn { get; set; }
        public Boolean InUse { get; set; }
        public DateTime BillDate { get; set; }
        public string BillNumber { get; set;}
        public Int64 VendorName { get; set;}
        public Int64 WarrantyMonths { get; set;}
        public string IdentificationCode { get; set; }
        public DateTime WarrantyStartDate { get; set; }
        public DateTime WarrantyEndDate { get; set; }
        public Int64 AssetTypeId { get; set; }
        public Int64 AssetNameId { get; set; }

    }
}