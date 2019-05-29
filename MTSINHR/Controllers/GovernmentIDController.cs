using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Newtonsoft.Json;

namespace MTSINHR.Controllers
{
    public class GovernmentIDController : SecureController
    {

        public ActionResult GovernmentID()
        {
            return View();
        }

        public JsonResult Read()
        {
            MTSHRDataLayer.GovernmentID governmentid = new MTSHRDataLayer.GovernmentID();
            return Json(JsonConvert.SerializeObject(governmentid.Read()), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Edit(GovernmentID gov)
        {
            MTSHRDataLayer.GovernmentID data_governmentid = new MTSHRDataLayer.GovernmentID();
            int result = data_governmentid.Update(gov.id, gov.idname);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Add(GovernmentID gov)
        {
            MTSHRDataLayer.GovernmentID data_governmentid = new MTSHRDataLayer.GovernmentID();
            int result = data_governmentid.Create(gov.idname);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}