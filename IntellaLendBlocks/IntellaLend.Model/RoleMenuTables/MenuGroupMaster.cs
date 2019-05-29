using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class MenuGroupMaster
    {       
        [Key]
        public Int64 MenuGroupID { get; set; }
        public string MenuGroupIcon { get; set; }
        public string MenuGroupTitle { get; set; }
    }
}
