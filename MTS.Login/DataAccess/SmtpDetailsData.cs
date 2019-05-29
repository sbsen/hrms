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
    public class SmtpDetailsData
    {

        public DataTable GetSmtpDetails()
        {
            return DataAccess.ExecuteDataTable("MTS_SMTPDETAIL", 0, null, null, null, null, null, null, null, null, null, null, null);
        }
        public DataTable GetSmtpDetailForUpdate(Int64 id)
        {
            return DataAccess.ExecuteDataTable("MTS_SMTPDETAIL", 1, id, null, null, null, null, null, null, null, null, null, null);
        }
        public int UpdateSmtpDetails(object[] parameters)
        {
            return DataAccess.ExecuteNonQuery("MTS_SMTPDETAIL", parameters);
        }
        public int InsertSmtpDetails(object[] parameters)
        {
            return DataAccess.ExecuteNonQuery("MTS_SMTPDETAIL", parameters);
        }
        public int UpdatePassword(object[] parameters)
        {
            DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_SMTPDETAIL", parameters);
            return Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value);
        }
    }
}
