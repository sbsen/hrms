using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Web.Routing;
using MTSEntBlocks.UtilsBlock.Web;
using System.Data;
using MTSEntBlocks.DataBlock;
using System.IO;
using System.Xml.Linq;
using MTS.Helpers;


namespace MTSEntBlocks.UtilsBlock
{
    public class MTS_Controller : Controller
    {
        private static string menuurls;

        public static string Menuurls
        {
            get { return MTS_Controller.menuurls; }
            set { MTS_Controller.menuurls = value; }
        }
         
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            IMenuBuildSession menusession = (IMenuBuildSession)SessionHelper.LogonUser;
            Menulinks objMenulinks = new Menulinks();
            string xmlFileName = filterContext.HttpContext.Request.MapPath(@"~/Content/AppMenu.xml");
            if (menusession != null)
            {
                Menuurls = objMenulinks.readmenu(menusession.USERROLE.ToString(), xmlFileName, false, menusession.USERROLE.ToString());
            }
            else
            {
                HttpContext.Response.Redirect(@"~/Account/Logon");
            }
        }
    }
}
