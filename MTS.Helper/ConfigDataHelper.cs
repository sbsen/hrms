using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using MTSEntBlocks.DataBlock;

namespace MTS.Helpers
{
    public class ConfigDataHelper
    {
        public static void LoadConfigData()
        {
            DataTable dtConfig = DataAccess.ExecuteDataTable("MTS_GETAPPCONFIG", null);
            try
            {
                foreach (DataRow dr in dtConfig.Rows)
                {
                    if (HttpContext.Current.Application[dr.ItemArray[0].ToString()] == null)
                        HttpContext.Current.Application[dr.ItemArray[0].ToString()] = dr.ItemArray[1].ToString();
                }
            }
            finally
            {
                dtConfig = null;
            }
        }

      
    }
}


