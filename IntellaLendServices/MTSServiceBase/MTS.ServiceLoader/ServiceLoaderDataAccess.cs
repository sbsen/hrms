using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MTSEntBlocks.DataBlock;
namespace ServiceLoader
{
    class ServiceLoaderDataAccess
    {
        public static DataTable GetServiceServiceConfig(string ServiceName)
        {
            return DataAccess.ExecuteDataTable("[MTS_GETSERVICECONFIGFORSERVICE]", ServiceName);
        }
        public static void UpdateServiceStatus(string ServiceName, short Status)
        {
            DataAccess.ExecuteNonQuery("[MTS_UPDATESERVICESTATUS]",  ServiceName, Status );
        }

        public static DataTable GetTenantSpecificTime(string SPandParameter)
        {
            string[] sparr = SPandParameter.Split('|');
            if(sparr.Length>1)
                return DataAccess.ExecuteDataTable(sparr[0].Trim(), sparr[1].Split(','));
            else
                return DataAccess.ExecuteDataTable(sparr[0].Trim(), null);
        }
    }
}
