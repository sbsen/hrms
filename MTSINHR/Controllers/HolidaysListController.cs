using MTS.Controllers;
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
    public class HolidaysListController : SecureController
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

        public object getMtsHolidaysList()
        {
            MTSHRDataLayer.Holidays holidays = new MTSHRDataLayer.Holidays();
            var MtsHolidaysList = holidays.getMtsHolidaysList();
            List<SelectListItem> mtsHolidaysList = new List<SelectListItem>();
            mtsHolidaysList.Add(new SelectListItem() { Text = "Select Holiday Name" });
            for (int i = 0; i < MtsHolidaysList.Tables[0].Rows.Count; i++)
            {
                mtsHolidaysList.Add(new SelectListItem() { Value = MtsHolidaysList.Tables[0].Rows[i]["Holidays"].ToString(), Text = MtsHolidaysList.Tables[0].Rows[i]["Holidays"].ToString()});
            }
            return JsonConvert.SerializeObject(mtsHolidaysList);
        }

        [HttpPost]
        public JsonResult AddHolidayName(string HolidayName)
        {
            MTSHRDataLayer.Holidays data_createmtsholiday = new MTSHRDataLayer.Holidays();
            int result = data_createmtsholiday.CreateMtsHolidaysList(HolidayName);
            object _getMtsHolidaysList = getMtsHolidaysList();
            return Json(new { success= result, mtsHolidaysList= _getMtsHolidaysList });
        }

    }
}
