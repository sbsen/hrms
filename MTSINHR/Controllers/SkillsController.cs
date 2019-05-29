using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using MTSINHR.Models;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class SkillsController : SecureController
    {
        //
        // GET: /Skills/


        public ActionResult Skills()
        {

            return View();
        }


        public JsonResult Read()
        {
            MTSHRDataLayer.Skills skills = new MTSHRDataLayer.Skills();
            return Json(JsonConvert.SerializeObject(skills.Read()), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Edit(Skills skill)
        {
            MTSHRDataLayer.Skills data_skills = new MTSHRDataLayer.Skills();
            int result = data_skills.Update(skill.Id, skill.Skill);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Add(Skills skill)
        {
            MTSHRDataLayer.Skills data_skills = new MTSHRDataLayer.Skills();
            int result = data_skills.Create(skill.Skill);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}
