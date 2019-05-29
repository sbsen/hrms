using MTSINHR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class UserContactsController : SecureController
    {
        //
        // GET: /UserContacts/

        [HttpPost]
        public JsonResult Edit(Contact con)
        {
            MTSHRDataLayer.EmployeeContact data_contact = new MTSHRDataLayer.EmployeeContact();
            var result = data_contact.Update(con.Employee_Id, con.Employee_Alternate_Mobile, con.Personal_MailId, con.Emergency_ContactName, con.Emergency_ContactNumber, con.Contact_Relationship);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }

    }
}
