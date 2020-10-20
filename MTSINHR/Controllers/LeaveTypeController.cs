using System;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Newtonsoft.Json;
using System.Collections.Generic;
using MTSEntBlocks.ExceptionBlock.Handlers;
using System.Data;

namespace MTSINHR.Controllers
{
    public class LeaveTypeController : SecureController
    {
        public ActionResult LeaveType()
        {
            ViewBag.leavetype = GetLeaveType();
            ViewBag.Department = GetDepartment();
            return View();
        }                             
        public JsonResult Read()
        {
            
            MTSHRDataLayer.LeaveType leavetype = new MTSHRDataLayer.LeaveType();
            return Json(JsonConvert.SerializeObject(leavetype.Read()), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Edit(LeaveType leave)
        {
            MTSHRDataLayer.LeaveType leavetype = new MTSHRDataLayer.LeaveType();
            int result = leavetype.Update(leave.Id, leave.Leavetype, leave.Numberofdays,leave.Department,leave.HolidayAsLeave);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Add(LeaveType leave)
        {
            MTSHRDataLayer.LeaveType leavetype = new MTSHRDataLayer.LeaveType();
            int result = leavetype.Create(leave.Leavetype, leave.Numberofdays,leave.Department,leave.HolidayAsLeave);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }

        private List<SelectListItem> GetDepartment()
        {
            MTSHRDataLayer.Employee data_dep = new MTSHRDataLayer.Employee();
            List<SelectListItem> departmentlist = new List<SelectListItem>();
            try
            {
                var employeeDepartment = data_dep.getDepartment();
                departmentlist.Add(new SelectListItem() { Value = "", Text = "---- Select Department----" });
                for (int i = 0; i < employeeDepartment.Tables[0].Rows.Count; i++)
                {
                    departmentlist.Add(new SelectListItem() { Value = employeeDepartment.Tables[0].Rows[i]["id"].ToString(), Text = employeeDepartment.Tables[0].Rows[i]["Department"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return departmentlist;
        }

        private List<SelectListItem> GetLeaveType()
        {
            MTSHRDataLayer.Leave data = new MTSHRDataLayer.Leave();
            List<SelectListItem> leavetype = new List<SelectListItem>();
            try
            {
                DataTable leavenamelist = data.ReadLeavePolicy();
                leavetype.Add(new SelectListItem() { Value = "", Text = "---- Select Leave type----" });
                for (int i = 0; i < leavenamelist.Rows.Count; i++)
                {
                    leavetype.Add(new SelectListItem() { Value = leavenamelist.Rows[i]["LEAVE_CODE"].ToString(), Text = leavenamelist.Rows[i]["LEAVE_TYPE"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return leavetype;
        }
    }
}