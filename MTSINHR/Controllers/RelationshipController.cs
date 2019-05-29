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
    public class RelationshipController : SecureController
    {
        //
        // GET: /Relationship/

        public ActionResult Relationship()
        {
            return View();
        }

        public JsonResult Read()
        {
            MTSHRDataLayer.Relationship relationship = new MTSHRDataLayer.Relationship();
            return Json(JsonConvert.SerializeObject(relationship.Read()), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Edit(Relationship rel)
        {
            MTSHRDataLayer.Relationship data_relationship = new MTSHRDataLayer.Relationship();
            int result = data_relationship.Update(rel.id, rel.relationship);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Add(Relationship rel)
        {
            MTSHRDataLayer.Relationship data_relationship = new MTSHRDataLayer.Relationship();
            int result = data_relationship.Create(rel.relationship);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}
