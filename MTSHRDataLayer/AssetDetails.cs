using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
   public class AssetDetails
    {

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("READ_ASSETDETAILS");

        }

    }
}
