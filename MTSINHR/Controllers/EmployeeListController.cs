using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Newtonsoft.Json;
using MTS.LoginModels;
using System.Data;
using HRConstants;

namespace MTSINHR.Controllers
{
    public class EmployeeListController : SecureController
    {
        //
        // GET: /Search/

        public ActionResult EmployeeList()
        {
            return View();
        }
        
        public JsonResult Read()
        {
            //Declare of local variables
            DataTable dt = new DataTable();
            LogonUserSession logonUserSession = new LogonUserSession();
            Int64 userRole = 0;

            //assigning user role
            userRole = Convert.ToInt64(Session["RoleId"].ToString());

            MTSHRDataLayer.EmployeeDetails employeedetails = new MTSHRDataLayer.EmployeeDetails();
            //dt = userRole == UserConstants.User ? employeedetails.Read().Select("Active=1").CopyToDataTable() : employeedetails.Read();
            dt = employeedetails.Read();

            return Json(JsonConvert.SerializeObject(dt), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult FilterEmployees(string StartDate,string EndDate)
        {
            MTSHRDataLayer.EmployeeDetails employeedetails = new MTSHRDataLayer.EmployeeDetails();
            return Json(JsonConvert.SerializeObject(employeedetails.FilterEmployeesOnDoj(StartDate, EndDate)), JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetPartialViewAssignManager()
        {
            return PartialView("_PV_AssignManager");
        }
        public ActionResult GetManagerList( Int64 EmployeeId)
        {
            MTSHRDataLayer.EmployeeDetails employeedetails = new MTSHRDataLayer.EmployeeDetails();
            return Json(JsonConvert.SerializeObject(employeedetails.GetManagersList(EmployeeId)), JsonRequestBehavior.AllowGet);
        }
        public ActionResult AddManager(Int64 EmployeeId,Int64[] Managers,Int64[] Active)
        {
            MTSHRDataLayer.EmployeeDetails employeedetails = new MTSHRDataLayer.EmployeeDetails();
            Int64 success = 0;
            if (Managers != null)
            {
                for(int i=0;i<Managers.Length;i++)
                {
                    success += employeedetails.AddManager(EmployeeId, Managers[i], Active[i]);
                }
            }
            return Content(success.ToString());
        }
    }
}
