using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class AssetDashboard
    {
        public DataSet ReadAssetDashboardDetails()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = DataAccess.ExecuteDataSet("READ_ASSET_DASHBOARD_DETAILS");
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
            }
            return ds;
        }
        public DataTable ReadAssetAssignedCount()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_ASSETS_ASSIGNED_TO_EMPLOYEE_COUNTS");
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return dt;
        }
        public DataTable ReadEmployeeAssignedAsset(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_ASSETS_ASSIGNED_TO_EMPLOYEE",parameterValues);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return dt;
        }
        public Int64 UnAssignAsset(params object[] parameterValues)
        {
            try
            {
                return DataAccess.ExecuteNonQuery("UPDATE_UNASSIGN_ASSET", parameterValues);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
            }
            return -1;
        }

        public DataTable ReadDashboardTable(params object[] parameterValues)
        {
            var dt= DataAccess.ExecuteDataTable("READ_ASSET_DASHBOARD_TABLE", parameterValues);
            return dt;


        }
        public DataTable ReadAssetClassification(params object[] parameterValues)
        {
            var dt = DataAccess.ExecuteDataTable("READ_ASSET_CLASSIFICATION_COUNT", parameterValues);
            return dt;


        }
       


    }
}
