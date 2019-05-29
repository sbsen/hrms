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

namespace MTSINHR.Controllers
{
    public class MessagesController :Controller
    {
        //
        // GET: /UpdateTimeLine/

        public ActionResult AdminMessages()
        {
            return View();
        }

        public ActionResult ShowMessages()
        {
            return View();
        }

        public JsonResult GetMessages()
        {

            string SessionRoleID = Session["RoleId"].ToString();
            int RoleId = Convert.ToInt32(SessionRoleID);
            MTSHRDataLayer.Messages data_posts = new MTSHRDataLayer.Messages();
            var result = JsonConvert.SerializeObject(data_posts.Read(RoleId), new IsoDateTimeConverter() { DateTimeFormat = "dd/MMM/yyyy" });
                return Json(result, JsonRequestBehavior.AllowGet);
            
           
        }
        public JsonResult GetBirthDays()
        {

            string SessionRoleID = Session["RoleId"].ToString();
            int RoleId = Convert.ToInt32(SessionRoleID);
            MTSHRDataLayer.Messages data_posts = new MTSHRDataLayer.Messages();
            var result = JsonConvert.SerializeObject(data_posts.ReadBirthDays());
                return Json(result, JsonRequestBehavior.AllowGet);
            
           
        }

        [HttpPost]
        public ActionResult Add(Message mess)
        {
            string Employee_Id = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(Employee_Id);

            MTSHRDataLayer.Messages data_message = new MTSHRDataLayer.Messages();
            Int64 Result = data_message.Create(id, mess.FromDate, mess.ToDate, mess.MessageHeader, mess.MessageTitle, mess.TextMessage);

            return Json(new { success = Result });
        }

        [HttpPost]
        public JsonResult Edit(Message mess)
        {
            MTSHRDataLayer.Messages data_message = new MTSHRDataLayer.Messages();
            Int64 Result = data_message.Edit(mess.Id, mess.FromDate, mess.ToDate, mess.MessageHeader, mess.MessageTitle, mess.TextMessage);
            return Json(new { success = Result }, JsonRequestBehavior.AllowGet);

        }

    }
}