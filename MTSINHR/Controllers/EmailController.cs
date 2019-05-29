using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class EmailController : Controller
    {
        //
        // GET: /Email/

        public ActionResult UserCreatedEmail()
        {
            try
            {
                string[] emailParams = Request.QueryString["ID"].Split(',');
                ViewBag.Email = emailParams[0];
                ViewBag.Firstname = emailParams[1];
                ViewBag.Lastname = emailParams[2];
                ViewBag.Password = emailParams[3];
                ViewBag.Url = ConfigurationManager.AppSettings["Projecturl"].ToString();
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return View();
        }

        public ActionResult RequestLeaveEmail()
        {
            try
            {
                string[] emailParams = Request.QueryString["ID"].Split(',');
                ViewBag.ManagerEmail = emailParams[0];
                ViewBag.EmployeeEmail = emailParams[1];
                ViewBag.Employeeid = emailParams[2];
                ViewBag.Employeename = emailParams[3];
                ViewBag.Dateofjoin = emailParams[4];
                ViewBag.Fromdate = emailParams[5];
                ViewBag.Todate = emailParams[6];
                ViewBag.NoofDays = emailParams[7];
                ViewBag.Reason = emailParams[8];

                ViewBag.Url = ConfigurationManager.AppSettings["Projecturl"].ToString();
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return View();
        }

        public ActionResult LeaveApprovalEmail()
        {
            try
            {
                string[] emailParams = Request.QueryString["ID"].Split(',');
                ViewBag.Email = emailParams[0];
                ViewBag.Employeename = emailParams[2];
                ViewBag.Dateofjoin = emailParams[3];
                ViewBag.Fromdate = emailParams[4];
                ViewBag.Todate = emailParams[5];
                ViewBag.Reason = emailParams[7];
                ViewBag.Managerid = emailParams[9];
                ViewBag.Managername = emailParams[10];
                ViewBag.Url = ConfigurationManager.AppSettings["Projecturl"].ToString();
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return View();
        }

        public ActionResult LeaveCancelEmail()
        {
            try
            {
                string[] emailParams = Request.QueryString["ID"].Split(',');
                ViewBag.Email = emailParams[0];
                ViewBag.Employeeid = emailParams[1];
                ViewBag.Employeename = emailParams[2];
                ViewBag.Dateofjoin = emailParams[3];
                ViewBag.Fromdate = emailParams[4];
                ViewBag.Todate = emailParams[5];
                ViewBag.Reason = emailParams[7];
                ViewBag.Managerid = emailParams[9];
                ViewBag.Managername = emailParams[10];
                ViewBag.Url = ConfigurationManager.AppSettings["Projecturl"].ToString();
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return View();
        }


        public ActionResult ResetPasswordEmail()
        {
            try
            {
                string[] emailParams = Request.QueryString["ID"].Split(',');
                ViewBag.Email = emailParams[0];
                ViewBag.Firstname = emailParams[1];
                ViewBag.Lastname = emailParams[2];
                ViewBag.Password = emailParams[3];
                ViewBag.Url = ConfigurationManager.AppSettings["Projecturl"].ToString();
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return View();
        
        }

    }
}
