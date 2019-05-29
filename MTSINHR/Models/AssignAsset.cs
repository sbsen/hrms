using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class AssignAsset
    {
        public Int64 AssetId { get; set; }
        public Int64 AssetTypeId { get; set; }
        public string AssetType { get; set; }
        public Int64 AssetNameId { get; set; }
        public string AssetName { get; set; }
        public Int64 AssignTypeId { get; set; }
        public Int64 EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public Int64 CurrentlyAssignedEmployeeId { get; set; }
        public Int64 CurrentlyAssignedEmployeeTo { get; set; }
        public Int64 DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public Int64 LocationId { get; set; }
        public string LocationName { get; set; }
        public string LocationDetails { get; set; }
        public string ActionDate { get; set; }
        public string Notes { get; set; }
    }
}