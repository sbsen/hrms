using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace MTS.Helpers
{
    public static class ResourceHelper
    {
        public static string GetResource(string path, string sourcename)
        {
            object msg = HttpContext.GetLocalResourceObject(path, sourcename);
            return msg == null ? sourcename : msg.ToString();
        }
    }
}
