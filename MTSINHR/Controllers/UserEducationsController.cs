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
    public class UserEducationsController : SecureController
    {
        //
        // GET: /UserEducation/

        public object GetAllEducations()
        {
            MTSHRDataLayer.Qualification Qualificationdata = new MTSHRDataLayer.Qualification();
            var Qualifications = Qualificationdata.Read();
            List<SelectListItem> Qualificationlist = new List<SelectListItem>();
            for (int i = 0; i < Qualifications.Rows.Count; i++)
            {
                SelectListItem li = new SelectListItem();
                li.Value = Qualifications.Rows[i]["id"].ToString();
                li.Text = Qualifications.Rows[i]["Qualification"].ToString();
                Qualificationlist.Add(li);
            }
            return JsonConvert.SerializeObject(Qualificationlist);
        }


        [HttpPost]
        public JsonResult Edit(Education educations)
        {
            MTSHRDataLayer.Educations data_educations = new MTSHRDataLayer.Educations();
            var result = data_educations.UpdateEducations(educations.Employee_Id, educations.SchoolName, educations.SchoolPassedoutyear, educations.CollegeName, educations.CollegePassedoutyear, educations.Qualifications);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }


    }
}
