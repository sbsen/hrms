using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{

    public class Module
    {
        public DataSet GetApprovers(params object[] parameters)
        {
            DataSet ds = null;
            try
            {
                ds = DataAccess.ExecuteDataset("Get_Approvers_Initiators", parameters);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return ds;
        }

        public DataSet GetApprovalDetails(params object[] parameters)
        {
            DataSet ds = null;
            try
            {
                ds = DataAccess.ExecuteDataset("READ_APPROVAL_DETAILS", parameters);
            }
            catch(Exception ex)
            {
                ds = null;
                ex.Data.Clear();
            }
            return ds;
        }

        public Int64 InsertApprovalDetails(params object[] parameters)
        {
            Int64 res = 0;
            try
            {
                res = DataAccess.ExecuteNonQuery("INSERT_APPROVAL_DETAILS", parameters);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return res;
        }

        public DataTable ValidateApprovalDetails(params object[] parameters)
        {
            DataTable dt = null;
            try
            {
                dt = DataAccess.ExecuteDataTable("VALIDATE_APPROVAL_DETAILS", parameters);
            }
            catch (Exception ex)
            {
                dt = null;
                ex.Data.Clear();
            }
            return dt;
        }

        public DataTable ReadApprovalActionsDetails(params object[] parameters)
        {
            DataTable dt = null;
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_APPROVAL_ACTION_DETAILS", parameters);
            }
            catch (Exception ex)
            {
                dt = null;
                ex.Data.Clear();
            }
            return dt;
        }

        public DataTable ViewModulePagedetails(params object[] parameters)
        {
            DataTable dt = null;
            try
            {
                dt = DataAccess.ExecuteDataTable("VIEW_MODULE_PAGE", parameters);
            }
            catch (Exception ex)
            {
                dt = null;
                ex.Data.Clear();
            }
            return dt;
        }

        public DataTable GetRejectedApprovalDetails(params object[] parameters)
        {
            DataTable dt = null;
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_REJECTED_APPROVAL_MODULE", parameters);
            }
            catch (Exception ex)
            {
                dt = null;
                ex.Data.Clear();
            }
            return dt;
        }
    }
}
