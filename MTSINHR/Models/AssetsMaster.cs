using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class AssetsMaster
    {
        public Int64 Id { get; set; }
        public Int64 AssetTypeId { get; set; }
        public string AssetName { get; set; }
        public decimal AssetDepreciation { get; set; }
        public Int64 ExpectedLife { get; set; }
        public Int64 SalvageValue { get; set; }
    }
}