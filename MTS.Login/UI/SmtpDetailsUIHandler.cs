using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Common;
using MTS.LoginModels;
using MTS.Login.BusinessHandler;
using MTS.Helpers;

namespace MTS.Login.UI
{
    public class SmtpDetailsUIHandler
    {
        SmtpDetailsBusiness objAdminBus = new SmtpDetailsBusiness();

        public GridModel GetSmtpDetails()
        {
            GridModel gridmodel = new GridModel();
            gridmodel.Data = objAdminBus.GetSmtpDetails();
            return gridmodel;
        }

        public SmtpDetails GetSmtpDetailForUpdate(Int64 id)
        {
            DataTable dt = objAdminBus.GetSmtpDetailForUpdate(id);
            SmtpDetails smtp = new SmtpDetails();
            if (dt.Rows.Count > 0)
            {
                smtp.SmtpID = Convert.ToInt64(dt.Rows[0]["SmtpID"]);
                smtp.smtpname = dt.Rows[0]["SmtpName"].ToString();
                smtp.SmtpHostName = dt.Rows[0]["SmtpClientHost"].ToString();
                smtp.SmtpPort = Convert.ToInt32(dt.Rows[0]["SmtpClientPort"].ToString());
                smtp.username = dt.Rows[0]["UserName"].ToString();
                smtp.Domain = dt.Rows[0]["Domain"].ToString();
                smtp.TimeOut = Convert.ToInt32(dt.Rows[0]["TimeOut"]);
                smtp.EnableSSL = Convert.ToBoolean(dt.Rows[0]["EnableSsl"]);
                smtp.DeliveryMethod = Convert.ToByte(dt.Rows[0]["SmtpDeliveryMethod"]);
                smtp.DefaultCredentials = Convert.ToBoolean(dt.Rows[0]["UseDefaultCredentials"]);
                smtp.Password = dt.Rows[0]["Password"].ToString();
                smtp.ConfirmPassword = dt.Rows[0]["Password"].ToString();
            }
            return smtp;
        }

        public int UpdateSmtpDetails(SmtpDetails smtpData)
        {
            object[] parameters = new object[12];
            parameters[0] = 3;
            parameters[1] = smtpData.SmtpID;
            parameters[2] = smtpData.smtpname;
            parameters[3] = smtpData.SmtpHostName;
            parameters[4] = smtpData.SmtpPort;
            parameters[5] = smtpData.username;
            parameters[6] = smtpData.Domain;
            parameters[7] = smtpData.Password;
            parameters[8] = smtpData.EnableSSL;
            parameters[9] = smtpData.TimeOut;
            parameters[10] = smtpData.DeliveryMethod;
            parameters[11] = smtpData.DefaultCredentials;
            return objAdminBus.UpdateSmtpDetails(parameters);
        }

        public int InsertSmtpDetails(SmtpDetails smtpData)
        {
            object[] parameters = new object[12];
            parameters[0] = 2;
            parameters[1] = smtpData.SmtpID;
            parameters[2] = smtpData.smtpname;
            parameters[3] = smtpData.SmtpHostName;
            parameters[4] = smtpData.SmtpPort;
            parameters[5] = smtpData.username;
            parameters[6] = smtpData.Domain;
            parameters[7] = smtpData.Password;
            parameters[8] = smtpData.EnableSSL;
            parameters[9] = smtpData.TimeOut;
            parameters[10] = smtpData.DeliveryMethod;
            parameters[11] = smtpData.DefaultCredentials;
            return objAdminBus.UpdateSmtpDetails(parameters);
        }

        public int UpdatePassword(SmtpDetails smtpData)
        {
            object[] parameters = new object[12];
            parameters[0] = 4;
            parameters[1] = smtpData.SmtpID;
            parameters[2] = smtpData.smtpname;
            parameters[3] = smtpData.SmtpHostName;
            parameters[4] = smtpData.SmtpPort;
            parameters[5] = smtpData.username;
            parameters[6] = smtpData.Domain;
            parameters[7] = smtpData.Password;
            parameters[8] = smtpData.EnableSSL;
            parameters[9] = smtpData.TimeOut;
            parameters[10] = smtpData.DeliveryMethod;
            parameters[11] = smtpData.DefaultCredentials;
            return objAdminBus.UpdatePassword(parameters);
        }
    }
}