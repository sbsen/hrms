using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace MTSINHR.Models
{
    public class AssetsMaster
    {
        public Int64 Id { get; set; }
        public Int64 AssetTypeId { get; set; }
        public string AssetName { get; set; }

        [Required]
        [RegularExpression("^([0-9]+)$", ErrorMessage = "Please Enter Numbers only")]
        public decimal AssetDepreciation { get; set; }
        [Required]
        [RegularExpression("^([0-9]+)$", ErrorMessage = "Please Enter Numbers only")]
        public Int64 ExpectedLife { get; set; }
        [Required]
        [RegularExpression("^([0-9]+)$", ErrorMessage = "Please Enter Numbers only")]
        public Int64 SalvageValue { get; set; }
    }
}