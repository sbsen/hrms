﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using MTSEntBlocks.UtilsBlock;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;
using System.Data;
namespace MTS.Controllers
{
    public class SecureController : Controller
    {

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {



            if (SessionHelper.LogonUser == null)
            {
                if (filterContext.HttpContext.Request.IsAjaxRequest())
                {
                    filterContext.HttpContext.Response.StatusCode = 403;
                    filterContext.Result = new JsonResult
                    {
                        Data = "SessionTimeOut",
                        JsonRequestBehavior = JsonRequestBehavior.AllowGet
                    };
                }

                else
                {
                    filterContext.Result = new RedirectToRouteResult(
                                                  new RouteValueDictionary(new
                                                  {
                                                      action = "logon",
                                                      controller = "account",
                                                      area = "MTS.Login"
                                                  }));
                }
             }
            if (Request.Url.ToString().Length > 0)
            {
                string url = Request.Url.ToString();
                Int64 roleid = Convert.ToInt64(Session["roleid"]);
                MTSHRDataLayer.Employee data_emp = new MTSHRDataLayer.Employee();
                //datatable dt = data_emp.checkauthorization();
                //bool checkurl = dt.asenumerable().where(c => convert.tostring((c.field<string>("url"))).equals(url)).count() > 0;
                //if (checkurl == true)
                //{

                int status = data_emp.CheckAccessURL(roleid, url, Convert.ToInt64(Session["UserId"] ));      //, Convert.ToInt64(Session["UserId"])
                if (status == 0)
                {
                    filterContext.Result = new RedirectToRouteResult(
                                                 new RouteValueDictionary(new
                                                 {
                                                     action = "logon",
                                                     controller = "account",
                                                     area = "mts.login"
                                                 }));
                }
                //}
            }
            if (filterContext.HttpContext.Request.IsAjaxRequest())
            {
            }
            else
            {
                if (SessionHelper.AccessUrls != null)
                {
                    bool isValidUrl = false;
                    var rd = HttpContext.Request.RequestContext.RouteData;

                    string areaName = rd.DataTokens["area"] as string;
                    areaName = string.IsNullOrEmpty(areaName) ? "" :  areaName;
                    string actionName = "/" + rd.GetRequiredString("action");
                    string controllerName = string.IsNullOrEmpty(areaName) ? rd.GetRequiredString("controller") : "/" + rd.GetRequiredString("controller");
                    string baseurl = HttpContext.Request.ApplicationPath;
                    baseurl = baseurl.Length == 1 ? string.Empty : baseurl;
                    string currUlr = string.Concat(baseurl + "/", areaName, controllerName, actionName);  //filterContext.HttpContext.Request.AppRelativeCurrentExecutionFilePath.Replace("~", "..");

                    List<string> lstAccessUrls = new List<string>(SessionHelper.AccessUrls);

                    foreach (string url in lstAccessUrls.AsEnumerable())
                    {
                        if (currUlr.ToLower().Trim().Equals(url.Trim().ToLower().Contains("?") ? url.Trim().ToLower().Remove(url.IndexOf('?')) : url.Trim().ToLower()))
                        {
                            isValidUrl = true;
                        }
                    }
                    if (!isValidUrl)
                    {
                        filterContext.Result = new RedirectToRouteResult(
                                                    new RouteValueDictionary(new
                                                    {
                                                        action = "logon",
                                                        controller = "account",
                                                        area="MTS.Login"
                                                    }));
                    }
                }
            }
            base.OnActionExecuting(filterContext);
        }

   
    }

}
