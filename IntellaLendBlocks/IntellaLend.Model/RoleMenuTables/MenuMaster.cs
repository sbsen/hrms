using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class MenuMaster
    {
        public MenuMaster()
        {
            this.RoleMenuMappings = new HashSet<RoleMenuMapping>();
        }
    
        [Key]
        public Int64 MenuID { get; set; }
        public string Icon { get; set; }
        public string MenuTitle { get; set; }
        public string RouteLink { get; set; }
        public Int64 MenuGroupID { get; set; }

        [NotMapped]
        public ICollection<RoleMenuMapping> RoleMenuMappings { get; set; }
    }
}
