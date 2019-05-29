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
            MTSHRDataLayer.EmployeeDetails employeedetails = new MTSHRDataLayer.EmployeeDetails();
            return Json(JsonConvert.SerializeObject(employeedetails.Read()), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult FilterEmployees(string StartDate,string EndDate)
        {
            MTSHRDataLayer.EmployeeDetails employeedetails = new MTSHRDataLayer.EmployeeDetails();
            return Json(JsonConvert.SerializeObject(employeedetails.FilterEmployeesOnDoj(StartDate, EndDate)), JsonRequestBehavior.AllowGet);
        }
    }
}
