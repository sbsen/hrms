using IntellaLend.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class UserSecurityQuestion
    {
        [Key]
        public Int64 ID { get; set; }
        public Int64 UserID { get; set; }
        public Int64 QuestionID { get; set; }
        public string Answer { get; set; }

        [NotMapped]
        public virtual SecurityQuestionMasters securityQuestion { get; set; }
    }
}
