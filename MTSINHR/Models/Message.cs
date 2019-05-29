using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

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


    }
}