using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{

    public class DocumentTypeMaster
    {
        
        //public DocumentTypeMaster()
        //{
        //    this.DocumentFieldMasters = new HashSet<DocumentFieldMaster>();
        //    this.LoanImages = new HashSet<LoanImage>();
        //}
        [Key]
        public Int64 DocumentTypeID { get; set; }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public bool Active { get; set; }
        public Int32 DocumentLevel { get; set; }
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
        //public virtual LoanTypeMaster LoanTypeMaster { get; set; }

        [NotMapped]
        public List<DocumentFieldMaster> DocumentFieldMasters { get; set; }

        [NotMapped]
        public string DocumentLevelDesc { get; set; }
        //public virtual ICollection<LoanImage> LoanImages { get; set; }
    }
}
