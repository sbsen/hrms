using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Threading;
using MTSEntBlocks.DataBlock;

namespace MTS.Login.Data
{
    public class EmailTemplateData
    {

        #region "Singleton Object Creation"
        private static EmailTemplateData _singleton = null;

        private EmailTemplateData()
        {
        }

        public static EmailTemplateData getInstance()
        {
            if (_singleton != null)
            {
                return _singleton;
            }
            else
            {
                return _singleton = new EmailTemplateData();
            }

        }
        #endregion


        #region Email Template
        public DataTable GetEmailTemplate()
        {
            return DataAccess.ExecuteDataTable("MTS_GETEMAILTEMPLATE");
        }
        public DataSet GetEmailTempData(Int64 id)
        {
            return DataAccess.ExecuteDataset("MTS_GETEMAILTEMPLATEDATA", id);
        }
        public int PostEmailTemplate(Int64 TempId, bool active, string xmlTemplate)
        {
            int RetVal = 0;
            DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_UPDATEEMAILTEMPLATE", TempId, active, xmlTemplate);
            RetVal = Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
            return RetVal;
        }
        #endregion
    }
}
