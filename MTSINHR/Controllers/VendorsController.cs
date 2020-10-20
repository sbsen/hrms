using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.ExceptionBlock.Handlers;
using MTSINHR.Models;
using Newtonsoft.Json;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class VendorsController : SecureController
    {
        // GET: Vendors
        public ActionResult Vendors()
        {
           
            return View();
        }

        [HttpPost]
        public ActionResult AddVendorDetails(Vendors _vendor)
        {
            try
            {
                int result = 0;
                MTSHRDataLayer.Vendors _data = new MTSHRDataLayer.Vendors();
                result = _data.Create(Convert.ToInt32(_vendor.Type), _vendor.Name,
                                     _vendor.Address, _vendor.Phone,
                                     _vendor.ContactPerson, _vendor.MobileNo,
                                     _vendor.Email);


                if (result == 1)
                    return Content("Success");
                else
                    return Content("Failed");
            }

            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
                throw exec;
            }
        }

        public ActionResult Read()
        {
            MTSHRDataLayer.Vendors vendor = new MTSHRDataLayer.Vendors();
            return Json(JsonConvert.SerializeObject(vendor.ReadVendorName().Tables[0]), JsonRequestBehavior.AllowGet);
        }

    }
}