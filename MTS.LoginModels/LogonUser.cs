using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections;

//using Tranflow.Data;

using System.ComponentModel.DataAnnotations;





namespace MTS.LoginModels
{

    public class LogonUser
    {
       
        // [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Please enter a valid e-mail address")]

        //// [DataType(DataType.EmailAddress, ErrorMessage = "Invalid Email Address1")]     
        // [DataType(DataType.EmailAddress)]     
        [Required]
        [Display(Name = "Username")]
        public string UserName { get; set; }

        [Required]
        //[PasswordLength]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }

        public string TempPassword { get; set; }

        public string Message { get; set; }




    }



    public class UserDetails : LogonUser
    {
        public Int64 UserId { get; set; }
        public DateTime LastPwdChange { get; set; }
        public byte Status { get; set; }
        public int NoOfAttempts { get; set; }
        public bool MenuRange { get; set; }
        public int PasswordCount { get; set; }
        public bool Locked { get; set; }
        public int PwdChangeDays { get; set; }
        public int MaxAttemps { get; set; }
        public string DBPassword { get; set; }
        public int Active { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Cardtype { get; set; }
        public string Cardnumber { get; set; }
        

        public Int64 CompanyId { get; set; }
        public Int64 RoleId { get; set; }
        public string RoleName { get; set; }
        public string ReportingTo { get; set; }

        public Int64 SecQunId { get; set; }
        public string SecAns { get; set; }
        public string Mailid { get; set; }

        public string CompanyName { get; set; }//senthil 072612
    }




    public class ForgotPasswordModel 
    {
        [Required]
        [Display(Name = "User Name")]
        public string UserName { get; set; }
        //public string Password { get; set; }
        public string Message { get; set; }


        
        public SecurityQuestionBaseModel inhrtSecurityQuestionModel { get; set; }



    }

    public class ChangePasswordModel : ChangePasswordBaseModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string CurrentPassword { get; set; }

     


    }

    public class PasswordHistory : ChangePasswordModel
    {
        public List<PasswordHistory> pwdHistory { get; set; }
        public Int64 Ph_Id { get; set; }
        public string DBPassword { get; set; }
    }


    public class ChangePasswordBaseModel
    {
        [Required]
        [PasswordLength]
        //[StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 8)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [System.ComponentModel.DataAnnotations.Compare("NewPassword", ErrorMessage = Msg.PWDCOMPARE)]
        public string ConfirmPassword { get; set; }

        public string HashCurrentPassword { get; set; }

        public string HashConfirmPassword { get; set; }

        public string Message { get; set; }
    }



    public class SecurityQuestionModel : ChangePasswordBaseModel
    {

        public List<SelectListItem> SecurityQsns { get; set; }
        
        [Required]

        public Int64 SelectedSecQsn { get; set; }

         [Required]
        public string SecAns { get; set; }

        
        //public ChangePasswordBaseModel InhrPasswordBaseModel { get; set; }



    }

    public class SecurityQuestionBaseModel 
    {

        public List<SelectListItem> SecurityQsns { get; set; }
        [Required(ErrorMessage = "Please Select Security Question")]
        public Int64 SelectedSecQsn { get; set; }

        [Required(ErrorMessage = "Security Answer field is required")]
        public string SecAns { get; set; }

        public string Message { get; set; }

        //public ChangePasswordBaseModel InhrPasswordBaseModel { get; set; }



    }

}