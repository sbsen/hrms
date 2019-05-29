using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class LoanImage
    {
        [Key]
        public Int64 LoanImageID { get; set; }
        public Int64 LoanID { get; set; }
        public Int64 DocumentTypeID { get; set; }
        public Int64 PageNo { get; set; }
        public byte[] Image { get; set; }
        public string Version { get; set; }
    
        //public virtual Loan Loan { get; set; }
        [NotMapped]
        public DocumentTypeMaster DocumentTypeMaster { get; set; }

        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
