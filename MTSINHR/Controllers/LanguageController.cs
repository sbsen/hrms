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
    public class LanguageController : SecureController
    {
        //
        // GET: /Language/


        public ActionResult Language()
        {
            return View();
        }


        public JsonResult Read()
        {
            MTSHRDataLayer.Language language = new MTSHRDataLayer.Language();
            return Json(JsonConvert.SerializeObject(language.Read()), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Edit(Language lang)
        {
            MTSHRDataLayer.Language data_language = new MTSHRDataLayer.Language();
            Int64 result = data_language.Update(lang.Id, lang.Languagename);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Add(Language lang)
        {
            MTSHRDataLayer.Language data_language = new MTSHRDataLayer.Language();
            Int64 result = data_language.Create(lang.Languagename);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}
