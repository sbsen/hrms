using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class EmployeeDetails
    {
        public Int64 id { get; set; }

        public string Employee_Id { get; set; }

        public string Skills { get; set; }

        public string Languages { get; set; }

        public string Educations { get; set; }

     }

    public class PersonalDetails
    {
         public Int64 id { get; set; }

         public Int64 Employee_Id { get; set; }

         public Int64 BloodGroup { get; set; }

         public string[] Languagename { get; set; }
    }
    
}