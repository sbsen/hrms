using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.ResourceExtension
{
    public static class Extensions
    {
        public static string LocalResources(this WebViewPage page, string path,string key)
        {
            
            return page.ViewContext.HttpContext.GetLocalResourceObject(path, key) as string;
        }
    }
}