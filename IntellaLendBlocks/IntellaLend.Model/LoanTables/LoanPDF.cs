using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class LoanPDF
    {
        [Key]
        public Int64 LoanPDFID { get; set; }
        public Int64 LoanID { get; set; }
        public string LoanPDFPath { get; set; }
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
