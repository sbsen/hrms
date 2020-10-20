using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class Payroll
    {
        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("GET_ACTIVE_EMPLOYEE_FOR_PAYROLL"); 
        }

        public int AddMonthlyVarianceData(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("ADD_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL", parameterValues));
        }
        public int UpdateMonthlyVarianceData(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("UPDATE_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL", parameterValues));
        }
        public int SubmitPayrollDetails(params object[] parameterValues)
        {
            Int16 res = 0;
            try
            {
                res = Convert.ToInt16(DataAccess.ExecuteScalar("ADD_EMPLOYEE_PAYROLL_DETAILS", parameterValues));
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return res;
        }

        public DataSet GetMonthlyVarianceData(params object[] parameterValues)
        {
            DataSet dt = null;
            try
            {
                dt = DataAccess.ExecuteDataset("GET_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public DataSet GetEmployeePayrollDetails(params object[] parameterValues)
        {
            DataSet dt = null;
            try
            {
                dt = DataAccess.ExecuteDataset("GET_EMPLOYEE_PAYROLL_DETAILS", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }
        public DataSet GetDeductionCalculationDetails(params object[] parameterValues)
        {
            DataSet dt = null;
            try
            {
                dt = DataAccess.ExecuteDataset("GET_EMPLOYEE_PF_ESI_PROFESSIONAL_TAX_PAYROLL", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public DataSet GetPayrollDetails(params object[] parameterValues)
        {
            DataSet dt = null;
            try
            {
                dt = DataAccess.ExecuteDataset("GET_EMPLOYEE_PAYROLL_DETAILS", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }
        public DataSet GetMonthlyPayrollData(params object[] parameterValues)
        {
            DataSet dt = null;
            try
            {
                dt = DataAccess.ExecuteDataset("READ_PAYROLL_EMPLOYEE_DETAILS", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public DataSet Get_Lop_Days(params object[] parameterValues)
        {
            DataSet dt = null;
            try
            {
                dt = DataAccess.ExecuteDataset("MTS_READ_PAYROLL_LOP_DETAILS", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public Int32 ClosePayrollData(params object[] parameterValues)
        {
            Int32 dt = 0;
            try
            {
                dt = Convert.ToInt32(DataAccess.ExecuteScalar("UPDATE_PAYROLL_CLOSE_MONTH", parameterValues));
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public string GetPayrollFromDate(params object[] parameterValues)
        {
            String dt = "";
            try
            {
                dt = Convert.ToString(DataAccess.ExecuteScalar("MTS_PAYROLL_GET_FROM_MONTH", parameterValues));
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public DataTable GetpayrollReport(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_PAYROLL_REPORT_SUMMARY", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public DataTable GetDownloadPayroll(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("MTS_PAYROLLBANK_SHEET_REPORT", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public string GetPayrollToDate(params object[] parameterValues)
        {
            String dt = "";
            try
            {
                dt = Convert.ToString(DataAccess.ExecuteScalar("MTS_PAYROLL_GET_TO_MONTH", parameterValues));
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public string GetPayrollPreviousBonus(params object[] parameterValues)
        {
            String dt = "";
            try
            {
                dt = Convert.ToString(DataAccess.ExecuteScalar("MTS_PAYROLL_GET_PREVIOUS_BONUSMONTH", parameterValues));
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public string GetPayrollMonth(params object[] parameterValues)
        {
            String dt = "";
            try
            {
                dt = Convert.ToString(DataAccess.ExecuteScalar("MTS_PAYROLL_GET_PAYROLL_MONTH"));
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }

        public Int32 CheckPayrollData(params object[] parameterValues)
        {
            Int32 dt = 0;
            try
            {
                dt = Convert.ToInt32(DataAccess.ExecuteScalar("CHECK_PAYROLL_CLOSE_MONTH", parameterValues));
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }
        public Int32 ProcessPayrollData(params object[] parameterValues)
        {
            Int32 res = 0;
            try
            {
                res = DataAccess.ExecuteNonQuery("MTS_PAYROLL_CONSOLIDATE_SALARY_DETAILS", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return res;
        }
        public DataTable GetEmployeeLossOfPayDetails(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_EMPLOYEE_MONTHLY_LOP_DAYS", parameterValues);
            }
            catch(Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        public Int64 AddOrRemoveLop(params object[] parameterValues)
        {
            Int64 dt = new Int64();
            try
            {
                dt = Convert.ToInt64(DataAccess.ExecuteScalar("ADD_OR_IGNORE_EMPLOYEE_LOP_DAYS", parameterValues));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        public Int64 UpdatePayrollDetails(params object[] parameterValues)
        {
            Int64 dt = new Int64();
            try
            {
                dt = Convert.ToInt64(DataAccess.ExecuteNonQuery("MTS_UPDATE_PAYROLL_DETAILS_FOR_EMPLOYEE", parameterValues));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        
        public Int64 UpdatePrevBounsDate(params object[] parameterValues)
        {
            Int64 result = 0;
            try
            {
                result = Convert.ToInt64(DataAccess.ExecuteNonQuery("UPDATE_PREV_BOUNS_DATE", parameterValues));
            }
            catch(Exception e)
            {
                e.Data.Clear();
            }
            return result;
        }

        public Int64 RevisePayrollDetails(params object[] parameterValues)
        {
            Int64 result = 0;
            try
            {
                result = Convert.ToInt64(DataAccess.ExecuteNonQuery("REVISE_EMPLOYEE_PAYROLL_DETAILS", parameterValues));
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return result;
        }
    }  
}
