using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace ConsoleApplication2
{
    class Program
    {
        static void Main(string[] args)
        {
            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("info@mtsin.com", "info@smtp"),
                EnableSsl = true
            };
            client.Send("rajkumar.l@mtsin.com", "rajkumar.l@mtsin.com", "test", "testbody");
            Console.WriteLine("Sent");
            Console.ReadLine();
        }
    }
}