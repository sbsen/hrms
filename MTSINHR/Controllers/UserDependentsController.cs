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
    public class UserDependentsController : SecureController
    {
        //
        // GET: /UserDependent/

        public object GetAllRelationship()
        {
            MTSHRDataLayer.Relationship Relationshipdata = new MTSHRDataLayer.Relationship();
            var Relationships = Relationshipdata.Read();
            List<SelectListItem> Relationshiplist = new List<SelectListItem>();
            for (int i = 0; i < Relationships.Rows.Count; i++)
            {
                SelectListItem li = new SelectListItem();
                li.Value = Relationships.Rows[i]["id"].ToString();
                li.Text = Relationships.Rows[i]["Relationship"].ToString();
                Relationshiplist.Add(li);
            }
            return JsonConvert.SerializeObject(Relationshiplist);
        }


        [HttpPost]
        public JsonResult Edit(Dependents dependents)
        {
            MTSHRDataLayer.EmployeeDependents data_relationship = new MTSHRDataLayer.EmployeeDependents();
            var result = data_relationship.UpdateDependents(dependents.Employee_Id, dependents.DependentName, dependents.Relation, dependents.DateofBirth);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}
