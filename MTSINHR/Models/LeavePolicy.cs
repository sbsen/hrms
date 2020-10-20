using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class LeavePolicy
    {
        public Int64 Id { get; set; }

        [Required]
        public string LeaveType { get; set; }

        [Required]
        public string LeaveCode { get; set; }

        [Required]
        public int ApplicableAfter { get; set; }

        [Required]
        public int ApplicableFor { get; set; }

        [Required]
        public int MaritalStatus { get; set; }

        [Required]
        public int Accural { get; set; }

        public int MaxAllowBal { get; set; }

        public int ConsecutiveLeave { get; set; }

        public string ADJUSTMENT_LEAVE_AGAINST { get; set; }

        public string LEAVE_CANNOT_TAKE_TOGETHER { get; set; }

        public int ENABLE_UPLOAD_DOC_FOR_EXCEEDED_DAYS { get; set; }

        public int PRORATA { get; set; }
    }
}