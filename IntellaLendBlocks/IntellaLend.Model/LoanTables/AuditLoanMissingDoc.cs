using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class AuditLoanMissingDoc
    {
        [Key]
        public Int64 AuditID { get; set; }
        public string AuditDescription { get; set; }
        public DateTime AuditDateTime { get; set; }
        public Int64 LoanID { get; set; }
        public Int64 DocID { get; set; }
        public Int64 UserID { get; set; }
        public Int64 Status { get; set; }
        public string FileName { get; set; }
    }
}
