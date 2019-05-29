using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Text;
using MTS.Controllers;
using MTSEntBlocks.ExceptionBlock.Handlers;
using MTSINHR.Models;

namespace MTSINHR.Controllers
{
    public class PoliciesController : Controller
    {
   
        // GET: Policies
        public ActionResult UploadPolicy()
        {
            var docu = GetPolicyName();
            ViewBag.Documents = docu;
            TempData["Documents"] = docu;
            TempData.Keep("Documents");
            return View();
        }
        [HttpGet]
        public ActionResult AddPolicy()
        {

            return View();
        }

        [HttpPost]
        public JsonResult AddPolicy(string policyname)
        {
            MTSHRDataLayer.Policies data_policy = new MTSHRDataLayer.Policies();
            int result = data_policy.AddPolicies(policyname);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public JsonResult Edit(string id,String policyname )
        {
            MTSHRDataLayer.Policies data_policy = new MTSHRDataLayer.Policies();
            int result = data_policy.UpdatePolicies(Convert.ToInt16(id),policyname);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);


        }

        public JsonResult ReadPolicy()
        {
            MTSHRDataLayer.Policies data_doc = new MTSHRDataLayer.Policies();
            var d = data_doc.GetPolicies();
            return Json(JsonConvert.SerializeObject(data_doc.GetPolicies()), JsonRequestBehavior.AllowGet);
        }

        private List<SelectListItem> GetPolicyName()
        {
            MTSHRDataLayer.Policies data_doc = new MTSHRDataLayer.Policies();
            var Documents = data_doc.GetPolicies();
            List<SelectListItem> docu = new List<SelectListItem>();
            docu.Add(new SelectListItem() { Value = "", Text = "----Select Documents----" });
            for (int i = 0; i < Documents.Tables[0].Rows.Count; i++)
            {
                docu.Add(new SelectListItem() { Value = Documents.Tables[0].Rows[i]["id"].ToString(), Text = Documents.Tables[0].Rows[i]["PolicyName"].ToString() });
            }
            return docu;
        }


        public ActionResult ShowAllPolicies()
        {
            MTSHRDataLayer.Policies data_doc = new MTSHRDataLayer.Policies();
            var Documents = data_doc.GetPolicies();

            //var EmployeeNames = EmployeeNamedata.GetAllEmployeeNames();
            List<SelectListItem> Policies = new List<SelectListItem>();
            Policies.Add(new SelectListItem() { Value = "", Text = "----Select Employee----" });
            for (int i = 0; i < Documents.Tables[0].Rows.Count; i++)
            {
                string ID = Documents.Tables[0].Rows[i]["id"].ToString();
                Policies.Add(new SelectListItem() { Text = Documents.Tables[0].Rows[i]["PolicyName"].ToString(), Value = ID });
            }
            TempData["EmployeeNames"] = Policies;
            var docu = GetPolicyName();
            ViewBag.EmployeeNameList = Policies;
            ViewBag.Documents = docu;
            TempData["Documents"] = docu;
            TempData.Keep("Documents");
            return View();
        }

        [HttpPost]
        public ActionResult ImageFiles()
        {
            try
            {
               
                var docname = Request.Params["docname"].ToString();

                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];
                    string FileName = file.FileName;
                    if (file != null && file.ContentLength > 0)
                    {
                        BinaryReader reader = new BinaryReader(file.InputStream);
                        MTSHRDataLayer.Policies data_doc = new MTSHRDataLayer.Policies();
                        byte[] bytes = reader.ReadBytes((int)file.ContentLength);
                        int result = data_doc.Create(docname, bytes, FileName);
                        return Content("Success");
                    }
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Content("Failed");
        }

        public ActionResult GetDocuments(string Documents, string functiontype)
        {
            try
            {
                //Int64 Employee_Id = Convert.ToInt64(Request.Headers["employeeid"]);

                //if (Employee_Id == 0)
                //{
                //    Employee_Id = Convert.ToInt64(Session["UserID"]);
                //}
                int Documentid = Convert.ToInt32(Documents);
                MTSHRDataLayer.Policies data_document = new MTSHRDataLayer.Policies();
                DataTable Documentimage = data_document.Read(Documentid);

                if (Documentimage.Rows.Count > 0)
                {
                    byte[] imagedata = Documentimage.Rows[0]["DocumentImage"] as byte[];

                    string imagename = Documentimage.Rows[0]["DocumentName"].ToString();

                    string baseimage = Convert.ToBase64String(imagedata);
                    TempData["image"] = baseimage;
                    TempData["imagename"] = imagename;
                    TempData["functiontype"] = functiontype;
                    TempData.Keep("functiontype");
                    return Content("Success");
                }
                else
                {
                    return Content("Failed");
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Content("Failed");
        }


        public ActionResult ViewDocuments()
        {
            try
            {

                ViewBag.Documents = TempData["Documents"];
                TempData.Keep("Documents");
                ViewBag.Image = TempData["image"];
                ViewBag.Imagename = TempData["imagename"];
                string Imagename = TempData["imagename"].ToString();
                string checkfunction = TempData["functiontype"].ToString();
                TempData.Keep("functiontype");
                string ext = Path.GetExtension(Imagename);

                if (checkfunction == "Show")
                {
                    if (ext == ".pdf")
                    {
                        var imagefile = Convert.FromBase64String(TempData["image"].ToString());
                        return this.File(imagefile, "image/" + ext, Imagename);
                    }
                    else
                    {
                        return View("ShowAllPolicies");
                    }
                }
                else
                {
                    var imagefile = Convert.FromBase64String(TempData["image"].ToString());
                    return this.File(imagefile, "image/" + ext, Imagename);
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return View("ShowAllPolicies");

        }

        public ActionResult ViewAllEmployeeDocuments()
        {
            try
            {
               
                ViewBag.Documents = TempData["Documents"];
                TempData.Keep("Documents");
                ViewBag.Image = TempData["image"];

                string Imagename = TempData["imagename"].ToString();

                string checkfunction = TempData["functiontype"].ToString();
                TempData.Keep("functiontype");
                string ext = Path.GetExtension(Imagename);

                if (checkfunction == "Show")
                {
                    if (ext == ".pdf")
                    {
                        var imagefile = Convert.FromBase64String(TempData["image"].ToString());
                        return this.File(imagefile, "image/" + ext, Imagename);
                    }
                    else
                    {
                        return View("ShowAllPolicies");
                    }
                }
                else
                {
                    var imagefile = Convert.FromBase64String(TempData["image"].ToString());
                    return this.File(imagefile, "image/" + ext, Imagename);

                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return View("ShowAllPolicies");
        }

    }
}