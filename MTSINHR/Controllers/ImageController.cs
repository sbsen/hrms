using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class ImageController : SecureController
    {
        //
        // GET: /Image/

        [HttpPost]
        public ActionResult EmployeeImage()
        {
            var empid = Request.Params["empid"].ToString(); 

            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];

                if (file != null && file.ContentLength > 0)
                {
                    BinaryReader reader = new BinaryReader(file.InputStream);
                    MTSHRDataLayer.EmployeeImage data_image = new MTSHRDataLayer.EmployeeImage();

                    byte[] bytes = reader.ReadBytes((int)file.ContentLength);
                    int result = data_image.Create(empid, bytes);
                    return Content("Success");
                }
            }
            return Content("Failed");
        }
    }
}
