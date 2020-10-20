using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;
using System.Data;

namespace MTSHRDataLayer
{
   public class AssetReportView
    {
        public DataTable ReadAssetMaster()
        {
            return DataAccess.ExecuteDataTable("READ_ASSET_MASTER");
        }

        public DataTable ReadAssetMaintenance(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_ASSET_MAINTENANCE", parameterValues);
        }

        public DataTable ReadAmcDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_AMC_DETAILS", parameterValues);
        }

        public DataTable ReadAssetSale(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_ASSET_SALE", parameterValues);
        }

        public DataTable ReadAssignAsset(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("[READ_ASSIGN_ASSET]", parameterValues);
        }

        public DataTable ReadInvoiceImages(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_INVOICE_IMAGES", parameterValues);
        }
        public DataTable ReadAmcImages(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_Amc_IMAGES", parameterValues);
        }
    }
}
