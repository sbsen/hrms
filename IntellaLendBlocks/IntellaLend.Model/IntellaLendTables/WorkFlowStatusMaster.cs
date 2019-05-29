using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class WorkFlowStatusMaster
    {
        [Key]
        public Int64 ID { get; set; }
        public Int64 StatusID { get; set; }
        public string StatusDescription { get; set; }
    }
}
