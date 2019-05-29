using System;
using System.Threading;
using System.Xml;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections;

using System.Web.Mvc;
using MTSEntBlocks.DataBlock;

using MTS.LoginModels;
//using MTS.Views.Resource;

namespace MTS.Login.Data
{
   public class UserLogonData
    {
        // private MTSEntDAL _dal;
        //ResourceFile resourcefile = new ResourceFile();
        public LogonUser GetData()
        {
            LogonUser logonuser = new LogonUser();
            DataTable dt = DataAccess.ExecuteDataTable("MTS_GetPasswordPolicy");

            if (dt.Rows.Count > 0)
            {
                PasswordLengthAttribute._maximum = Convert.ToInt16(dt.Rows[0]["MAXIMUM_LENGH"].ToString());
                PasswordLengthAttribute._minimum = Convert.ToInt16(dt.Rows[0]["MINIMUM_LENGTH"].ToString());
                PasswordLengthAttribute.PasswordRegex = dt.Rows[0]["PASSWORDREGEX"].ToString();
            }
            return logonuser;
        }
        public DataTable GetEmployeeId(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("SessionEmpId", parameterValues);
        }
        public UserDetails GetUserDeatils(LogonUser userLogon)
        {
            UserDetails userDeatils = new UserDetails();
            DataSet ds = DataAccess.ExecuteDataset("MTS_GetUser", userLogon.UserName);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dataRow = ds.Tables[0].Rows[0];
                userDeatils.UserId = Convert.ToInt64(dataRow["USERID"].ToString());
                userDeatils.Status = Convert.ToByte(dataRow["STATUS"].ToString());
                userDeatils.Locked = Convert.ToBoolean(dataRow["LOCKED"].ToString());
                userDeatils.Active = Convert.ToInt16(dataRow["ACTIVE"]);
                userDeatils.DBPassword = dataRow["PASSWORD"].ToString();
                userDeatils.Firstname = dataRow["FIRSTNAME"].ToString();
                userDeatils.Lastname = dataRow["LASTNAME"].ToString();
                userDeatils.RoleId = Int64.Parse(dataRow["ROLEID"].ToString());         
                userDeatils.RoleName = dataRow["ROLENAME"].ToString();
                userDeatils.Mailid = dataRow["EMAIL"].ToString();
                if (userDeatils.Status == 1)
                {
                    userDeatils.LastPwdChange = DateTime.Now;
                }
                if (userDeatils.Status != 1)
                {
                    userDeatils.NoOfAttempts = Convert.ToInt32(dataRow["NO_OF_ATTEMPTS"].ToString());
                    userDeatils.SecQunId = Convert.ToInt64(dataRow["QUESTIONID"].ToString());
                    userDeatils.LastPwdChange = Convert.ToDateTime(dataRow["LAST_PWD_CHANGE"].ToString());
                    userDeatils.SecAns = dataRow["SEC_A"].ToString();
                }
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                DataRow dataRow = ds.Tables[1].Rows[0];
                userDeatils.PasswordCount = Convert.ToInt32(dataRow["PASSWORDCOUNT"].ToString());
                userDeatils.PwdChangeDays = Convert.ToInt32(dataRow["PASSWORDCHANGEDAYS"].ToString());
                userDeatils.MaxAttemps = Convert.ToInt32(dataRow["MAXIMUM_ATTEMPTS"].ToString());
            }

            return userDeatils;
        }

