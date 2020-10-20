using MTSINHR.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using System.Data;
using MTS.Login.Controllers;
using MTS.LoginModels;

namespace MTSINHR.Controllers
{
    public class MessagesController : SecureController
    {
        //
        // GET: /UpdateTimeLine/
        public ActionResult demo() {
            return View();
        }

        public ActionResult AdminMessages()
        {
            return View();
        }

        public ActionResult ShowMessages()
        {
            var stringArray = new string[3] { "Manual", "Semi", "Auto" };
            ViewBag.Collection = stringArray;

            ViewBag.RoleId = Session["RoleId"].ToString();
            return View();
        }

        public ActionResult ConfigureMessages()
        {
            return View();
        }

        [HttpPost]
        public JsonResult AddMessages(Message mess)
        {
            Message msg = new Message();
            var a = msg.MessageTitle;
            string Employee_Id = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(Employee_Id);
            string Role_Id = Session["RoleId"].ToString();
            Int64 role_id = Convert.ToInt64(Role_Id);
            Int64 PostedBy = Convert.ToInt64(Employee_Id);
            MTSHRDataLayer.Messages data_message = new MTSHRDataLayer.Messages();
            Int64 Result = data_message.CreateMessages(id, mess.FromDate, mess.ToDate, mess.MessageHeader, mess.MessageTitle, mess.TextMessage, role_id, mess.MessageStatus, PostedBy, mess.TemplateType);
            return Json(new { success = Result });
        }

