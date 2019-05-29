using MTSINHR.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Controllers
{
    public class HolidaysListController : Controller
    {
        //
        // GET: /HolidaysList/

        public ActionResult HolidaysList()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Add(Holidays holidays)
        {
            MTSHRDataLayer.Holidays data_holidays = new MTSHRDataLayer.Holidays();
            int result = data_holidays.CreateHolidaysList(holidays.YearOfHoliday, holidays.HolidayReason, holidays.DateOfHoliday, holidays.DayName);
            return Json(new { success = result });
        }

        [HttpPost]
        public JsonResult Edit(Holidays holidays)
        {
            MTSHRDataLayer.Holidays data_holidays = new MTSHRDataLayer.Holidays();
            int result = data_holidays.Update(holidays.Id, holidays.YearOfHoliday, holidays.HolidayReason, holidays.DateOfHoliday, holidays.DayName);
            return Json(new { success = result });
        }

        public JsonResult Read(string str)
        {
            MTSHRDataLayer.Holidays holidays = new MTSHRDataLayer.Holidays();
            return Json(JsonConvert.SerializeObject(holidays.Read(str), new IsoDateTimeConverter() { DateTimeFormat = "dd/MMM/yyyy" }), JsonRequestBehavior.AllowGet);
        }

    }
}
