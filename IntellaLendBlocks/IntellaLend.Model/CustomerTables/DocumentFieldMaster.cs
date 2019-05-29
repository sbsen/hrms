using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{

    public  class DocumentFieldMaster
    {
        [Key]
        public Int64 FieldID { get; set; }
        public Int64 DocumentTypeID { get; set; }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public bool Active { get; set; }
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string DocOrderByField { get; set; }
        //public virtual DocumentTypeMaster DocumentTypeMaster { get; set; }

        [NotMapped]
        public bool OrderBy { get; set; }
    }
}
