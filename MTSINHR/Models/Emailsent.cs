using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LoginModule.Models
{
    public class Emailsent
    {

        
        public string To { get; set; }
        
        
        public string Subject { get; set; }
        
        
        public string Body { get; set; }
        
        
        public string Email { get; set; }
        
        
        public string Password { get; set; }



    }
}