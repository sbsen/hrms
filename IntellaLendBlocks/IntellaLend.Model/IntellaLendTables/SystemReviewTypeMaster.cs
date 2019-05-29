using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class SystemReviewTypeMaster
    {
        [Key]        
        public Int64 ReviewTypeID { get; set; }
        public string ReviewTypeName { get; set; }
        public Int32 Type { get; set; }
        public bool Active { get; set; }
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public Int64? ReviewTypePriority { get; set; }
    }
}
