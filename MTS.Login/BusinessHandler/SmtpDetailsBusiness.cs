using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MTS.Login.Data;
namespace MTS.Login.BusinessHandler
{
    public class SmtpDetailsBusiness
    {
        SmtpDetailsData objAdmData = new SmtpDetailsData();

        public DataTable GetSmtpDetails()
        {
            return objAdmData.GetSmtpDetails();
        }
        public DataTable GetSmtpDetailForUpdate(Int64 id)
        {
            return objAdmData.GetSmtpDetailForUpdate(id);
        }
        public int UpdateSmtpDetails(object[] parameters)
        {
            return objAdmData.UpdateSmtpDetails(parameters);
        }
        public int InsertSmtpDetails(object[] parameters)
        {
            return objAdmData.InsertSmtpDetails(parameters);
        }
        public int UpdatePassword(object[] parameters)
        {
            return objAdmData.UpdatePassword(parameters);
        }
    }
}
