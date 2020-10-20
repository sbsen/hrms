using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class LeaveType
    {

       
        public Int64 Id { get; set; }

        [Required]
        public string Leavetype { get; set; }

        [Required]
        public Int64 Numberofdays { get; set; }

        [Required]
        public Int64  Department { get; set; }

        [Required]
        public Int64 HolidayAsLeave { get; set; }
    }
}