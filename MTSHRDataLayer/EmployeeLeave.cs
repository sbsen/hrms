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
            return DataAccess.ExecuteDataset("Read_Filtered_LeaveType", parameterValues);
        }

        public DataSet GetAllLeaveFromSession()
        {
            return DataAccess.ExecuteDataSet("Read_LeaveSession");
        }

        public DataSet GetAllLeaveToSession()
        {
            return DataAccess.ExecuteDataSet("Read_LeaveSession");
        }

        public int Create_ADD_EMPLOYEE_LEAVE_DETAILS(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("ADD_EMPLOYEE_LEAVE_DETAILS", parameterValues));
        }

        public Int64 Create(params object[] parameterValues)
        {
            return Convert.ToInt64(DataAccess.ExecuteScalar("EMPLOYEE_LEAVEAPPLY", parameterValues));
        }

        public int CreateLeaveDetails(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("ADD_EMPLOYEE_LEAVE_DETAILS_ADJUSTMENT_LEAVE_AGAINST", parameterValues));
        }

        public int DeleteLeaveDetails(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("DELETE_EMPLOYEE_LEAVE_DETAILS", parameterValues));
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
            DataTable dt = null;
            try
            {
                dt = DataAccess.ExecuteDataTable("View_EmployeeLeaveList", parameterValues);
            }
            catch(Exception e)
            {
                e.Data.Clear();
            }
            return dt;

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

        public DataSet GetMTSLeavePolicyLeaveType(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("READ_MTS_LeavePolicy_LeaveType", parameterValues);
        }

        public DataSet GetEmployeeLeaveDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("READ_EMPLOYEE_LEAVES", parameterValues);
        }

        public DataSet GetEmployeeApproredLeaveDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("READ_EMPLOYEE_APPRORED_LEAVES", parameterValues);
        }
        
        public DataSet Get_MTS_LeaveType_ID(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("GETLEAVETYPEBYLEAVECODE", parameterValues);
        }

        public DataSet GetEmployeeLeaveDetailsBetweenYears(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("READ_EMPLOYEE_LEAVE_DETAILS_BETWEEN_YEAR", parameterValues);
        }

        public DataSet GetEmployeeListBWDate(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("READ_EMPLOYEELEAVELIST_BETWEEN_DATE", parameterValues);
        }

        public DataSet GetEmployeeListBWDateWithoutLeaveType(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType", parameterValues);
        }

        public DataSet GetAllManagereNames(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("READ_MANAGERNAMES", parameterValues);
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

        //public DataTable GetLeaveBalance(params object[] parameterValues)
        //{

        //    return DataAccess.ExecuteDataTable("READ_EMPLOYEEALLLEAVEBALANCE", parameterValues);
        //    //return DataAccess.ExecuteDataTable("READ_EMPLOYEE_LEAVEBALANCE", parameterValues);
        //}

        public DataTable GetIndividualEmployeeLeaveBalance(params object[] parameterValues)
        {

            return DataAccess.ExecuteDataTable("READ_INDIVIDUAL_EMPLOYEE_LEAVEBALANCE", parameterValues);
        }
        public string READLEAVETYPENAME(params object[] parameterValues)
        {
            return Convert.ToString(DataAccess.ExecuteScalar("READ_LEAVETYPENAME", parameterValues));
        }

        //public void CalculateEarnedLeaveBalance(params object[] parameterValues)
        //{
        //    DataAccess.ExecuteNonQuery("MTS_CALCULATE_INDIVUDUAL_EARNEDLEAVEBALANCE", parameterValues);
        //}
        public DataSet GetActiveEmployeeNames(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataSet("READ_ACTIVE_EMPLOYEE_NAMES");
        }

        public DataTable ReadEmployeeLeaveList(params object[] parameterValues)
        {
            DataTable dt = null;
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_EMPLOYEE_LEAVES", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public DataSet GetLeaveBalanceDetails(params object[] parameterValues)
        {
            DataSet ds = null;
            try
            {
                ds = DataAccess.ExecuteDataset("READ_EMPLOYEE_LEAVES_FOR_EMP_LEAVETYPE", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return ds;
            
        }

        public int CreateLeaveBalanceForFeatureYear(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("MTS_CALCULATELEAVE_EMPLOYEE_YEARLYONCE", parameterValues));
        }

        public int AddAdvanceCreditLeave(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("ADD_EMPLOYEE_LEAVE_BALANCE", parameterValues));
        }
        public DataTable ReadLeaveType(params object[] parameterValues)
        {
            DataTable dt = null;
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_LEAVE_TYPE_FOR_EMPLOYEE", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }
        public int UpdateAdvanceCreditAndAvailed(params object[] parameterValues)
        {
            int rowsaffected = 0;
            try
            {
                rowsaffected = DataAccess.ExecuteNonQuery("UPDATE_EMPLOYEE_LEAVE_BALANCE", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return rowsaffected;
        }

        public DataTable GetDetailedLeaveList(params object[] parameters)
        {
            DataTable dt = null;
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_DETAILED_EMPLOYEE_LEAVE", parameters);
            }
            catch(Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }
    }
}
