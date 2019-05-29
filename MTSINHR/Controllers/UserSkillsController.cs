using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.DataBlock;
using MTSINHR.Models;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class UserSkillsController : SecureController
    {
        //
        // GET: /UserSkills/

        public object GetAllSkills()
        {
            MTSHRDataLayer.Skills Skilldata = new MTSHRDataLayer.Skills();
            var Skills = Skilldata.Read();
            List<SelectListItem> Skillslist = new List<SelectListItem>();
            for (int i = 0; i < Skills.Rows.Count; i++)
            {
                SelectListItem li = new SelectListItem();
                li.Value = Skills.Rows[i]["id"].ToString();
                li.Text = Skills.Rows[i]["Skills"].ToString();
                Skillslist.Add(li);
            }
            return JsonConvert.SerializeObject(Skillslist);
        }

        [HttpPost]
        public JsonResult Edit(EmployeeSkills skills)
        {
            MTSHRDataLayer.EmployeeSkills data_skills = new MTSHRDataLayer.EmployeeSkills();
            string SkillList = string.Join(",", skills.Skill);
            var result = data_skills.UpdateSkills(skills.Employee_Id, SkillList, skills.Certificationname);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }


    }
}
