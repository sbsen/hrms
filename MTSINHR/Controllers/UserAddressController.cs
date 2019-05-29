using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.DataBlock;
using MTSINHR.Models;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class UserAddressController : SecureController
    {
        //
        // GET: /UserAddress/


        [HttpPost]
        public JsonResult Edit(Address address)
        {
            MTSHRDataLayer.Address data_address = new MTSHRDataLayer.Address();
            var result = data_address.Update(address.Employee_Id, address.Current_Building, address.Current_City, address.Current_State, address.Current_Pincode, address.Permanent_Building, address.Permanent_City, address.Permanent_State, address.Permanent_Pincode);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }

    }
}
