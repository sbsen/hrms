using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace MTS.EmailManager
{
    public struct Template
    {
        public string To;
        public string From;
        public string Cc;
        public string BCc;
        public string Subject;
        public string Body;
        public MemoryStream Attachment;
        public string AttachmnetName;
        public string ContentType;
    }  
}
