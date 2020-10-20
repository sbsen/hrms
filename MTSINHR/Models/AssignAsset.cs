using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class AssignAsset
    {
        [Required]
        [Display(Name = "Asset Classification")]
        public Int64 AssetTypeId { get; set; }

        [Required]
        [Display(Name = "Item Code")]
        public string ItemCode { get; set; }
        
        public string Description { get; set; }

        [Required]
        [Display(Name = "Category")]
        public Int64 AssetNameId { get; set; }

        [Required]
        [Display(Name = "Assign Type")]
        public Int64 AssignTypeId { get; set; }

        [Required]
        [Display(Name = "Employee Name")]
        public Int64 EmployeeId { get; set; }

        [Display(Name = "Currently Assigned To")]
        public Int64 CurrentlyAssignedEmployeeId { get; set; }

        [Required]
        [Display(Name = "Department")]
        public Int64 DepartmentId { get; set; }

        [Required]
        [Display(Name = "Location")]
        public Int64 LocationId { get; set; }

        [Display(Name = "Location Details")]
        public Int64 LocationDetails { get; set; }


       // [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0: dd-MMM-yy}")]
        [Required]
        [Display(Name = "Action Date")]
        public DateTime ActionDate { get; set; }

        public string Notes { get; set; }
    }
}