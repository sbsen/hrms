using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using Newtonsoft.Json;

namespace MTSINHR.Controllers
{
    public class UserListController : SecureController
    {
        //
        // GET: /UserList/

        public ActionResult UserList()
        {
            return View();
        }
        public JsonResult Read()
        {
            MTSHRDataLayer.EmployeeDetails employeedetails = new MTSHRDataLayer.EmployeeDetails();
            return Json(JsonConvert.SerializeObject(employeedetails.Read()), JsonRequestBehavior.AllowGet);
        }
        public ActionResult SetPrimaryid(Int64 id)
        {
            TempData["rowId"] = id;
            TempData.Keep("rowId");
            return Content("success");
        }


        public ActionResult UserDetails()
        {
            Int64 id = (Int64)TempData["rowId"];
            TempData.Keep("rowId");
            MTSHRDataLayer.Employee data_emp = new MTSHRDataLayer.Employee();

            var employeeData = Json(JsonConvert.SerializeObject(data_emp.Read(id)), JsonRequestBehavior.AllowGet);
            ViewBag.EmployeeData = employeeData.Data;
            MTSHRDataLayer.EmployeeImage data_image = new MTSHRDataLayer.EmployeeImage();
            byte[] imagedata = data_image.Read(id);

            if (imagedata == null)
            {
                string path = Server.MapPath("~/Content/images/Default.jpg");
                byte[] imageByteData = System.IO.File.ReadAllBytes(path);
                String baseimage = Convert.ToBase64String(imageByteData);
                ViewBag.Image = baseimage;
            }
            else if (imagedata != null)
            {
                String baseimage = Convert.ToBase64String(imagedata);
                ViewBag.Image = baseimage;
            }
            return View("UserDetails");

        }

    }
}
