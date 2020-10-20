using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Models
{
    public class Message
    {

        public Int64 Id { get; set; }

        [Required]
        public Int64 Employee_Id { get; set; }

        [Required]
        public DateTime FromDate { get; set; }

        [Required]
        public DateTime ToDate { get; set; }

        [Required]
        public string MessageHeader { get; set; }

        [Required]
        public string MessageTitle { get; set; }

        [Required]
        public string TextMessage { get; set; }

        public int Status { get; set; }
        
        public int MessageStatus { get; set; }

        [Required]
        public int TemplateType { get; set; }
    }
}