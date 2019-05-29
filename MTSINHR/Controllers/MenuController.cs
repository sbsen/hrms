using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.UtilsBlock;
using MTSEntBlocks.UtilsBlock.Web;

namespace MTS.Controllers
{
    public class MenuController : MTS_Controller
    {
        //
        // GET: /Menu/

        public ActionResult Displaytopmenu()
        {
            try
            {
                TempData["menu"] = Menuurls;
                return PartialView("_PVMenu");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
