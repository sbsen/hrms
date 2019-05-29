using System;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Newtonsoft.Json;

namespace MTSINHR.Controllers
{
    public class DesignationController : SecureController
    {
        //
        // GET: /Master/

        public ActionResult Designation()
        {

            return View();
        }

        
        public JsonResult Read()
        {
            MTSHRDataLayer.Designation designation = new MTSHRDataLayer.Designation();
            return Json(JsonConvert.SerializeObject(designation.Read()), JsonRequestBehavior.AllowGet);            
        }

        [HttpPost]
        public JsonResult Edit(Designation desig) 
        {
            MTSHRDataLayer.Designation data_designation = new MTSHRDataLayer.Designation();
            int result = data_designation.Update(desig.Id, desig.designation); 
           return Json(new { success = result }, JsonRequestBehavior.AllowGet);
            

        }
        [HttpPost]
        public JsonResult Add(Designation desig) 
        {
            MTSHRDataLayer.Designation data_designation = new MTSHRDataLayer.Designation();
            int result = data_designation.Create(desig.designation); 
          return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}