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
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class EmployeeDocumentsController : Controller
    {
        //
        // GET: /EmployeeDocuments/

        public ActionResult EmployeeDocuments()
        {

            var docu = getdocumentname();
            ViewBag.Documents = docu;
            TempData["Documents"] = docu;
            TempData.Keep("Documents");
            return View();
        }

        private List<SelectListItem> getdocumentname()
        {
            MTSHRDataLayer.EmployeeDocuments data_doc = new MTSHRDataLayer.EmployeeDocuments();
            var Documents = data_doc.getemployeedocuments();
            List<SelectListItem> docu = new List<SelectListItem>();
            docu.Add(new SelectListItem() { Value = "", Text = "----Select Documents----" });
            for (int i = 0; i < Documents.Tables[0].Rows.Count; i++)
            {
                docu.Add(new SelectListItem() { Value = Documents.Tables[0].Rows[i]["id"].ToString(), Text = Documents.Tables[0].Rows[i]["Documents"].ToString() });
            }
            return docu;
        }


        public ActionResult ShowAllEmployeeDocuments()
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave EmployeeNamedata = new MTSHRDataLayer.EmployeeLeave();
            var EmployeeNames = EmployeeNamedata.GetAllEmployeeNames();
            List<SelectListItem> EmployeeNameList = new List<SelectListItem>();
            EmployeeNameList.Add(new SelectListItem() { Value = "", Text = "----Select Employee----" });
            for (int i = 0; i < EmployeeNames.Tables[0].Rows.Count; i++)
            {
                string ID = EmployeeNames.Tables[0].Rows[i]["id"].ToString();
                if (!ID.Equals(empid))
                    EmployeeNameList.Add(new SelectListItem() { Text = EmployeeNames.Tables[0].Rows[i]["EmployeeName"].ToString(), Value = ID });
            }
            TempData["EmployeeNames"] = EmployeeNameList;
            var docu = getdocumentname();
            ViewBag.EmployeeNameList = EmployeeNameList;
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
                var Employee_Id = Session["UserID"];
                var docname = Request.Params["docname"].ToString();

                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];
                    string FileName = file.FileName;
                    if (file != null && file.ContentLength > 0)
                    {
                        BinaryReader reader = new BinaryReader(file.InputStream);
                        MTSHRDataLayer.EmployeeDocuments data_doc = new MTSHRDataLayer.EmployeeDocuments();
                        byte[] bytes = reader.ReadBytes((int)file.ContentLength);
                        int result = data_doc.Create(Employee_Id, docname, bytes, FileName);
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
                Int64 Employee_Id = Convert.ToInt64(Request.Headers["employeeid"]);

                if (Employee_Id == 0)
                {
                    Employee_Id = Convert.ToInt64(Session["UserID"]);
                }
                int Documentid = Convert.ToInt32(Documents);
                MTSHRDataLayer.EmployeeDocuments data_document = new MTSHRDataLayer.EmployeeDocuments();
                DataTable Documentimage = data_document.Read(Documentid, Employee_Id);

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
                        return View("EmployeeDocuments");
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
            return View("EmployeeDocuments");

        }

        public ActionResult ViewAllEmployeeDocuments()
        {
            try
            {
                ViewBag.EmployeeNameList = TempData["EmployeeNames"];
                TempData.Keep("EmployeeNames");
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
                        return View("ShowAllEmployeeDocuments");
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
            return View("ShowAllEmployeeDocuments");
        }

    }
}


