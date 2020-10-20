using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class AssignAsset
    {
        public DataTable GetSpecificAsset(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_FILTERED_ASSET_NAME", parameterValues);

        }

        public DataSet GetActiveEmployees()
        {
            return DataAccess.ExecuteDataSet("READ_ACTIVE_EMPLOYEE_NAMES");
        }

        public DataSet GetLocations()
        {
            return DataAccess.ExecuteDataSet("READ_LOCATION");
        }

        public DataTable GetItemCode(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_SELECTED_ASSET_ITEM_CODE", parameterValues);
        }

        public DataTable GetLocationDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_LOCATION_DETAILS", parameterValues);
        }

        public DataTable GetDescription(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_SELECTED_ITEM_DESCRIPTION", parameterValues);
        }

        public DataSet GetDepartments()
        {
            return DataAccess.ExecuteDataSet("READ_DEPARTMENT");
        }

        public String  GetCurrentlyAssignedEmployee(params object[] parameterValues)
        {
            return Convert.ToString(DataAccess.ExecuteScalar("READ_CURRENTLY_ASSIGNED_EMPLOYEE", parameterValues));
        }

        public int AddAssetAssignment(params object[] parameterValues)
        {
            return Convert.ToInt32(DataAccess.ExecuteScalar("CREATE_ASSIGN_ASSET", parameterValues));
        }
    }
}


