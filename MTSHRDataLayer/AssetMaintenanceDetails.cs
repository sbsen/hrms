using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
   public class AssetMaintenanceDetails
    {
        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("READ_ASSET_MAINTENANCDE");

        }

        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteNonQuery("CREATE_ASSET_MAINTENANCE", parameterValues));

        }


        public DataSet GetAssetName()
        {
            return DataAccess.ExecuteDataSet("READ_ASSET_NAME");

        }
    }
}
