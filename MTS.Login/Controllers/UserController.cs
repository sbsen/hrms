using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;

using MTS.Login.Data;
using MTS.LoginModels;
using System.Net.Mail;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;
using MTS.Controllers;

namespace MTS.Login.Controllers
{
    public class UserController : SecureController
    {
        //
        // GET: /Roles/        
        UserData userData = new UserData();

        LogonUserSession logonUserSession = (LogonUserSession)SessionHelper.LogonUser;

        public ActionResult User(GridModel gridModel)
        {            
            gridModel = userData.GetData();
            return View(gridModel);
        }


        public ActionResult GetUserData()
        {
            GridModel gridmodel = userData.GetData();
            return PartialView("_PVUserData", gridmodel);
        }


        [HttpGet]
        public ActionResult _PartialViewLoad(Int64 id, int type)
        {
            NewUser userModel;
            switch (type)
            {
                case 1:
                    {
                        userModel = userData.GetUser();
                        userModel.Active = true;
                        return PartialView("_PVcreateUser", userModel);
                    }
                case 2:
                    {
                        ViewBag.button = null;
                        userModel = userData.GetUserForUpdate(id);
                        return PartialView("_PVEditUser", userModel);
                    }
                case 3:
                    {
                        ViewBag.button = "disabled";
                        userModel = userData.GetUserForUpdate(id);
                        return PartialView("_PVEditUser", userModel);
                    }
                case 4:
                    {
                        userModel = userData.GetUserForUpdate(id);
                        return PartialView("_PVAutoResetPassword", userModel);
                    }
                case 5:
                    {
                        userModel = userData.GetUserForRegionSelect();
                        return PartialView("_PVUserRegion", userModel);
                    }
            }

            return PartialView();
        }

        [HttpPost]
        public ActionResult AddData(NewUser newUser)
        {
            GridModel gridmodel = userData.GetData();

            //Check for no of users
            if (gridmodel.active_Users >= Status.Total_Users)
            {
                return Content("USER_LIMIT_EXCED");
            }

            int userResult = userData.CreateUser(newUser);

            if (userResult == 1)
                return Content("ALREADY_EXISTS");
            else if (userResult == 0)
                return Content("INSERT_SUCCESS");
            else
                return Content("INSERT_FAIL");
        }

        [HttpPost]
        public ActionResult updatePartial(NewUser newUser)
        {
            UserData userData = new UserData();

            //Check for no of users
            if (newUser.Active != newUser.ActiveCheck)
            {
                if (newUser.Active == true)
                {
                    GridModel gridmodel = userData.GetData();
                    if (gridmodel.active_Users >= Status.Total_Users)
                    {
                        gridmodel.total_Users = Status.Total_Users;
                        return Content("USER_LIMIT_EXCED");
                    }
                }
            }

            int userResult = userData.UpdateUser(newUser);

            if (userResult == 0)
                return Content("UPDATE_SUCCESS");
            else
                return Content("UPDATE_FAIL");
        }


        [HttpPost]
        public JsonResult UserNameExist(string UserName)
        {
            var user = userData.GetUser(UserName);
            return Json(user == null);
        }

        [HttpPost]
        public JsonResult UserEmailExist(string email, string UserId)
        {
            var user = userData.GetEMail(email, UserId);
            return Json(user == null);
        }

        public ActionResult UserDetails()
        {
            if (!string.IsNullOrEmpty(SessionHelper.ErrorMessage))
            {
                ViewBag.Success = SessionHelper.ErrorMessage;
            }
            else
            {
                ViewBag.Success = "";
            }
            if (Request.QueryString.Count > 0)
            {
                if (Request.QueryString["value"].ToString() == "success")
                {
                    ViewBag.Disabled = "disabled";
                }
            }
            DetailView detailView = userData.GetDetailView(logonUserSession.USERID);
            return View(detailView);
        }

        [HttpPost]
        public ActionResult UserDetails(DetailView detailView, string btn)
        {
            UserData userData = new UserData();

            int userResult = userData.UpdateDetailview(detailView);

            if (userResult == 0)
            {
                SessionHelper.ErrorMessage = "UPDATE_SUCCESS";
                logonUserSession.FIRSTNAME = detailView.Firstname;
                logonUserSession.LASTNAME = detailView.Lastname;
                return RedirectToAction("UserDetails", new { value = "success" });
            }
            else if (userResult == -1)
            {
                SessionHelper.ErrorMessage = "UPDATE_FAIL";
            }
            return RedirectToAction("UserDetails");
        }

        [SessionExpireFilter]
        public ActionResult AutoResetPassword(NewUser newUser)
        {
            UserData userData = new UserData();
            UserLogonData userLogonData = new UserLogonData();
            Encrypt encrypt = new Encrypt();
            newUser.Password = encrypt.CreateRandomPassword(6);
            string encryptedpass = encrypt.GetSHA1HashData(newUser.Password);
            userLogonData.UpdateResetPasswordEmailScheduler(newUser);
            if (userLogonData.ResetPassword(newUser.UserId, encrypt.GetSHA1HashData(encryptedpass + newUser.UserId)) == true)
            {
                return Content("PWD_RESET_S");
            }
            else
            {
                return Content("PWD_RESET_F");
            }
        }

        public JsonResult GetRoleList(Int64 Department)
        {
            var myData = userData.GetRolesBasedonDepartment(Department);
            return Json(myData, JsonRequestBehavior.AllowGet);
        }
    }
}
