using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.DataBlock;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class EmployeeEntryController : SecureController
    {
        // GET: EmployeeEntry
        [HttpPost]
        public ActionResult SetEmployeeCode(string EmpCode)
        {
            try
            {
                TempData["Empcode"] = EmpCode;
                return Content("success");
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
            }
            return Content("failed");
        }

        public ActionResult EmployeeMonthlyAttendance(string AttMonthYear)
        {
            TempData["Empcode"] = Session["EmployeeId"];
            TempData["Date"] = AttMonthYear;
            return RedirectToAction("ReadEmployeeEntry");
        }

        public ActionResult ReadEmployeeEntry()
        {
            ViewBag.EmployeeCode = TempData["Empcode"];
            TempData.Keep("EmpCode");
            ViewBag.Date = Convert.ToDateTime(TempData["Date"]);
            TempData.Keep("Date");
            ViewBag.RoleId = Session["RoleId"];
            return View();
        }
        [HttpPost]
        public JsonResult ReadEmployeeDetail(string EmpCode, string Date, Int64 time=0)

        {
            try {
                MTSHRDataLayer.EmployeeEntry Entry = new MTSHRDataLayer.EmployeeEntry();
                return Json(new { success = true, result = JsonConvert.SerializeObject(Entry.ReadEmployeeDetail(EmpCode, Date, time)) }, JsonRequestBehavior.AllowGet);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
                return Json(new { success = false ,result= JsonConvert.SerializeObject(null) }, JsonRequestBehavior.AllowGet);
            }

        }
    }
}