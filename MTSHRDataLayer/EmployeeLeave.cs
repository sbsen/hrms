using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MTSEntBlocks.DataBlock;


namespace MTSHRDataLayer
{
    public class EmployeeLeave
    {
        public int RestrictEmployeeLeaves(params object[] parameterValues)
        {
            int checkLeave = Convert.ToInt32(DataAccess.ExecuteScalar("RESTRICT_EMPLOYEELEAVES", parameterValues));
            return checkLeave;
        }

        public DataSet GetAllLeaveType(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("Read_Filtered_LeaveType",parameterValues);
        }

        public DataSet GetAllLeaveFromSession()
        {
            return DataAccess.ExecuteDataSet("Read_LeaveSession");
        }

        public DataSet GetAllLeaveToSession()
        {
            return DataAccess.ExecuteDataSet("Read_LeaveSession");
        }

        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Employee_LeaveApply", parameterValues));
        }

        public int UpdateLopDays(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteNonQuery("UPDATELOPDAYS", parameterValues));
        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("EmployeeLeaveList");
        }

        public DataTable GetEmployeeLeaveList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("View_EmployeeLeaveList", parameterValues);

        }
        public DataTable GetAllEmployeeLeaveList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("Read_AllEmployeeLeaveList", parameterValues);
        }

        public DataTable GetApprovedLeaveList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_APPROVEDLEAVELISTFOREXPORT", parameterValues);

        }

        public DataTable GetAllEmployeeApprovedLeaveList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_APPROVEDEMPLOYEELEAVELIST", parameterValues);
        }

        public DataSet GetAllEmployeeNames(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataSet("Read_AllEmployeeNames");
        }
        public DataSet GetAllManagereNames(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataSet("READ_MANAGERNAMES");
        }
        public int GetUserId(params object[] emp)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("GetUserId", emp));

        }

        public int LeaveCancel(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Employee_LeaveCancel", parameterValues));
        }

        public DataTable GetHolidayDatesList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_ALL_HOLIDAYDATES", parameterValues);
        }

        public DataTable GetDisableHolidayDatesList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_ALL_DisableHOLIDAYDATES", parameterValues);
        }

        public DataTable GetLeaveBalance(params object[] parameterValues)
        {

            return DataAccess.ExecuteDataTable("READ_EMPLOYEEALLLEAVEBALANCE", parameterValues);
        }
    }
}
