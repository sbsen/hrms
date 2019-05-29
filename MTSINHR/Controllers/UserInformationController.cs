using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using Newtonsoft.Json.Converters;

namespace MTSINHR.Controllers
{
    public class UserInformationController : SecureController
    {
        //
        // GET: /UserInformation/

        public ActionResult GetUserDetails()
        {
            string empid = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(empid);
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
            return View();
        }

        public JsonResult Read_Employeedetails()
        {

            string empid = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(empid);
            MTSHRDataLayer.Employee data_emp = new MTSHRDataLayer.Employee();
            return Json(JsonConvert.SerializeObject(data_emp.Read(id)), JsonRequestBehavior.AllowGet);
        }

    }
}
