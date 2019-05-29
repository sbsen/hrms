using MTSINHR.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class QualificationController : SecureController
    {
        //
        // GET: /Qualification/

        public ActionResult Qualification()
        {

            return View();
        }


        public JsonResult Read()
        {
            MTSHRDataLayer.Qualification qualification = new MTSHRDataLayer.Qualification();
            return Json(JsonConvert.SerializeObject(qualification.Read()), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Edit(Qualification qual)
        {
            MTSHRDataLayer.Qualification data_qualification = new MTSHRDataLayer.Qualification();
            int result = data_qualification.Update(qual.Id, qual.qualification);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Add(Qualification qual)
        {
            MTSHRDataLayer.Qualification data_qualification = new MTSHRDataLayer.Qualification();
            int result = data_qualification.Create(qual.qualification);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}
