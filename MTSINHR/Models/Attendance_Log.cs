using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace MTSINHR.Models
{
    public class Attendance_Log
    {
        public Int64? Attendance_Document_Id { get; set; }

        [Required]
        public DateTime Date { get; set; }
    }
}