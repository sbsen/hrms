using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class AuditLoanDetail
    {
        [Key]
        public Int64 AuditID { get; set; }
        public string AuditDescription { get; set; }
        public DateTime AuditDateTime { get; set; }
        public Int64 LoanDetailID { get; set; }
        public Int64 LoanID { get; set; }
        public Int64 UpdatedUserID { get; set; }
        public string LoanObject { get; set; }
    }
}
