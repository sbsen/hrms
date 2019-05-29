using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class AssetSale
    {
        public Int64 AssetTypeId { get; set; }
        public string AssetName { get; set; }
        public DateTime Date { get; set; }
        public string TypeOfSale { get; set; }
        public double SalePrice { get; set; }
        public string SoldTo { get; set; }
        public DateTime ApprovedDate { get; set; }
        public string ApprovedRef { get; set; }
        public string ApprovedBy { get; set; }
        public string Notes { get; set; }
    }
}