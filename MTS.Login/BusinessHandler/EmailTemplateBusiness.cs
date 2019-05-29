using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MTS.Login.Data;
namespace MTS.Login.BusinessHandler
{
    public class EmailTemplateBusiness
    {

        #region "Singleton Object Creation"
        private static EmailTemplateBusiness _singleton = null;

        private EmailTemplateBusiness()
        {

        }

        public static EmailTemplateBusiness getInstance()
        {
            if (_singleton != null)
            {
                return _singleton;
            }
            else
            {
                return _singleton = new EmailTemplateBusiness();
            }
        }

        #endregion

        EmailTemplateData objData = EmailTemplateData.getInstance();

        // Email Template
        public DataTable GetEmailTemplate()
        {
            return objData.GetEmailTemplate();
        }
        public DataSet GetEmailTempData(Int64 id)
        {
            return objData.GetEmailTempData(id);
        }
        public int PostEmailTemplate(Int64 TempId, bool active, string xmlTemplate)
        {
            return objData.PostEmailTemplate(TempId, active, xmlTemplate);
        }
    }
}
