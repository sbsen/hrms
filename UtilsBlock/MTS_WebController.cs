using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;


namespace MTSEntBlocks.UtilsBlock
{
    public class MTSWebPage : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            HttpContext ctx = HttpContext.Current;

            // check if session is supported
            if (ctx.Session != null)
            {
                if (SessionHelper.LogonUser == null)
                {
                    HttpContext.Current.Response.Redirect(@"~/Account/Logon");
                }
            }
        }
    }
}
