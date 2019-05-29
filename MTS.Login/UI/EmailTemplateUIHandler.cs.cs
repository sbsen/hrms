using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using MTS.Login.BusinessHandler;
using MTS.Helpers;
using MTS.LoginModels;
using System.Xml;
using MTSEntBlocks.UtilsBlock.Web;
using System.Web.Mvc;
using System.Threading;
using System.Globalization;

namespace MTS.Login.UI
{
    public class EmailTemplateUIHandler
    {
        EmailTemplateBusiness objAdminBus = EmailTemplateBusiness.getInstance();

        #region Email Template
        public GridModel GetEmailTemplate(GridModel gridmodel)
        {
            gridmodel.Data = objAdminBus.GetEmailTemplate();
            return gridmodel;
        }
        public EmailTemplate GetEmailTempData(Int64 id)
        {
            DataSet ds = objAdminBus.GetEmailTempData(id);
            EmailTemplate objEmailTmp = new EmailTemplate();

            if (ds.Tables[0].Rows.Count > 0)
            {
                objEmailTmp.TempName = ds.Tables[0].Rows[0]["TemplateName"].ToString();
                objEmailTmp.ToMail = ds.Tables[0].Rows[0]["ToMail"].ToString();
                objEmailTmp.FromMail = ds.Tables[0].Rows[0]["FromMail"].ToString();
                objEmailTmp.CcMail = ds.Tables[0].Rows[0]["CcMail"].ToString();
                objEmailTmp.BCcMail = ds.Tables[0].Rows[0]["BCcMail"].ToString();
                objEmailTmp.Subjects = ds.Tables[0].Rows[0]["Subjects"].ToString();
                objEmailTmp.Active = Convert.ToBoolean(ds.Tables[0].Rows[0]["Active"]);
                objEmailTmp.Body = ds.Tables[1].Rows[0]["Body"].ToString();
                objEmailTmp.TempId = id;
            }
            return objEmailTmp;
        }
        public int PostEmailTemplate(EmailTemplate objEmailTmp)
        {
            string xmlTemplate = @"<email>";
            xmlTemplate += "<To>" + objEmailTmp.ToMail + "</To>";
            xmlTemplate += "<From>" + objEmailTmp.FromMail + "</From>";
            xmlTemplate += "<Cc>" + objEmailTmp.CcMail + "</Cc>";
            xmlTemplate += "<BCc>" + objEmailTmp.BCcMail + "</BCc>";
            xmlTemplate += "<Subject>" + objEmailTmp.Subjects + "</Subject>";
            xmlTemplate += "<Body>" + ReplaceXmlIlegalCharacters(objEmailTmp.Body) + "</Body></email>";
            return objAdminBus.PostEmailTemplate(objEmailTmp.TempId, objEmailTmp.Active, xmlTemplate);
        }
        private string ReplaceXmlIlegalCharacters(string xml)
        {
            xml = xml.Replace("&nbsp", "&#160");
            return xml;
        }
        #endregion
    }
}