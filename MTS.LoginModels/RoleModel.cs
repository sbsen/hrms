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
    public class RoleModel
    {
        public Int64 RoleID { get; set; }
        public List<SelectListItem> SelectedAccess { get; set; }
        public List<SelectListItem> AvailableAccess { get; set; }
    }
}
