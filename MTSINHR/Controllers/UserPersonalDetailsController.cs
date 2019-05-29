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
    public class UserPersonalDetailsController : SecureController
    {
        //
        // GET: /UserPersonalDetails/

        public object GetAllBloodGroups()
        {
            MTSHRDataLayer.BloodGroup bloodgroupdata = new MTSHRDataLayer.BloodGroup();
            var Bloodgroups = bloodgroupdata.Read();
            List<SelectListItem> Bloodgrouplist = new List<SelectListItem>();
            for (int i = 0; i < Bloodgroups.Rows.Count; i++)
            {
                SelectListItem li = new SelectListItem();
                li.Value = Bloodgroups.Rows[i]["id"].ToString();
                li.Text = Bloodgroups.Rows[i]["BloodGroup"].ToString();
                Bloodgrouplist.Add(li);
            }
            return JsonConvert.SerializeObject(Bloodgrouplist);
        }


        public object GetAllLanguages()
        {
            MTSHRDataLayer.Language Languagedata = new MTSHRDataLayer.Language();
            var Languages = Languagedata.Read();
            List<SelectListItem> Languagelist = new List<SelectListItem>();
            for (int i = 0; i < Languages.Rows.Count; i++)
            {
                SelectListItem li = new SelectListItem();
                li.Value = Languages.Rows[i]["id"].ToString();
                li.Text = Languages.Rows[i]["Languagename"].ToString();
                Languagelist.Add(li);
            }
            return JsonConvert.SerializeObject(Languagelist);
        }



        [HttpPost]
        public JsonResult Edit(PersonalDetails Details)
        {
            MTSHRDataLayer.EmployeePersonalDetails data_personaldetails = new MTSHRDataLayer.EmployeePersonalDetails();
            string language = string.Join(",", Details.Languagename);
            var result = data_personaldetails.Update(Details.Employee_Id, Details.BloodGroup, language);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }

    }
}
