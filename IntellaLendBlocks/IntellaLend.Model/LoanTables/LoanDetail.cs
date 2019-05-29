using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class LoanDetail
    {
        [Key]
        public Int64 LoanDetailID { get; set; }
        public Int64 LoanID { get; set; }
        public string LoanObject { get; set; }

        //public virtual Loan Loan { get; set; }

        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
