using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.Security;

using MTS.LoginModels;
using MTS.Login.Data;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;
using MTS.Login;
using MTS.Login.Views.App_LocalResources;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTS.Login.Controllers
{
    public class AccountController : Controller
    {

        private string GetHomeUrl()
        {
            if (Session["RoleId"].ToString() == "1")
            {
                return Url.Content("~/Messages/AdminMessages");
            }
            else if (Session["RoleId"].ToString() == "2")
            {
                return Url.Content("~/Messages/ShowMessages");
            }
            else if (Session["RoleId"].ToString() == "3")
            {
                return Url.Content("~/Messages/ShowMessages");
            }
            if (Session["RoleId"].ToString() == "4")
            {
                return Url.Content("~/Messages/ShowMessages");
            }
            else 
            {
                return Url.Content("~/Mts.Login/Account/Logon");
            }
        }


        [HttpGet]
        public ActionResult LogOn(LogonUser model)
        {
            if (SessionHelper.LogonUser != null)
            {
                Session.Abandon();
                return RedirectToAction("LogOff", "Account");
            }

            UserLogonData userLogon = new UserLogonData();
            Session["isMtsProject"] = ConfigurationManager.AppSettings["isMtsProject"].ToString();
            userLogon.GetData();
            if (Request.QueryString.Count > 0)
            {

                byte statusId = byte.Parse(Request.QueryString["statusId"].ToString());
                if (statusId == Status.FIRSTLOGIN)
                {
                    model.Message = "First time login user can't use ForgetPassword";
                }

            }
            ModelState.Clear();
            return View(model);

        }

        [HttpPost]
        public ActionResult LogOn(LogonUser logonUser, string UserName)
        {

            //1 => pass 2=> failed  3 =>  locked   4 => 90 days pwd expired   5 => first time login 6 => Forget pwd
            LogonUserSession logonUserSession = new LogonUserSession();
            try
            {

                int status = 0;
                if (ModelState.IsValid)
                {

                    UserLogonData userLogon = new UserLogonData();

                    UserDetails userDetails = userLogon.GetUserDeatils(logonUser);

                    if (userDetails.Active != 0 && userDetails.UserId > 0)
                    {
                        status = ValidateLogonUser(1, userDetails, logonUser, logonUserSession);

                    }
                    else
                    {
                        status = ValidateLogonUser(0, userDetails, logonUser, logonUserSession);
                    }


                    if (status == 1)
                    {

                        logonUserSession.USERNAME = logonUser.UserName;

                       
                        DataTable dt = userLogon.GetEmployeeId(userDetails.UserId);

                        Session["Username"] = userDetails.Firstname +" "+ userDetails.Lastname;
                        Session["EmployeeId"] = dt.Rows[0]["Employee_Id"].ToString();
                        Session["DepartmentId"] = dt.Rows[0]["DepartmentId"].ToString();
                        Session["UserID"] = userDetails.UserId;
                        Session["Gender"] = dt.Rows[0]["Gender"].ToString();

                        Int64 roleid = userDetails.RoleId; ;                       
                        Session["RoleId"] = userDetails.RoleId;
                        Session["MyRole"] = dt.Rows[0]["ROLE_NAME"].ToString();
                        
                       
                        SessionHelper.LogonUser = logonUserSession;
                        
                        //SessionHelper.IPAddress = WebClientBase.GetIPAddress(HttpContext.Request);
                        //SessionHelper.BrowserName = WebClientBase.GetBrowserTypeAndVersion(HttpContext.Request);

                   
                        return Redirect(GetHomeUrl());

                    }
                    else if (status == 3)
                    {
                        if ((byte.Parse(logonUserSession.STATUS.ToString())) == Status.NO_OF_ATM_LOCKED)
                        {
                            logonUser.Message = "User locked for no of attempts";
                        }
                        else
                        {
                        }

                    }
                    else if (status == 5)
                    {
                        logonUserSession.TEMPUSERNAME = logonUser.UserName;// if first login after enter sec qns then assign to Session[Status.USERNAME]
                        SessionHelper.LogonUser = logonUserSession;
                        return RedirectToAction("SecurityQuestions", "Account");
                    }



                    else if (status == Status.PWDEXPIRED || status == Status.FORGETPWD)
                    {
                        logonUserSession.TEMPUSERNAME = logonUser.UserName;// if AFTER 90DAYS login after CHANGE PWD then assign to Session[Status.USERNAME]
                        SessionHelper.LogonUser = logonUserSession;
                        return RedirectToAction("ForgetChangePassword", "Account");
                    }
                    else if (status == 2)
                    {
                        logonUser.Message = "The username or password you entered is incorrect.";
                    }
                    else if (status == 8)
                    {
                        logonUser.Message = "User Account is Deactivated";
                    }
                    else
                    {
                    }

                }

                return View(logonUser);
            }
            catch (Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
            }
            return View(logonUser);
        }

        public ActionResult LogOff()
        {

            Session.Abandon();


            return RedirectToAction("Logon", "Account");
        }

        public ActionResult About()
        {
            try
            {

                return RedirectToAction("logon", "Account");

            }
            catch (Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
            }
            return RedirectToAction("logon", "Account");
        }


        public ActionResult EmailSending()
        {
            return View();
        }

        [HttpPost]
        public ActionResult EmailSending(string ok)
        {
            switch (ok)
            {
                case "Ok":
                    return RedirectToAction("Logon", "Account");
            }
            return View();
        }

        public ActionResult ForgotPassword(ForgotPasswordModel forget)
        {

            try
            {

                forget.inhrtSecurityQuestionModel = initialDDLFillBase();
                ModelState.Clear();
                return View(forget);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [HttpPost]

        public ActionResult ForgotPassword(ForgotPasswordModel forget, string Password, string button)
        {
            try
            {
                if (button == "Cancel")
                {
                    return RedirectToAction("Logon", "Account");
                }

                if (ModelState.IsValid)
                {
                    int status;
                    ForgotPasswordModel forgotPwd = new ForgotPasswordModel();

                    string secUserAns = forget.inhrtSecurityQuestionModel.SecAns;
                    Int64 secQunId = forget.inhrtSecurityQuestionModel.SelectedSecQsn;

                    encryptSha1 obj = new encryptSha1();
                    secUserAns = obj.GetSHA1HashData(secUserAns.ToUpper());


                    string msg = "";


                     UserLogonData userLogon = new UserLogonData();

                    LogonUser logonUser = new LogonUser();

                    logonUser.UserName = forget.UserName;

                    UserDetails userDetails = userLogon.GetUserDeatils(logonUser);


                    if (userDetails.Active !=0 && userDetails.UserId>0)
                    {
                        status = compareSecAns(forget.UserName, userDetails.SecQunId, userDetails.SecAns, userDetails.Status, userDetails.UserId, secUserAns, secQunId);
                        //1 success 0 incorrect username 2 secQun or ans incorrect
                        if (status == Status.NO_OF_ATM_LOCKED)
                        {
                            forget.inhrtSecurityQuestionModel = initialDDLFillBase();
                            forget.Message = "User locked for no of attempts";
                        }
                        else if (status == Status.FIRSTLOGIN)
                        {

                            return RedirectToAction("logon", "account", new { statusId = Status.FIRSTLOGIN });
                        }
                        else if (status == Status.PASS)
                        {                            
                              msg = "FORGET_PASS";
                            if (userLogon.UpdateStatus(userDetails.UserId, Status.FORGETPWD, msg) == true)
                            {
                                //update cur date in last_pwd_change while ,if pwd expiry ,not change he attempt forget pwd 
                                Encrypt encrypt = new Encrypt();
                                string TempPassword = encrypt.CreateRandomPassword(6);
                                string EncryptedPassword = encrypt.GetSHA1HashData(TempPassword);
                                userLogon.ForgotPassword(userDetails.UserId, encrypt.GetSHA1HashData(EncryptedPassword + userDetails.UserId));                           

                                string Templateid = "3";
                                string spname = "MTS_UserPasswordEmail";
                                spname = userDetails.Mailid + "," + userDetails.Firstname + "," + userDetails.Lastname + ","  + TempPassword;
                                userLogon.MailSending(spname, Templateid);


                                forget.Message = "Password sent your mail id";
                                

                                return RedirectToAction("EmailSending", "account");             // for forgot password                         
                            }
                            else
                            {
                                //forget.Message = resource.GetResource("~/Views/Logon.cshtml", "Failed");
                            }

                        }
                        else if (status == 2)
                        {
                            forget.inhrtSecurityQuestionModel = initialDDLFillBase();
                            forget.Message = "The Sec Question or answer you entered is incorrect.";
                        }
                        else
                        {
                        }
                    }
                    else
                    {
                        forget.inhrtSecurityQuestionModel = initialDDLFillBase();
                        forget.Message = "Invalid user id.";
                    }
                }
                else
                {
                    forget.inhrtSecurityQuestionModel = initialDDLFillBase();
                }
                return View(forget);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        [SessionExpireFilter]
        public ActionResult ForgetChangePassword(ChangePasswordBaseModel model)
        {
            LogonUserSession logonUserSession = (LogonUserSession)SessionHelper.LogonUser;
            if ((Int32.Parse(logonUserSession.STATUS.ToString())) == Status.PWDEXPIRED)
            {               
               // model.Message = "Your password expired" + logonUserSession.EXPIREDDAYS.ToString() + " days";
                model.Message = "Your Password expired";
            }

            ModelState.Clear();
            return View(model);
        }


        [HttpPost, SessionExpireFilter]
        public ActionResult ForgetChangePassword(ChangePasswordBaseModel model, string button)
        {

            int userStatus;

            try
            {
                LogonUserSession logonUserSession = (LogonUserSession)SessionHelper.LogonUser;
                encryptSha1 encrypt = new encryptSha1();
                userStatus = Int32.Parse(logonUserSession.STATUS.ToString());
                if (button == "Cancel" && userStatus != Status.PWDEXPIRED && userStatus != Status.FIRSTLOGIN && userStatus != Status.FORGETPWD)
                {

                    return Redirect(GetHomeUrl());
                }

                else
                {
                    if (button == "Cancel")
                    {
                        ModelState.Clear();
                    }
                    else
                    {

                        if (ModelState.IsValid)
                        {

                            ChangePasswordModel ChangePwd = new ChangePasswordModel();
                            try
                            {

                                model.HashCurrentPassword = logonUserSession.CURRENTPASSWORD.ToString();
                                model.HashConfirmPassword = encrypt.GetSHA1HashData(model.NewPassword + logonUserSession.USERID);

                                if (string.Equals(logonUserSession.TEMPUSERNAME.ToString(), model.NewPassword, StringComparison.OrdinalIgnoreCase))
                                {
                                    ModelState.AddModelError("NewPassword", "Username and New Password should not be same.");
                                }
                                else

                                    if (string.Equals(model.HashCurrentPassword, model.HashConfirmPassword, StringComparison.OrdinalIgnoreCase))
                                    {                                       
                                        ModelState.AddModelError("NewPassword", "NewPassword should not be equal to CurrentPassword");
                                    }
                                    else
                                    {
                                        int pwdCount = Int32.Parse(logonUserSession.PASSWORDCOUNT.ToString());
                                        Int64 userId = Int64.Parse(logonUserSession.USERID.ToString());
                                        int status = ChangePasswordfun(userId, model.HashCurrentPassword, model.HashConfirmPassword, pwdCount);

                                        if (status == 1) //  1-PASS 2 INVALID CURRENTPASSWORD 3 ALREADY USED 
                                        {
                                            if ((Int32.Parse(logonUserSession.STATUS.ToString())) == Status.PWDEXPIRED || (Int32.Parse(logonUserSession.STATUS.ToString())) == Status.FORGETPWD)
                                            {
                                                logonUserSession.USERNAME = logonUserSession.TEMPUSERNAME;

                                                logonUserSession.TEMPUSERNAME = null;

                                            }
                                            logonUserSession.CURRENTPASSWORD = model.HashConfirmPassword;
                                            logonUserSession.STATUS = Status.CHGPWD;
                                            SessionHelper.LogonUser = logonUserSession;
                                           
                                            model.Message = "Your password has been changed successfully"; //Msg.PWDCHANGED;
                                            return RedirectToAction("LogOn");

                                        }

                                        else if (status == 3)
                                        {
                                            model.Message = "New password already used"; //Msg.EXISTPWD;
                                        }
                                        else
                                        {                                         
                                            model.Message="Failed";
                                        }
                                    }

                            }
                            catch (Exception)
                            {
                                //  changePasswordSucceeded = false;
                            }


                        }
                    }
                }
                // If we got this far, something failed, redisplay form
                return View(model);


            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        [SessionExpireFilter]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            ViewBag.HomeUrl = GetHomeUrl();
            LogonUserSession logonUserSession = (LogonUserSession)SessionHelper.LogonUser;
            SessionHelper.SelectedUser = null;
            if ((Int32.Parse(logonUserSession.STATUS.ToString())) == Status.PWDEXPIRED)
            {
                model.Message = "Your Password expired";
            }

            ModelState.Clear();
            return View(model);
        }

        //
        // POST: /Account/ChangePassword


        [HttpPost, SessionExpireFilter]

        //[SessionExpireFilter]
        public ActionResult ChangePassword(ChangePasswordModel model, string button)
        {
            ViewBag.HomeUrl = GetHomeUrl();
            int userStatus;

            try
            {
                LogonUserSession logonUserSession = (LogonUserSession)SessionHelper.LogonUser;
                encryptSha1 encrypt = new encryptSha1();
                userStatus = Int32.Parse(logonUserSession.STATUS.ToString());
                if (button == "Cancel" && userStatus != Status.PWDEXPIRED && userStatus != Status.FIRSTLOGIN && userStatus != Status.FORGETPWD)
                {

                    return Redirect(GetHomeUrl());
                }

                else
                {
                    if (button == "Cancel")
                    {
                        ModelState.Clear();
                    }
                    else
                    {

                        if (ModelState.IsValid)
                        {

                            ChangePasswordModel ChangePwd = new ChangePasswordModel();

                            // bool changePasswordSucceeded;
                            try
                            {

                                model.HashCurrentPassword = encrypt.GetSHA1HashData(model.CurrentPassword + logonUserSession.USERID);
                                model.HashConfirmPassword = encrypt.GetSHA1HashData(model.NewPassword + logonUserSession.USERID);

                                if (logonUserSession.CURRENTPASSWORD.ToString() != model.HashCurrentPassword)
                                {
                                    model.Message = "Invalid current password.";
                                }
                                else if (string.Equals(logonUserSession.USERNAME.ToString(), model.NewPassword, StringComparison.OrdinalIgnoreCase))
                                {
                                    model.Message = "Username and New Password should not be same.";
                                }
                                else
                                    if (string.Equals(model.HashCurrentPassword, model.HashConfirmPassword, StringComparison.OrdinalIgnoreCase))
                                    {
                                        model.Message = "NewPassword should not be equal to CurrentPassword";
                                    }
                                    else
                                    {
                                        {

                                            int pwdCount = Int32.Parse(logonUserSession.PASSWORDCOUNT.ToString());
                                            Int64 userId = Int64.Parse(logonUserSession.USERID.ToString());
                                            int status = ChangePasswordfun(userId, model.HashCurrentPassword, model.HashConfirmPassword, pwdCount);

                                            if (status == 1) //  1-PASS 2 INVALID CURRENTPASSWORD 3 ALREADY USED 
                                            {

                                                if ((Int32.Parse(logonUserSession.STATUS.ToString())) == Status.PWDEXPIRED || (Int32.Parse(logonUserSession.STATUS.ToString())) == Status.FORGETPWD)
                                                {
                                                    logonUserSession.USERNAME = logonUserSession.TEMPUSERNAME;

                                                    logonUserSession.TEMPUSERNAME = null;

                                                }
                                                logonUserSession.CURRENTPASSWORD = model.HashConfirmPassword;
                                                logonUserSession.STATUS = Status.CHGPWD;
                                                SessionHelper.LogonUser = logonUserSession;
                                                model.Message = "Your password has been changed successfully"; //Msg.PWDCHANGED;
                                                ViewBag.success = "1";
                                                return View(model);

                                            }

                                            else if (status == 3)
                                            {
                                                model.Message = "New password already used"; //Msg.EXISTPWD;
                                            }
                                            else
                                            {
                                             
                                                model.Message = "Failed";
                                            }
                                        }
                                    }

                            }
                            catch (Exception)
                            {
                                //  changePasswordSucceeded = false;
                            }


                        }
                    }
                }
                // If we got this far, something failed, redisplay form
                return View(model);
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }


        public ActionResult ErrorPage()
        {
            try
            {

                return View();
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        [SessionExpireFilter]
        public ActionResult SecurityQuestions()
        {
            try
            {
                UserLogonData userLogon = new UserLogonData();

                SecurityQuestionModel securityQuestionModel = userLogon.GetSecurityQuestionForNewUser();

                return View(securityQuestionModel);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        [HttpPost, SessionExpireFilter]
        public ActionResult SecurityQuestions(SecurityQuestionModel model, string SecAns)
        {
            try
            {
                LogonUserSession logonUserSession = (LogonUserSession)SessionHelper.LogonUser;
                if (ModelState.IsValid)
                {
                    encryptSha1 encrypt = new encryptSha1();
                    SecurityQuestionModel secmodel = new SecurityQuestionModel();
                    Int64 userId = Int64.Parse(logonUserSession.USERID.ToString());

                    encryptSha1 obj = new encryptSha1();
                    string secAnsr = obj.GetSHA1HashData(model.SecAns.ToUpper());

                    string curPwd = logonUserSession.CURRENTPASSWORD.ToString();           // model.InhrChangePasswordModel.HashCurrentPassword;
                    string newPwd = encrypt.GetSHA1HashData(model.NewPassword + userId);           //model.InhrChangePasswordModel.HashConfirmPassword;


                    int pwdCount = Int32.Parse(logonUserSession.PASSWORDCOUNT.ToString());

                    if (string.Equals(logonUserSession.TEMPUSERNAME.ToString(), model.NewPassword, StringComparison.OrdinalIgnoreCase))
                    {
                        ModelState.AddModelError("NewPassword", "Username and New Password should not be same.");
                        model = initialDDLFill();
                    }
                    else if (string.Equals(curPwd, newPwd, StringComparison.OrdinalIgnoreCase))
                    {  
                        ModelState.AddModelError("NewPassword","NewPassword should not be equal to CurrentPassword");
                        model = initialDDLFill();
                    }

                    else
                    {

                        int userResult = InsertSecurityQsn(userId, curPwd, newPwd, model.SelectedSecQsn, secAnsr, pwdCount);
                        // 3 ALREADY ;  < 0 pass 
                        if (userResult == 3)
                        {

                            model = initialDDLFill();
                            model.Message = "New password already used"; //Msg.EXISTPWD;
                        }
                        else if (userResult == 1)
                        {
                            logonUserSession.STATUS = Status.CHGPWD;
                            logonUserSession.CURRENTPASSWORD = newPwd;
                            logonUserSession.USERNAME = logonUserSession.TEMPUSERNAME.ToString();
                            logonUserSession.TEMPUSERNAME = null;
                            SessionHelper.LogonUser = logonUserSession;
                            return RedirectToAction("LogOn");
                        }
                        else
                        {
                        }
                    }

                }
                else
                {
                    model = initialDDLFill();
                }
                return View(model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public SecurityQuestionModel initialDDLFill()
        {
            try
            {
                UserLogonData userLogon = new UserLogonData();

                SecurityQuestionModel securityQuestionModel = userLogon.GetSecurityQuestion();
                return securityQuestionModel;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public SecurityQuestionBaseModel initialDDLFillBase()
        {
            try
            {
                UserLogonData userLogon = new UserLogonData();

                SecurityQuestionBaseModel securityQuestionModel = userLogon.GetSecurityQuestionBase();
                return securityQuestionModel;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int ValidateLogonUser(int count, UserDetails userDetails, LogonUser logonUser, LogonUserSession logonUserSession)
        {
            int no_of_attempts = 0;

            int days = 0;
            byte status;

            try
            {
                UserLogonData userLogon = new UserLogonData();

                if (count == 1)
                {
                    //   if (ds.Tables[0].Rows.Count > 0)
                    //1 => pass 2=> failed  3 =>  locked   4 => 90 days pwd expired   5 => first time login 6 => Forget pwd

                    DateTime curDate = DateTime.Now;
                    TimeSpan ts = curDate.Date - userDetails.LastPwdChange;
                    status = userDetails.Status;


                    days = ts.Days;

                    no_of_attempts = (string.IsNullOrEmpty(userDetails.NoOfAttempts.ToString())) ? 0 : Int32.Parse(userDetails.NoOfAttempts.ToString());

                    encryptSha1 obj = new encryptSha1();

                    logonUser.TempPassword = obj.GetSHA1HashData(logonUser.Password + userDetails.UserId);
                   // logonUser.TempPassword = userDetails.DBPassword;
                    if (logonUser.TempPassword == userDetails.DBPassword)
                    {
                        logonUserSession.MENURANGE = userDetails.MenuRange;
                        logonUserSession.USERID = userDetails.UserId;
                        logonUserSession.CURRENTPASSWORD = userDetails.DBPassword;
                        logonUserSession.PASSWORDCOUNT = userDetails.PasswordCount;
                        logonUserSession.STATUS = userDetails.Status;
                        logonUserSession.FIRSTNAME = userDetails.Firstname;
                        logonUserSession.LASTNAME = userDetails.Lastname;                                     
                        logonUserSession.USERROLE = userDetails.RoleId;
                        //logonUserSession.DEPARTMENT = userDetails.DepartmentId;
                        logonUserSession.ROLENAME = userDetails.RoleName;
                        logonUserSession.ROLEID = userDetails.RoleId;
                        
                        SessionHelper.LogonUser = logonUserSession;
                        if (userDetails.Locked == true)
                        {
                            return 3;
                        }
                             
                        else if (ts.Days > userDetails.PwdChangeDays)
                        {
                            //userLogon.UpdateStatus(userDetails.UserId, userDetails.Status, resource.GetResource("~/Views/Logon.cshtml", "PASS_EXPIRED"));
                            userLogon.UpdateStatus(userDetails.UserId, userDetails.Status, "Password expired");
                            logonUserSession.STATUS = Status.PWDEXPIRED;
                            logonUserSession.EXPIREDDAYS = ts.Days.ToString();
                            SessionHelper.LogonUser = logonUserSession;
                            return 4;
                        }
                        else if (status == Status.FIRSTLOGIN)
                        {
                           // userLogon.AddAudit(userDetails.UserId, resource.GetResource("~/Views/Logon.cshtml", "Login successfully"));
                            userLogon.AddAudit(userDetails.UserId, "Login successfully");
                            return 5;
                        }

                        else if (status == Status.FORGETPWD)
                        {
                            return 6;
                        }

                        else if (no_of_attempts <= userDetails.MaxAttemps)
                        {
                            userLogon.UpdateUserAttempts(userDetails.UserId, 0);
                            return 1;
                        }
                        else
                        {
                            return 2;
                        }
                    }
                    else
                    {
                        if (status != Status.FIRSTLOGIN)
                        {

                            if (no_of_attempts == userDetails.MaxAttemps)
                            {
                                //userLogon.UpdateLockUser(userDetails.UserId, Status.NO_OF_ATM_LOCKED, resource.GetResource("~/Views/Logon.cshtml", "USER_LOCK"));
                                userLogon.UpdateLockUser(userDetails.UserId, Status.NO_OF_ATM_LOCKED, "User locked for no of attempts");
                                logonUserSession.STATUS = Status.NO_OF_ATM_LOCKED;
                                SessionHelper.LogonUser = logonUserSession;
                                return 3;
                            }
                            else
                            {

                                no_of_attempts = ++no_of_attempts;

                                userLogon.UpdateUserAttempts(userDetails.UserId, no_of_attempts);

                                return 2;
                            }
                        }
                        else
                        {
                            userLogon.AddAudit(userDetails.UserId, "Login failed");

                            return 2;
                        }
                    }
                }
                else if (userDetails.Status == 8 && userDetails.Active == 0)
                {
                    return 8;
                }
                else
                {
                    // userLogon.UpdateAnonymsAttempts(resource.GetResource("~/Views/Logon.cshtml", "ANON_ATTEMPT"));
                    userLogon.UpdateAnonymsAttempts("Anonymous attempt");
                    return 2;
                }
            }
            catch (Exception ex)
            {

                BaseExceptionHandler.HandleException(ref ex);
            }
            return 2;
        }


        public int compareSecAns(string username, Int64 _secQunId, string _secAns, byte status, Int64 userId, string secUserAns, Int64 secUserQunId)
        {
            Int64 secQunId; string secAns;
            try
            {
                LogonUserSession logonUserSession = new LogonUserSession();


                if (status == Status.ADMIN_LOCKED || status == Status.NO_OF_ATM_LOCKED || status == Status.FIRSTLOGIN)
                {
                    return status;
                }
                else
                {
                    secQunId = _secQunId;

                    if (string.IsNullOrEmpty(_secAns) == true)
                    {
                        secAns = "";
                    }
                    else
                    {
                        secAns = _secAns.ToString();
                    }



                    //7 success 0 incorrect username 2 secQun or ans incorrect
                    if (String.Equals(secUserAns, secAns, StringComparison.OrdinalIgnoreCase) && (secUserQunId == secQunId))
                    {
                        logonUserSession.USERID = userId;
                        SessionHelper.LogonUser = logonUserSession;
                        return 7;
                    }
                    else
                    {
                        return 2;
                    }

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int ChangePasswordfun(Int64 userid, string currentpassword, string newpassword, int pwdCount)
        {
            //  1-PASS 2 INVALID CURRENTPASSWORD 3 ALREADY USED 
            int count = 0;
            Int64 pwdHistoryId;

            try
            {

                UserLogonData userLogonData = new UserLogonData();

                PasswordHistory pwdHis = new PasswordHistory();
                pwdHis.pwdHistory = userLogonData.GetPasswordHistory(userid);




                if (pwdHis.pwdHistory.Count >= pwdCount && pwdHis.pwdHistory.Count > 0)
                {
                    pwdHistoryId = Int64.Parse(pwdHis.pwdHistory[0].Ph_Id.ToString());
                }
                else
                {
                    pwdHistoryId = 0;
                }

                count = (from b in pwdHis.pwdHistory
                         where b.DBPassword == newpassword
                         select b).Count();

                if (count > 0)
                {
                    return 3;
                }
                else
                {
                    if (userLogonData.UpdatePassword(userid, newpassword, pwdHistoryId) == true)
                    {
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }

                }


            }
            catch (Exception ex)
            {
                throw ex;
            }




        }
        public int InsertSecurityQsn(Int64 userId, string curPassword, string newPassword, Int64 secQsnId, string secAns, int pwdCount)
        {
            try
            {
                UserLogonData userLogonData = new UserLogonData();

                int status = ChangePasswordfun(userId, curPassword, newPassword, pwdCount);

                if (status == 3)
                {
                    return status;
                }
                else
                {
                    if (userLogonData.UpdateSecurityQuestion(userId, secQsnId, secAns) == true)
                    {
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
