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
    public class BloodGroupController : SecureController
    {
        //
        // GET: /BloodGroup/

        public ActionResult BloodGroup()
        {

            return View();
        }


        public JsonResult Read()
        {
            MTSHRDataLayer.BloodGroup bloodgroup = new MTSHRDataLayer.BloodGroup();
            return Json(JsonConvert.SerializeObject(bloodgroup.Read()), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Edit(BloodGroup bg)
        {
            MTSHRDataLayer.BloodGroup data_bloodgroup = new MTSHRDataLayer.BloodGroup();
            int result = data_bloodgroup.Update(bg.Id,bg.Blood_Group);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Add(BloodGroup bg)
        {
            MTSHRDataLayer.BloodGroup data_bloodgroup = new MTSHRDataLayer.BloodGroup();
            int result = data_bloodgroup.Create(bg.Blood_Group);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}
