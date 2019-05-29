using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.ComponentModel.DataAnnotations;


namespace MTS.LoginModels
{

    public class CommonDetails
    {
        [Required(ErrorMessage="The First Name field is required"), StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable."), RegularExpression("^[0-9a-zA-Z\\s]+$", ErrorMessage = "Only alphanumeric and white spaces are allowed.")]
        public string Firstname { get; set; }

        [Required(ErrorMessage="The Last Name field is required"), StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable."), RegularExpression("^[0-9a-zA-Z\\s]+$", ErrorMessage = "Only alphanumeric and white spaces are allowed.")]
        public string Lastname { get; set; }

        //[Remote("UserEmailExist", "User", HttpMethod = "POST", ErrorMessage = "Email id already exists.",AdditionalFields = "UserId")]
        [Required(ErrorMessage="The Email Id field is required"), RegularExpression("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", ErrorMessage = "Please enter a valid Email id."), StringLength(100, ErrorMessage = "Maximum 100 characters is acceptable.")]
        [Display(Name = "Email Id")]        
        public string Email { get; set; }

        [Required(ErrorMessage = "The Confirm Email Id field is required"), System.ComponentModel.DataAnnotations.Compare("Email")]
        public string ConfirmEmail { get; set; }

        public Int64 UserId { get; set; }
    }
    public class ListUser : CommonDetails
    {

        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> Locations { get; set; }
        public List<SelectListItem> Business { get; set; }
        public List<SelectListItem> Clients { get; set; }
        public List<SelectListItem> Companies { get; set; }

       public List<SelectListItem> Roles { get; set; }

    }


    public class BaseUser : ListUser
    {

        [Required (ErrorMessage="The User Id field is required"), StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable."), RegularExpression("^[0-9a-zA-Z]+$", ErrorMessage = "Only alphanumeric,white spaces are not allowed.")]
        [Display(Name = "User Name")]
        [Remote("UserNameExist", "User", HttpMethod = "POST", ErrorMessage = "User id already exists. Please enter a different user id.")]
        public string username { get; set; }

        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Locked")]
        public bool locked { get; set; }

      //  [Required (ErrorMessage = "Select Role field")]
     //  public Int64 Role { get; set; }

        [Required]
        public Int64 Department { get; set; }

        [Required]
        public Int64 Location { get; set; }

        [Required]
        public Int64 Businessid{ get; set; }

        [Required]
        public Int64 Client { get; set; }



        [Required]
        public Int64 Company { get; set; }

        public bool Active { get; set; }

        public bool ActiveCheck { get; set; }

        [Required]
        public int Role { get; set; }

       // [Required]
       // public Int64 Roles { get; set; }
       
        public List<SelectListItem> Roles { get; set; }
    }


    public class NewUser : BaseUser
    {
        public List<SelectListItem> SelectedRoles { get; set; }
        public List<SelectListItem> AvailableRoles { get; set; }
        public List<SelectListItem> AvailableRegion { get; set; }
        public List<SelectListItem> SelectedRegion { get; set; }
        public string Name { get; set; }
    }

    public class UserRole
    {
        //[Required]
        //public Int64 Role { get; set; }

        //public List<SelectListItem> Roles { get; set; }

        public Int64 total_User { get; set; }
    }

    public class DetailView : CommonDetails
    {
        [StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string address1 { get; set; }
        [StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string address2 { get; set; }
        [StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string city { get; set; }
        [StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string state { get; set; }
        [StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string country { get; set; }
        [StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string zipcode { get; set; }
        [StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string phoneNo { get; set; }
        [StringLength(30, ErrorMessage = "Maximum 30 characters is acceptable.")]
        public string mobile { get; set; }
    }
}