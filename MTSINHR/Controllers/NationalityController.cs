using System;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Newtonsoft.Json;

namespace MTSINHR.Controllers
{
    public class NationalityController : SecureController
    {
        //
        // GET: /Master/

        public ActionResult Nationality()
        {

            return View();
        }


        public JsonResult Read()
        {
            MTSHRDataLayer.Nationality data_nationality = new MTSHRDataLayer.Nationality();
            return Json(JsonConvert.SerializeObject(data_nationality.Read()), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Edit(Nationality nation)
        {
            MTSHRDataLayer.Nationality data_nationality = new MTSHRDataLayer.Nationality();
            int result = data_nationality.Update(nation.Id, nation.nationality);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Add(Nationality nation)
        {
            MTSHRDataLayer.Nationality data_nationality = new MTSHRDataLayer.Nationality();
            int result = data_nationality.Create(nation.nationality);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);

        }
    }
}