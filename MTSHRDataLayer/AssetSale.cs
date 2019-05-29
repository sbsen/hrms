using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MTSEntBlocks.DataBlock;
namespace MTSHRDataLayer
{
  public  class AssetSale
    {
        public int Create(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("CREATE_ASSET_SALE", parameterValues);

        }
        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("ASSET_SALE");

        }
    }
}
