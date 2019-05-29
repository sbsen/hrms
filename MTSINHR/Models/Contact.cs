using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Contact
    {
        public Int64 id { get; set; }

        public Int64 Employee_Id { get; set; }

        public string Employee_Alternate_Mobile { get; set; }

        public string Personal_MailId { get; set; }

        public string Emergency_ContactName { get; set; }

        public string Emergency_ContactNumber { get; set; }

        public Int64 Contact_Relationship { get; set; }
    }
}