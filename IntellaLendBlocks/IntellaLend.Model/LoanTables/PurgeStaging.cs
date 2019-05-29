using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class PurgeStaging
    {
        [Key]
        public Int64 BatchID { get; set; }
        public long BatchCount { get; set; }
        
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public long Status { get; set; }

        public static implicit operator long (PurgeStaging v)
        {
            throw new NotImplementedException();
        }
    }
}
