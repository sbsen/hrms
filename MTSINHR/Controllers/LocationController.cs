using System;
using System.Web.Mvc;
using MTSINHR.Models;
using Newtonsoft.Json;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class LocationController : SecureController
    {
        // GET: Location
        public ActionResult Location()
        {
            return View();
        }

        public JsonResult Read()
        {
            MTSHRDataLayer.Location location = new MTSHRDataLayer.Location();
            return Json(JsonConvert.SerializeObject(location.Read()), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Edit(AddEditLocation Loc)
        {
            MTSHRDataLayer.Location data_loc = new MTSHRDataLayer.Location();
            int result = data_loc.Update(Loc.LocationID,Loc.LocationName);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);


        }
        [HttpPost]
        public JsonResult Add(AddEditLocation Loc)
        {
            MTSHRDataLayer.Location data_location = new MTSHRDataLayer.Location();
            int result = data_location.Create(Loc.LocationName);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}