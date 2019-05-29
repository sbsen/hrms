using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Model
{
    public class AppConfig
    {
        [Key]
        public Int64 ID { get; set; }
        public string ConfigKey { get; set; }
        public string ConfigValue { get; set; }
    }
}