        public bool UpdateStatus(Int64 userId, byte status, string msg)
        {
            int retValue;

            try
            {

                retValue = DataAccess.ExecuteNonQuery("MTS_UpdateStatus", userId, status, msg);

                if (retValue < 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int MailSending(string spname, string Templateid)
        {
            return DataAccess.ExecuteNonQuery("MTS_AddEmailMasterEntry", Templateid, spname);
        }

        public int ForgotPassword(Int64 userId, string Password)
        {
            return DataAccess.ExecuteNonQuery("MTS_FORGOTPASSWORD", userId, Password);
        }

        public int UpdateLastPwdChange(Int64 userId)
        {
            return DataAccess.ExecuteNonQuery("MTS_UpdateLastPwdChange", userId);
        }

        public int AddAudit(Int64 userId, string msg)
        {
            return DataAccess.ExecuteNonQuery("MTS_AddAudit", userId, msg);
        }

        public int UpdateUserAttempts(Int64 userId, int userAttempts)
        {
            return DataAccess.ExecuteNonQuery("MTS_UpdateUserAttempts", userId, userAttempts);
        }
        public int UpdateLockUser(Int64 userId, byte status, string msg)
        {
            return DataAccess.ExecuteNonQuery("MTS_UpdateLockUser", userId, status, msg);
        }

        public int UpdateAnonymsAttempts(string msg)
        {
            return DataAccess.ExecuteNonQuery("MTS_UpdateAnonymsAttempts", msg);
        }




        public SecurityQuestionModel GetSecurityQuestion()
        {
            DataSet ds = DataAccess.ExecuteDataset("MTS_GetSecurityQuestions");

            SecurityQuestionModel securityQModel = new SecurityQuestionModel();

            securityQModel.SecurityQsns = GetSelectListItem(ds.Tables[0]);

            return securityQModel;
        }

        public SecurityQuestionModel GetSecurityQuestionForNewUser()
        {
            DataSet ds = DataAccess.ExecuteDataset("MTS_GETACTIVESECURITYQUESTIONS");

            SecurityQuestionModel securityQModel = new SecurityQuestionModel();

            securityQModel.SecurityQsns = GetSelectListItem(ds.Tables[0]);

            return securityQModel;
        }
        public SecurityQuestionBaseModel GetSecurityQuestionBase()
        {
            DataSet ds = DataAccess.ExecuteDataset("MTS_GetSecurityQuestions");

            SecurityQuestionBaseModel securityQModel = new SecurityQuestionBaseModel();

            securityQModel.SecurityQsns = GetSelectListItem(ds.Tables[0]);

            return securityQModel;
        }





        public static List<SelectListItem> GetSelectListItem(DataTable dt)
        {
            try
            {
                List<SelectListItem> items = new List<SelectListItem>();
                if (dt.Rows.Count > 0)
                {
                    items = (from dropdownfill in dt.AsEnumerable()
                             select new SelectListItem     // data()
                             {
                                 Value = dropdownfill.ItemArray[0].ToString(),
                                 Text = dropdownfill.ItemArray[1].ToString()
                             }).ToList();
                }
                return items;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //chng pwd

        public List<PasswordHistory> GetPasswordHistory(Int64 userId)
        {

            DataSet ds = DataAccess.ExecuteDataset("MTS_GetPasswordHistory", userId);
            List<PasswordHistory> PwdHistory = new List<PasswordHistory>();
            PwdHistory = (from ph in ds.Tables[0].AsEnumerable()
                          select new PasswordHistory()
                          {
                              Ph_Id = Int64.Parse(ph.ItemArray[0].ToString()),
                              DBPassword = ph.ItemArray[1].ToString()
                          }
                             ).ToList();
            return PwdHistory;

        }


        public bool UpdatePassword(Int64 userId, string newPassword, Int64 pwdHistoryId)
        {
            int retValue;

            try
            {

                retValue = DataAccess.ExecuteNonQuery("MTS_UpdatePassword", userId, newPassword, pwdHistoryId);

                if (retValue < 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateSecurityQuestion(Int64 userId, Int64 secQsnId, string secAns)
        {
            int retValue = 0;

            try
            {

                retValue = DataAccess.ExecuteNonQuery("MTS_UpdateSecurityQuestion", userId, secQsnId, secAns);

                if (retValue < 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateResetPasswordEmailScheduler(NewUser newUser)
        {
            try
            {
                string TemplateId = "2";
                string SpName = "MTS_UserPasswordEmail";
                SpName = SpName + "| " + newUser.Email + "," + newUser.Firstname + "," + newUser.Lastname + "," + newUser.username + "," + newUser.Password;
                DbCommand DCMD = DataAccess.ExecuteNonQueryCMD("MTS_AddEmailMasterEntry", TemplateId, SpName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ResetPassword(Int64 UserId, string resetPassword)
        {
            int retValue;
            try
            {
                retValue = DataAccess.ExecuteNonQuery("MTS_RESETPASSWORD", UserId, resetPassword, 1);
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }


}