using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class LeavePending_Approve
    {

        public DataTable GetAllPendingLeaveList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("[Read_PendingLeaveList]", parameterValues);
        }

        public DataTable GetAllApprovedLeaveList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("Read_ApprovedLeaveList", parameterValues);
        }

        public int Approve_Leave(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Leave_Approve", parameterValues));
        }

        public int LeaveReport(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("CREATE_LEAVE_REPORT", parameterValues));
        }

        public int Cancel_Leave(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("MANAGER_LEAVECANCEL", parameterValues));
        }
    }
}
