using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class CustLoanDocMapping
    {
        //public CustLoanDocMapping()
        //{
        //    this.CustomerMaster = new CustomerMaster();
        //    this.LoanTypeMaster = new LoanTypeMaster();
        //    this.DocumentTypeMaster = new DocumentTypeMaster();
        //}

        [Key]
        public Int64 ID { get; set; }
        public Int64 CustomerID { get; set; }
        public Int64 LoanTypeID { get; set; }
        public Int64 DocumentTypeID { get; set; }
        public bool Active { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }

        [NotMapped]
        public CustomerMaster CustomerMaster { get; set; }
        [NotMapped]
        public LoanTypeMaster LoanTypeMaster { get; set; }
        [NotMapped]
        public DocumentTypeMaster DocumentTypeMaster { get; set; }
    }
}