        [HttpPost]
        public JsonResult EditMessages(Message mess)
        {
            MTSHRDataLayer.Messages data_message = new MTSHRDataLayer.Messages();
            Int64 Result = data_message.EditMessages(mess.Id, mess.FromDate, mess.ToDate, mess.MessageHeader, mess.MessageTitle, mess.TextMessage, mess.TemplateType);
            return Json(new { success = Result }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetMessages()
        {
            string SessionRoleID = Session["RoleId"].ToString();
            int RoleId = Convert.ToInt32(SessionRoleID);
            MTSHRDataLayer.Messages data_posts = new MTSHRDataLayer.Messages();
            var result = JsonConvert.SerializeObject(data_posts.ReadMessages(RoleId), new IsoDateTimeConverter() { DateTimeFormat = "dd/MMM/yyyy" });
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DisplayMessages(int MsgStatus)
        {
            string path = Server.MapPath("~/Images/User-male.png");
            byte[] imageByteData = System.IO.File.ReadAllBytes(path);
            string baseimagemale = Convert.ToBase64String(imageByteData);
            path = Server.MapPath("~/Images/User-female.png");
            imageByteData = System.IO.File.ReadAllBytes(path);
            string baseimagefemale = Convert.ToBase64String(imageByteData);
            MTSHRDataLayer.Messages data_posts = new MTSHRDataLayer.Messages();
            var result = JsonConvert.SerializeObject(data_posts.DisplayMessages(MsgStatus), new IsoDateTimeConverter() { DateTimeFormat = "dd/MMM/yyyy" });
            JsonResult res_ult =Json(new { success = true
                                , result = result
                                , resMaleimage = baseimagemale
                                , resFemaleimage = baseimagefemale
                            });
            res_ult.MaxJsonLength = int.MaxValue;
            return res_ult;
        }

        public ActionResult updateStatus(Message mess)
        {
            MTSHRDataLayer.Messages data_posts = new MTSHRDataLayer.Messages();
            var result = data_posts.StatusUpdate(mess.Id, mess.Status).ToString();
            return Content(result);
        }

        [HttpPost]
        public JsonResult GetBirthDays(bool isUpcommingBD)
        {

            string SessionRoleID = Session["RoleId"].ToString();
            int RoleId = Convert.ToInt32(SessionRoleID);
            MTSHRDataLayer.Messages data_posts = new MTSHRDataLayer.Messages();
            var result = JsonConvert.SerializeObject(data_posts.ReadBirthDays(isUpcommingBD));
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetNewJoiners()
      {
            string path = Server.MapPath("~/Images/User-male.png");
            byte[] imageByteData = System.IO.File.ReadAllBytes(path);
            string baseimagemale = Convert.ToBase64String(imageByteData);
            path = Server.MapPath("~/Images/User-female.png");      
            imageByteData = System.IO.File.ReadAllBytes(path);
            string baseimagefemale = Convert.ToBase64String(imageByteData);
            MTSHRDataLayer.Messages data_posts = new MTSHRDataLayer.Messages();
            var result = JsonConvert.SerializeObject(data_posts.GetNewJoiners());
            return Json(new { success=true
                                , result
                                , resMaleimage = baseimagemale
                                , resFemaleimage = baseimagefemale         
                            } , JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetMessageCount()
        {
            MTSHRDataLayer.Messages data_posts = new MTSHRDataLayer.Messages();
            DataSet ds = data_posts.GetMessageCount();
            return Json(new { success = true
                                , result = JsonConvert.SerializeObject(ds.Tables[0])
                                , result1 = JsonConvert.SerializeObject(ds.Tables[1])
                                , result2 = JsonConvert.SerializeObject(ds.Tables[2])
                            } , JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetEmployeeAttendanceDetails()
        {
            string lastUploadedDate;
            Int64 EmpID = Convert.ToInt64(Session["UserID"].ToString());
            MTSHRDataLayer.Messages attendanceData = new MTSHRDataLayer.Messages();
            DataSet ds = attendanceData.GetEmployeeAttendanceDetails(EmpID);
            string[] monthName = new string[5];
            DateTime d = new DateTime();
            monthName[0] = DateTime.Now.ToString("MMMM") + "-" + (DateTime.Now.Year).ToString();
            monthName[1] = DateTime.Now.AddMonths(-1).ToString("MMMM") + "-" + (DateTime.Now.AddMonths(-1).Year).ToString();
            monthName[2] = DateTime.Now.AddMonths(-2).ToString("MMMM") + "-" + (DateTime.Now.AddMonths(-2).Year).ToString();
            monthName[3] = DateTime.Now.AddMonths(-3).ToString("MMMM") + "-" + (DateTime.Now.AddMonths(-3).Year).ToString();
            monthName[4] = DateTime.Now.AddMonths(-4).ToString("MMMM") + "-" + (DateTime.Now.AddMonths(-4).Year).ToString();

            lastUploadedDate = (ds.Tables[7].Rows[0]["LAST_UPLOADED_DATE"].ToString() == "No uploads") ? ds.Tables[7].Rows[0]["LAST_UPLOADED_DATE"].ToString() : "Upto " + ds.Tables[7].Rows[0]["LAST_UPLOADED_DATE"].ToString();

            if (ds != null)
            {
                return Json(new
                {
                    success = true
                            , result = JsonConvert.SerializeObject(ds.Tables[0])
                            , result1 = JsonConvert.SerializeObject(ds.Tables[1])
                            , result2 = JsonConvert.SerializeObject(ds.Tables[2])
                            , result3 = JsonConvert.SerializeObject(ds.Tables[3])
                            , result4 = JsonConvert.SerializeObject(ds.Tables[4])
                            , result5 = JsonConvert.SerializeObject(ds.Tables[5])
                            , result6 = JsonConvert.SerializeObject(ds.Tables[6])
                            , lastUploadedDate = lastUploadedDate
                            , monthName = monthName
                });
            }
            else
            {
                return Json(new
                {
                    sucess = false
                });
            }
            
        }

        [HttpGet]
        public JsonResult GetEmployeeLeaveCount()
        {
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            string Employee_Id = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(Employee_Id);
            DateTime dateTime = DateTime.Now;
            int year = dateTime.Year;
            DataSet ds = data_contact.GetEmployeeLeaveDetails(id, false, year);
            return Json(new{result = JsonConvert.SerializeObject(ds.Tables[0])}, JsonRequestBehavior.AllowGet);
        }
    }

    
}