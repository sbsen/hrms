using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Holidays
    {

        public Int64 Id { get; set; }

        public string YearOfHoliday { get; set; }

        public string HolidayReason { get; set; }

        public DateTime DateOfHoliday { get; set; }

        public string DayName { get; set; }
    }
}