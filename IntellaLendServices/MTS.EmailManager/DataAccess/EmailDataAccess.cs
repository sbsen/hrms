using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MTSEntBlocks.DataBlock;

namespace MTS.EmailManager.EmailDataAccess
{
    public class EmailDAL
    {
        public DataSet GetEmailSchedule()
        {
            return DataAccess.ExecuteDataset("MTS_GetEmailSchedule", null);
        }

        public DataSet GetEmailScheduleForTimeScheduler()
        {
            return DataAccess.ExecuteDataset("MTS_GetEmailScheduleForTimeScheduler", null);
        }
        public DataSet GetWaitingEmailTobeSent()
        {
            return DataAccess.ExecuteDataset("MTS_GetEmailsWaitingToBeSend", null);
        }

        public DataSet GetEmailTemplates()
        {
            return DataAccess.ExecuteDataset("MTS_GetEmailTemplate", null);
        }

        public void UpdateEmailStatus(Int64 Id, int Status)
        {
            DataAccess.ExecuteNonQuery("MTS_UpdateEmailStatus", new object[] { Id, Status });
        }
        public DataSet GetSTMPDetails()
        {
            return DataAccess.ExecuteDataset("MTS_GetSTMPDetails", null);
        }
        public object  GetTemplateIDFromSchedule(long ScheduleID)
        {
            return DataAccess.ExecuteScalar("MTS_GETTEMPLATEIDFROMSCHEDULEID", ScheduleID);
        }
        public DataSet GetEmailDataFromSP(string SPName, object[] Parameters)
        {
            return DataAccess.ExecuteDataset(SPName, Parameters);
        }
    }
}
