using System;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Newtonsoft.Json;

namespace MTSINHR.Controllers
{
    public class MaritalStatusController : SecureController
    {
        public ActionResult MaritalStatus()
        {
            return View();
        }

        public JsonResult Read()
        {
            MTSHRDataLayer.MaritalStatus data_maritalstatus = new MTSHRDataLayer.MaritalStatus();
            return Json(JsonConvert.SerializeObject(data_maritalstatus.Read()), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Edit(MaritalStatus marital)
        {
            MTSHRDataLayer.MaritalStatus data_maritalstatus = new MTSHRDataLayer.MaritalStatus();
            int result = data_maritalstatus.Update(marital.Id, marital.maritalstatus);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Add(MaritalStatus marital)
        {
            MTSHRDataLayer.MaritalStatus data_maritalstatus = new MTSHRDataLayer.MaritalStatus();
            int result = data_maritalstatus.Create(marital.maritalstatus);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}