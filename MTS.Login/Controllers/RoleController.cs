using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using MTS.Login.Data;
using MTS.LoginModels;
using System.Net.Mail;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;
using MTS.Controllers;


namespace MTS.Login.Controllers
{
    public class RoleController : SecureController
    {
        RoleData roleData = new RoleData();

        //
        // GET: /Role/

        public ActionResult Role(GridModel gridmodel)
        {
            gridmodel.Data = roleData.GetData();
            return View(gridmodel);
        }

        public ActionResult GetData()
        {
            GridModel gridmodel=new GridModel();
            gridmodel.Data = roleData.GetData();
            return PartialView("_PVRoleData", gridmodel);
        }

        [HttpGet]
        public ActionResult _PartialViewLoad(Int64 id, int type)
        {
            if (type == 2)
            {
                RoleModel model = new RoleModel();
                roleData.GetAccess(id, model);
                return PartialView("_PVSetAccess", model);
            }

            return PartialView();
        }

        [HttpPost]
        public ActionResult SetRoleAccess(Int64 RoleID,string access)
        {
            int result = roleData.SetAccess(RoleID, access);

            if(result==1)
                return Content("Access Rights set to the Role");
            else
                return Content("Unable to set Access Rights");
        }
    }
}
