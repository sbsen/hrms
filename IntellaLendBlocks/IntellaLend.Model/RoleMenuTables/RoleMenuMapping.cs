using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class RoleMenuMapping
    {
        [Key]
        public Int64 MappingID { get; set; }
        public Int64 MenuID { get; set; }
        public Int64 MenuOrder { get; set; }
        public Int64 RoleID { get; set; }
    
        //public virtual MenuMaster MenuMaster { get; set; }
        //public virtual RoleMaster RoleMaster { get; set; }
    }
}
