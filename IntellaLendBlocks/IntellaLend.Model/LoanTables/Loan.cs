using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class Loan
    {       
        //public Loan()
        //{
        //    this.LoanDetails = new HashSet<LoanDetail>();
        //    this.LoanImages = new HashSet<LoanImage>();
        //}
    
        [Key]
        public Int64 LoanID { get; set; }
        public string LoanNumber { get; set; }
        public Int64 UploadedUserID { get; set; }
        public Int64 ReviewTypeID { get; set; }
        public Int64 LoanTypeID { get; set; }
        public Int64 LoggedUserID { get; set; }
        public Int64 Status { get; set; }
        public int SubStatus { get; set; }
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string FileName { get; set; }
        public Int64 CustomerID { get; set; }
        public Int64 LastAccessedUserID { get; set; }
        public string Notes { get; set; } 
        
        [NotMapped]
        public LoanDetail LoanDetails { get; set; }
        [NotMapped]
        public LoanImage LoanImages { get; set; }
        [NotMapped]
        public LoanSearch LoanSearch { get; set; }
        [NotMapped]
        public List<AuditLoan> AuditLoan { get; set; }
        //public virtual CustomerMaster CustomerDetails { get; set; }
        //public virtual User User { get; set; }
        //public virtual ReviewTypeMaster ReviewTypeMaster { get; set; }
        //public virtual LoanTypeMaster LoanTypeMaster { get; set; }
        //public virtual User LoggedUser { get; set; }
    }
}
