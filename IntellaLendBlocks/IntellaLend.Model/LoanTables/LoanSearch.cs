using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class LoanSearch
    {
        [Key]
        public Int64 ID { get; set; }
        public Int64 LoanID { get; set; }
        public Int64 LoanTypeID { get; set; }
        public string LoanNumber { get; set; }
        public string BorrowerName { get; set; }
        public DateTime? ReceivedDate { get; set; }
        public Int64 Status { get; set; }        
        public decimal LoanAmount { get; set; }
        public string SSN { get; set; }
        public Int64 CustomerID { get; set; }
        public string AuditMonthYear { get; set; }

        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }

        [NotMapped]
        public LoanTypeMaster LoanTypeMaster { get; set; }
        //public virtual WorkFlowStatusMaster WorkFlowStatusMaster { get; set; }
    }
}
