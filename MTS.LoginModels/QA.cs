using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;
using System.Web.Mvc;

namespace MTS.LoginModels
{
    public class QA
    {
        [Required (ErrorMessage="The Question field is required"), StringLength(250, ErrorMessage = "Maximum 250 characters is acceptable.")]
        public string SecurityQuestionName { get; set; }

        public Int64 SecurityQuestionid { get; set; }

        public bool Active { get; set; }
    }
  
}