using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Controllers
{
    public class ShowHolidaysController : Controller
    {
        //
        // GET: /ShowHolidays/

        public ActionResult ShowHolidays()
        {
            return View();
        }

        public JsonResult Read(string str)
        {
            MTSHRDataLayer.Holidays holidays = new MTSHRDataLayer.Holidays();
            return Json(JsonConvert.SerializeObject(holidays.Read(str), new IsoDateTimeConverter() { DateTimeFormat = "dd/MMM/yyyy" }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadUpCommingHoliday(string str)
        {
            MTSHRDataLayer.Holidays holidays = new MTSHRDataLayer.Holidays();
            return Json(JsonConvert.SerializeObject(holidays.ReadUpCommingHoliday(str), new IsoDateTimeConverter() { DateTimeFormat = "dd/MMM/yyyy" }), JsonRequestBehavior.AllowGet);
        }
    }
}
