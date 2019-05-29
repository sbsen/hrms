using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntityDataAccess;
using IntellaLend.Model;

namespace IntellaLend.WFProxy
{
    public class WFProxyDataAccess
    {
        public static string SystemSchema = "IL";

        public static string WorkFlowURL
        {
            get
            {
                using (var db = new DBConnect(SystemSchema))
                {
                    AppConfig appConfig = db.AppConfig.AsNoTracking().Where(a => a.ConfigKey == "WORKFLOWURL").FirstOrDefault();

                    if (appConfig != null)
                        return appConfig.ConfigValue;
                }
                return string.Empty;
            }
        }
    }
}
