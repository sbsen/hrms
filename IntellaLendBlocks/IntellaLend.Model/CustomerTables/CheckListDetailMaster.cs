using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{

    public class CheckListDetailMaster
    {

        [Key]
        public Int64 CheckListDetailID { get; set; }
        public Int64 CheckListID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }
        public Int64? UserID { get; set; }

        [NotMapped]
        public CheckListMaster CheckListMaster { get; set; }
        [NotMapped]
        public RuleMaster RuleMasters { get; set; }
        [NotMapped]
        public User UserMaster { get; set; }
    }
}
