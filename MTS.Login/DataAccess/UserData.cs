using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Threading;
using System.Xml;
using System.Web.Mvc;

using MTSEntBlocks.DataBlock;
using MTS.LoginModels;
using MTS.Login.Controllers;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;
namespace MTS.Login.Data
{
   public class UserData
    {

        public GridModel GetData()
        {
            GridModel gridmodel = new GridModel();
            DataSet ds = DataAccess.ExecuteDataset("MTS_GETUSERLIST");
            if (ds.Tables[1].Rows.Count > 0)
            {
                gridmodel.active_Users = Convert.ToInt64(ds.Tables[1].Rows[0]["Total_Users"].ToString());
                gridmodel.total_Users = Status.Total_Users;
            }
            gridmodel.Data = ds.Tables[0];
            return gridmodel;
        }


        public NewUser GetUser()
        {
            DataSet ds = DataAccess.ExecuteDataset("MTS_GETCREATEUSER");

            NewUser NewUser = new NewUser();
            UserRole userRole = new UserRole();

                       
            NewUser.Roles = GetSelectListItem(ds.Tables[4]);
            return NewUser;
        }

        public NewUser GetUserForRegionSelect()
        {
            NewUser user = new NewUser();
            user.SelectedRegion = new List<SelectListItem>();
            user.AvailableRegion = new List<SelectListItem>();
            return user;
        }

        public List<SelectListItem> GetRolesBasedonDepartment(Int64 Department)
        {
            DataTable dt = DataAccess.ExecuteDataTable("MTS_GETROLEBASEDONHIERARCHY", Department);
            return GetSelectListItem(dt);
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
                                 Value = dropdownfill.ItemArray[1].ToString(),
                                 Text = dropdownfill.ItemArray[0].ToString()
                             }).ToList();
                }
                return items;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int CreateUser(NewUser NewUser)
        {
            try
            {
                Encrypt encrypt = new Encrypt();
                string password = encrypt.CreateRandomPassword(6);
                NewUser.Password = encrypt.GetSHA1HashData(password);


                int RetVal = 0;
                //Get Paremeters from the Database
                //Status=1, initial status when user cr eated.
                string TemplateId = "1";
                string SpName = "MTS_UserPasswordEmail";
                SpName = SpName + "| " + NewUser.Email + "," + NewUser.Firstname + "," + NewUser.Lastname + "," + NewUser.username + "," + password;

                DbCommand DCMD = DataAccess.ExecuteNonQueryCMD("MTS_AddEmailMasterEntry", TemplateId, SpName);
                DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_ADDUSER",
                    NewUser.username,
                    NewUser.Password,
                    NewUser.Firstname,
                    NewUser.Lastname,
                    NewUser.Email,
                    NewUser.Role,
                    NewUser.Active,
                    1,
                    NewUser.locked);

                RetVal = Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
                return RetVal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public int UpdateUser(NewUser NewUser)
        {
            try
            {
                int RetVal = 0;
                //Get Paremeters from the Database
                DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_UPDATEUSER", NewUser.UserId, NewUser.Firstname, NewUser.Lastname, NewUser.Email, NewUser.Department, NewUser.Role, NewUser.Active, NewUser.locked);

                RetVal = Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
                return RetVal;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetUser(string username1)
        {
            string username = "";
            int RetVal = 0;
            //Get Paremeters from the Database
            DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_CHECK_EXISTS_USERNAME", username1);

            RetVal = Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
            if (RetVal == 1)
            {
                username = username1;
            }
            else
            {
                username = null;
            }

            return username;
        }


        public string GetEMail(string email, string userid)
        {
            string result = "";
            int RetVal = 0;
            //Get Paremeters from the Database
            DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_CHECK_EXISTS_USEREMAIL", email, userid);

            RetVal = Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
            if (RetVal == 1)
            {
                result = email;
            }
            else
            {
                result = null;
            }

            return result;
        }


        public NewUser GetUserForUpdate(Int64 id)
        {
            //Execute the command
            DataSet ds = DataAccess.ExecuteDataset("MTS_GETUSERDETAILS", id);
            NewUser newuser = new NewUser();
            UserRole userRole = new UserRole();

            if (ds.Tables[0].Rows.Count > 0)
            {
                newuser.UserId = id;
                newuser.username = ds.Tables[0].Rows[0]["USERNAME"].ToString();
                newuser.Firstname = ds.Tables[0].Rows[0]["FIRSTNAME"].ToString();
                newuser.Lastname = ds.Tables[0].Rows[0]["LASTNAME"].ToString();
                newuser.Email = ds.Tables[0].Rows[0]["EMAIL"].ToString();                
                newuser.ConfirmEmail = ds.Tables[0].Rows[0]["EMAIL"].ToString();
                newuser.locked = Convert.ToBoolean(ds.Tables[0].Rows[0]["LOCKED"].ToString());
                newuser.Role = Convert.ToInt32(ds.Tables[0].Rows[0]["ROLEID"].ToString());
                newuser.Active = Convert.ToBoolean(ds.Tables[0].Rows[0]["ACTIVE"].ToString());
            }

            ds = DataAccess.ExecuteDataset("MTS_GETCREATEUSER");
            if (ds.Tables[0].Rows.Count > 0)
            {
                newuser.Roles = GetSelectListItem(ds.Tables[4]);
            }

            return newuser;
        }

        public DetailView GetDetailView(Int64 id)
        {
            DetailView detailView = new DetailView();

            DataTable dt = DataAccess.ExecuteDataTable("MTS_GETDETAILVIEW", id);
            if (dt.Rows.Count > 0)
            {
                detailView.Firstname = dt.Rows[0]["FIRSTNAME"].ToString();
                detailView.Lastname = dt.Rows[0]["LASTNAME"].ToString();
                detailView.Email = dt.Rows[0]["EMAIL"].ToString();
                detailView.ConfirmEmail = dt.Rows[0]["EMAIL"].ToString();
                detailView.address1 = dt.Rows[0]["ADD1"].ToString();
                detailView.address2 = dt.Rows[0]["ADD2"].ToString();
                detailView.city = dt.Rows[0]["CITY"].ToString();
                detailView.state = dt.Rows[0]["STATE"].ToString();
                detailView.country = dt.Rows[0]["COUNTRY"].ToString();
                detailView.zipcode = dt.Rows[0]["ZIPCODE"].ToString();
                detailView.phoneNo = dt.Rows[0]["PHONE"].ToString();
                detailView.mobile = dt.Rows[0]["MOBILE"].ToString();
                detailView.UserId = Int64.Parse(dt.Rows[0]["USERID"].ToString());
            }
            return detailView;
        }

        public int UpdateDetailview(DetailView detailView)
        {
            try
            {
                int RetVal = 0;
                //Get Paremeters from the Database
                DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_UPDATEDETAILVIEW", detailView.UserId, detailView.Firstname, detailView.Lastname, detailView.Email, detailView.address1, detailView.address2, detailView.city, detailView.state, detailView.country, detailView.zipcode, detailView.phoneNo, detailView.mobile);

                RetVal = Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
                return RetVal;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}




