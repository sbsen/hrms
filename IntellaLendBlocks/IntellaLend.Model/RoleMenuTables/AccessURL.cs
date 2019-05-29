using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class AccessURL
    {
        [Key]
        public Int64 ID { get; set; }
        public Int64 RoleID { get; set; }
        public string URL { get; set; }
    
        //public virtual RoleMaster RoleMaster { get; set; }
    }
}
