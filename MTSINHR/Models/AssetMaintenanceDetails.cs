using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class AssetMaintenanceDetails
    {
        public Int64 AssetTypeId { get; set; }
        public string AssetName { get; set; }
        public DateTime Dateofpurchase { get; set; }
        public string Vendor { get; set; }
        public string Maintenance_Carried_out { get; set; }
        public double Cost { get; set; }
        public string Notes { get; set; }
    }
}