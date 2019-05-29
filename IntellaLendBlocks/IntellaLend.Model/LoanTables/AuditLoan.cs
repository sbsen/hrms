using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class AuditLoan
    {
        [Key]
        public Int64 AuditID { get; set; }
        public string AuditDescription { get; set; }
        public DateTime AuditDateTime { get; set; }
        public Int64 LoanID { get; set; }
        public Int64 UploadedUserID { get; set; }
        public Int64 ReviewTypeID { get; set; }
        public Int64 LoanTypeID { get; set; }
        public Int64 LoggedUserID { get; set; }
        public Int64 Status { get; set; }
        public int SubStatus { get; set; }
        public DateTime? LoanCreatedOn { get; set; }
        public DateTime? LoanLastModifiedOn { get; set; }
        public string FileName { get; set; }
        public Int64 CustomerID { get; set; }
        public string LoanNumber { get; set; }
    }
}
