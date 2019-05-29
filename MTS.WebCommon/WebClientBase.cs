using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace WRITS.WebCommon
{
  public class WebClientBase
    {
        public static string GetIPAddress(HttpRequestBase request)
        {
            string ip = string.Empty;
            try
            {
                ip = request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (!string.IsNullOrEmpty(ip))
                {
                    if (ip.IndexOf(",") > 0)
                    {
                        string[] allIps = ip.Split(',');
                        int le = allIps.Length - 1;
                        ip = allIps[le];
                    }
                }
                else
                {
                    ip = request.UserHostAddress;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ip;
        }

        public static string GetBrowserTypeAndVersion(HttpRequestBase request)
        {
            try
            {
                
                return request.Browser.Browser + " Ver: " + request.Browser.MajorVersion; ;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
