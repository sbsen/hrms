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
    public class AssetReportVIewController : SecureController
    {
        // GET: AssetReportVIew
        [HttpGet]
        public ActionResult AssetDetailView(Int64 ItemCode)
        {
            TempData["ItemCode"] = ItemCode;
            return RedirectToAction("AssetReportView");
        }
        [HttpGet]
        public ActionResult AssetReportView()
        {
            return View("AssetReportView");
        }

        //public JsonResult ReadAssetMaster(string ItemCode)
        //{
        //    MTSHRDataLayer.AssetReportView reportview = new MTSHRDataLayer.AssetReportView();
        //    return Json(JsonConvert.SerializeObject(reportview.ReadAssetMaster()), JsonRequestBehavior.AllowGet);
        //}

        public JsonResult ReadAssetMaintenance(Int64 ItemCode)
        {
            MTSHRDataLayer.AssetReportView reportview = new MTSHRDataLayer.AssetReportView();
            TempData.Keep("ItemCode");
            return Json(JsonConvert.SerializeObject(reportview.ReadAssetMaintenance(ItemCode)), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadAmcDetails(Int64 ItemCode)
        {
            MTSHRDataLayer.AssetReportView reportview = new MTSHRDataLayer.AssetReportView();
            TempData.Keep("ItemCode");
            return Json(JsonConvert.SerializeObject(reportview.ReadAmcDetails(ItemCode)), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadAssetSale(Int64 ItemCode)
        {
            MTSHRDataLayer.AssetReportView reportview = new MTSHRDataLayer.AssetReportView();
            TempData.Keep("ItemCode");
            return Json(JsonConvert.SerializeObject(reportview.ReadAssetSale(ItemCode)), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadAssignAsset(Int64 ItemCode)
        {
            MTSHRDataLayer.AssetReportView reportview = new MTSHRDataLayer.AssetReportView();
            TempData.Keep("ItemCode");
            return Json(JsonConvert.SerializeObject(reportview.ReadAssignAsset(ItemCode)), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult GetInvoice(Int64 Documents)
        {
            try
            {
                //Int64 Employee_Id = Convert.ToInt64(Request.Headers["employeeid"]);

                //if (Employee_Id == 0)
                //{
                //    Employee_Id = Convert.ToInt64(Session["UserID"]);
                //}
                int Documentid = Convert.ToInt32(Documents);
                 MTSHRDataLayer.AssetReportView data_document = new MTSHRDataLayer.AssetReportView();
                DataTable Documentimage = data_document.ReadInvoiceImages(Documentid);

                if (Documentimage.Rows.Count > 0)
                {
                    byte[] imagedata = Documentimage.Rows[0]["INVOICE"] as byte[];

                    string imagename = Documentimage.Rows[0]["INVOICE_NAME"].ToString();

                    string baseimage = Convert.ToBase64String(imagedata);
                    TempData["image"] = baseimage;
                    TempData["imagename"] = imagename;
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
                return Content(exec.ToString());
            }
    
        }

        public ActionResult GetAmc(string Documents)
        {
            try
            {
                //Int64 Employee_Id = Convert.ToInt64(Request.Headers["employeeid"]);

                //if (Employee_Id == 0)
                //{
                //    Employee_Id = Convert.ToInt64(Session["UserID"]);
                //}
                int Documentid = Convert.ToInt32(Documents);
                MTSHRDataLayer.AssetReportView data_document = new MTSHRDataLayer.AssetReportView();
                DataTable Documentimage = data_document.ReadAmcImages(Documentid);

                if (Documentimage.Rows.Count > 0)
                {
                    byte[] imagedata = Documentimage.Rows[0]["FILE"] as byte[];

                    string imagename = Documentimage.Rows[0]["FILE_NAME"].ToString();

                    string baseimage = Convert.ToBase64String(imagedata);
                    TempData["image"] = baseimage;
                    TempData["imagename"] = imagename;
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
                string ext = Path.GetExtension(Imagename);

               
                    if(ext==".png")
                {
                        var imagefile = Convert.FromBase64String(TempData["image"].ToString());
                        return this.File(imagefile, "image/" + ext, Imagename);
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