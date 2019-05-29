using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class SecurityQuestionMasters
    {
        [Key]
        public Int64 QuestionID { get; set; }
        public string Question { get; set; }
        public bool Active { get; set; }
    }
}
