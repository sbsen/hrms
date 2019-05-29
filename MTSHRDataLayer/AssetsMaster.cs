using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
   public class AssetsMaster
    {
        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteNonQuery("create_asset", parameterValues));

        }
        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("READ_MTS_ASSET");

        }
        public int Update(params object[] parameterValues)
        {
            Int16 data = Convert.ToInt16(DataAccess.ExecuteNonQuery("UPDATE_ASSET", parameterValues));
            return data;
        }


    }
}
