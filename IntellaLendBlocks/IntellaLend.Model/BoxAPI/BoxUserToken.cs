using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{

    public class BoxUserToken
    {        
        [Key]
        public Int64 ID { get; set; }
        public Int64 UserID { get; set; }
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public int ExpireTime { get; set; }
        public string TokenType { get; set; }        
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }

    }
}
