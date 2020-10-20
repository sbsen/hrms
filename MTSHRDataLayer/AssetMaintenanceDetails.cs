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
            return DataAccess.ExecuteDataTable("READ_ASSET_MAINTENANCE");

        }

        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteNonQuery("CREATE_ASSET_MAINTENANCE", parameterValues));

        }
        
        public DataTable GetSpecificAsset(Int64 parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_FILTERED_ASSET_NAME", parameterValues);
        }
      
        public DataTable GetItem(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_ITEMCODE", parameterValues);
        }

        public DataTable GetItem_Amc_Insurance(params object[] parameterValues)
        {
            //int a = int.Parse(parameterValues[2].ToString());
            //if(a==0)
            //{
            //    return DataAccess.ExecuteDataTable("READ_ITEMCODE", parameterValues);
            //}
            //else
            //{
                return DataAccess.ExecuteDataTable("READ_ITEMCODE_AMCINSURANCE", parameterValues);
           // }
            
        }
    }
}
