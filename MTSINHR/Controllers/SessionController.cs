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
    public class SessionController : SecureController
    {
        public ActionResult Session()
        {
            return View();
        }

        public JsonResult Read()
        {
            MTSHRDataLayer.Session session = new MTSHRDataLayer.Session();
            return Json(JsonConvert.SerializeObject(session.Read()), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Edit(Session s)
        {
            MTSHRDataLayer.Session data_session = new MTSHRDataLayer.Session();
            int result = data_session.Update(s.id, s.session);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Add(Session s)
        {
            MTSHRDataLayer.Session data_session = new MTSHRDataLayer.Session();
            int result = data_session.Create(s.session);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}