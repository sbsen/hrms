using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{    
    public class StackingOrderDetailMaster
    {
        [Key]
        public Int64 StackingOrderDetailID { get; set; }
        public Int64 StackingOrderID { get; set; }
        public Int64 DocumentTypeID { get; set; }
        public Int64 SequenceID { get; set; }
        public bool Active { get; set; }
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }

        //public virtual StackingOrderMaster StackingOrderMaster { get; set; }
    }
}
