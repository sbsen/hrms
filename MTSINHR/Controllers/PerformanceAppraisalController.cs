using MTS.Controllers;
using MTSEntBlocks.ExceptionBlock.Handlers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Controllers
{
    public class PerformanceAppraisalController : SecureController
    {
        // GET: Appraisal
        public ActionResult AppraisalMapping()
        {
            return View();
        }
        public ActionResult RedirectFromAppraisalPage(Int64 ViewType = 0, Int64 AppraisalProcessId=0, Int64 AppraisalActiveStage=0)
        {
            TempData["AppraisalActiveStage"] = AppraisalActiveStage;
            TempData["AppraisalProcessId"] = AppraisalProcessId;
            TempData["ViewType"]=ViewType;
            return RedirectToAction("AppraisalProcessDetails");
        }
        
        public ActionResult AppraisalProcessDetails()
        {
            ViewBag.AppraisalActiveStage = TempData["AppraisalActiveStage"];
          //  TempData.Keep("AppraisalActiveStage");
            ViewBag.AppraisalProcessId = TempData["AppraisalProcessId"];
         //   TempData.Keep("AppraisalProcessId");
            ViewBag.ViewType = TempData["ViewType"];
          //  TempData.Keep("ViewType");
            return View();
        }

        // GET: PerformanceAppraisal
        public ActionResult SelfAppraisal()
        {
            ViewBag.ViewType = 0;
            TempData["IsSelfDirectAppraisalPage"] = true;
            ViewBag.IsSelfDirectAppraisalPage = Convert.ToBoolean(TempData["IsSelfDirectAppraisalPage"]);
            TempData["MaximumRating"] = 5;
            ViewBag.MaximumRating = Convert.ToInt64(TempData["MaximumRating"]);
            TempData.Keep("IsSelfDirectAppraisalPage");
            TempData.Keep("MaximumRating");
            return View("SelfAppraisal");

        }

        public ActionResult TeamMembersAppraisal()
        {
            // Int64 RoleId = Int64.Parse(Session["RoleId"].ToString());

            return View("TeamMembersAppraisal");

        }


        public ActionResult ModeratorReviewPage()
        {
            // Int64 RoleId = Int64.Parse(Session["RoleId"].ToString());

            return View("ModeratorReviewPage");

        }
        public ActionResult EmployeeSelfAppraisal(string empid, Int64 AppraisalProcessId = 0, Int64 ViewType=0, Int64 AppraisalActiveStage=0)
        {
            TempData["AppraisalActiveStage"] = AppraisalActiveStage;
            TempData["ViewType"] = ViewType;
            TempData["EmpId"] = empid;
            TempData["AppraisalProcessId"] = AppraisalProcessId;
            TempData["IsSelfDirectAppraisalPage"] = false;
            TempData["MaximumRating"] = 5;
            return RedirectToAction("EmpSelfAppraisal");
        }

        public ActionResult EmpSelfAppraisal()
        {
            ViewBag.AppraisalActiveStage = TempData["AppraisalActiveStage"];
            TempData.Keep("AppraisalActiveStage");
            ViewBag.ViewType = TempData["ViewType"];
            TempData.Keep("ViewType");
            ViewBag.AppraisalProcessId = TempData["AppraisalProcessId"];
            TempData.Keep("AppraisalProcessId");
            ViewBag.EmpId = TempData["EmpId"];
            TempData.Keep("EmpId");
            ViewBag.IsSelfDirectAppraisalPage = Convert.ToBoolean(TempData["IsSelfDirectAppraisalPage"]);
            TempData.Keep("IsSelfDirectAppraisalPage");
            ViewBag.MaximumRating = Convert.ToInt64(TempData["MaximumRating"]);
            TempData.Keep("MaximumRating");
            return View("SelfAppraisal");
        }

        public ActionResult GetDesignationDetails()
        {
            MTSHRDataLayer.Designation data = new MTSHRDataLayer.Designation();
            var result = JsonConvert.SerializeObject(data.Read_FunctionalRole());
            return Json(new { result }, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Get_Skill_KRA_Details()
        {
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            var Skill_KRA_Details = data.Get_Skill_KRA_Details();
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(Skill_KRA_Details.Tables[0]), result2 = JsonConvert.SerializeObject(Skill_KRA_Details.Tables[1]), result3 = JsonConvert.SerializeObject(Skill_KRA_Details.Tables[2]) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Get_Appraisal_Count()
        {
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            DataSet Appraisal_Counts = new DataSet();
            Appraisal_Counts = data.Get_Appraisal_Count(Convert.ToInt64(Session["UserID"]));
            DataTable dt1 = Appraisal_Counts.Tables[0];
            DataTable dt2 = Appraisal_Counts.Tables[1];
            DataTable dt3 = Appraisal_Counts.Tables[2];
            int Appraisal_Count1 = Convert.ToInt32(string.IsNullOrEmpty(dt1.Compute("SUM(Pending)", string.Empty).ToString()) ? 0 : dt1.Compute("SUM(Pending)", string.Empty));
            int Appraisal_Count2 = Convert.ToInt32(string.IsNullOrEmpty(dt2.Compute("SUM(Pending)", string.Empty).ToString()) ? 0 : dt2.Compute("SUM(Pending)", string.Empty));
            int Appraisal_Count3 = Convert.ToInt32(string.IsNullOrEmpty(dt3.Compute("SUM(Pending)", string.Empty).ToString()) ? 0 : dt3.Compute("SUM(Pending)", string.Empty));
            //int Appraisal_Active_Stage= Convert.ToInt32(string.IsNullOrEmpty(dt3.Compute("APPRAISAL_ACTIVE_STAGE", string.Empty).ToString()) ? 0 : dt3.Compute("APPRAISAL_ACTIVE_STAGE", string.Empty));
           

            Session["SelfAppraisalPendingCount"] = Appraisal_Count3;
            return Json(new
            {
                success = true,
                result = Appraisal_Count1,
                result1 = Appraisal_Count2,
                result2 = Appraisal_Count3,
                result3= JsonConvert.SerializeObject(Appraisal_Counts.Tables[2])
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult Add_Appraisal_Designation_Mapping_For_Individual(string type, string description, string weightage, string EmpId, string Appraisal_Process_Id)
        {
            Int64 result = 0;
            Decimal Weightage = 0;
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            if (weightage == "")
            {
                Weightage = 0;
            }
            else
            {
                Weightage = Convert.ToDecimal(weightage);
            }
            try
            {
                string[] DescriptionList = description.Split(',');

                if (DescriptionList != null && DescriptionList.Length > 0)
                {
                    for (int int_i = 0; int_i < DescriptionList.Length; int_i++)
                    {
                        result = data.Add_Appraisal_Designation_Mapping_For_Individual(Convert.ToInt64(type), Convert.ToInt64(DescriptionList[int_i]), Weightage, Convert.ToInt64(EmpId), Convert.ToInt64(Appraisal_Process_Id));
                    }
                }
                if (result > 0)
                {
                    result = 1;
                }


            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }

        [HttpPost]
        public ActionResult Add_Appraisal_Designation_Mapping(string type, string description, string weightage, string designation)
        {
            Int64 result = 0;
            Decimal Weightage = 0;
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            if (weightage == "")
            {
                Weightage = 0;
            }
            else
            {
                Weightage = Convert.ToDecimal(weightage);
            }
            try
            {
                string[] DescriptionList = description.Split(',');

                if (DescriptionList != null && DescriptionList.Length > 0)
                {
                    for (int int_i = 0; int_i < DescriptionList.Length; int_i++)
                    {
                        result = data.Add_Appraisal_Designation_Mapping(Convert.ToInt64(type), Convert.ToInt64(DescriptionList[int_i]), Weightage, Convert.ToInt64(designation));
                    }
                }
                if (result > 0)
                {
                    result = 1;
                }


            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }
        public ActionResult AssignManagerToEmployee(Int64 id, Int64 managerId, string AppraisalProcessId)
        {
            Int64 result = 0;
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            try
            {
                result = data.AssignManagerToEmployee(id, managerId, Convert.ToInt64(AppraisalProcessId));
                if (result > 0)
                {
                    result = 1;
                }
                else
                {
                    result = 0;
                }
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }
        public ActionResult Get_Appraisal_Mapping_Table_Details()
        {

            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            var Mapping_Details = data.Get_Appraisal_Mapping_Table_Details();
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(Mapping_Details.Tables[0]), result2 = JsonConvert.SerializeObject(Mapping_Details.Tables[1]) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetIndividualMappingDetails(Int64 EmpId, Int64 AppraisalProcessId)
        {
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            var Mapping_Detail = data.GetIndividualMappingDetails(EmpId, AppraisalProcessId);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(Mapping_Detail.Tables[0]), result2 = JsonConvert.SerializeObject(Mapping_Detail.Tables[1]) }, JsonRequestBehavior.AllowGet);


        }

        [HttpPost]
        public ActionResult RemoveAppraisalEmployeeMapping(Int64 EMP_ID, Int64 AppraisalProcessId)
        {
            Int64 result = 0;
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            try
            {
                result = data.RemoveAppraisalEmployeeMapping(EMP_ID, AppraisalProcessId);
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });


        }

        //[HttpGet]
        //public JsonResult GetEmployeeAppraisalMapping(Int64 EMP_ID)
        //{
        //    MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
        //    try
        //    {
        //        var result = data.GetEmployeeAppraisalMapping(EMP_ID);
        //        return Json(new { success = true, result1 = JsonConvert.SerializeObject(result) }, JsonRequestBehavior.AllowGet);

        //    }
        //    catch (Exception e)
        //    {
        //        BaseExceptionHandler.HandleException(ref e);
        //    }
        //    return Json(new { success = false });
        //}

        [HttpPost]
        public ActionResult RemoveEmployeeMappingDetails(Int64 status, Int64 weightage, Int64 rowID)
        {
            //Int64 result = 0;
            //MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            //var Mapping_Detail = data.RemoveEmployeeMappingDetails(EmpId);
            //return Json(new { success = true, result1 = JsonConvert.SerializeObject(Mapping_Detail) }, JsonRequestBehavior.AllowGet);

            Int64 result = 0;
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            try
            {
                result = data.RemoveEmployeeMappingDetails(status, weightage, rowID);
                if (status == 1)
                {
                    result = 1;
                }
                else if (status == 2)
                {
                    result = 2;
                }
                else
                {
                    result = 0;
                }
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }
        public ActionResult PublishingAppraisalProcess(Int64 AppraisalProcessId)
        {
            Int64 result = 0;
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            try
            {
                result = data.PublishingAppraisalProcess(AppraisalProcessId);
                if (result > 0)
                {
                    result = 1;
                }
                else
                {
                    result = 0;
                }
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }
        public ActionResult ClosingAppraisalProcess(Int64 AppraisalProcessId)
        {
            Int64 result = 0;
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            try
            {
                result = data.ClosingAppraisalProcess(AppraisalProcessId);
                if (result > 0)
                {
                    result = 1;
                }
                else
                {
                    result = 0;
                }
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }
        public JsonResult GetEvaluatorsList()
        {
            DataSet ds = new DataSet();

            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            try
            {
                ds = data.GetEvaluatorsList();
                if (ds != null)
                {
                    return Json(new
                    {
                        success = true,
                        result = JsonConvert.SerializeObject(ds.Tables[0]),
                        result1 = JsonConvert.SerializeObject(ds.Tables[1])
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { success = false });
                }

            }
            catch (Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
            }

            return Json(new { success = false });
        }
        [HttpGet]
        public JsonResult GetManagersList(Int64 EmpId)
        {
            //  DataTable dt = new DataTable();

            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();

            var dt = data.GetManagersList(EmpId);

            return Json(JsonConvert.SerializeObject(dt), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult AddAppraisalProcessDetails(string appraisalPeriod, string fromdate, string todate, string untilDate, string evaluator, string maxRating)
        {
            Int64 result = 0;
            MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
            try
            {
                result = data.AddAppraisalProcessDetails(appraisalPeriod, fromdate == "" ? (DateTime?)null : Convert.ToDateTime(fromdate), todate == "" ? (DateTime?)null : Convert.ToDateTime(todate), untilDate == "" ? (DateTime?)null : Convert.ToDateTime(untilDate), Convert.ToInt64(evaluator), Convert.ToInt64(maxRating));
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }

        public ActionResult getFeedbackComments(string EmpId, Int64 AppraisalProcessId = 0)
        {
            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            var Mapping_Details = performanceAppraisal.getFeedbackComments(Convert.ToInt64(EmpId), AppraisalProcessId);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(Mapping_Details) }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetEmployeeBasicDetails()
        {
            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            var Mapping_Details = performanceAppraisal.GetEmployeeBasicDetails();
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(Mapping_Details) }, JsonRequestBehavior.AllowGet);
        }
        //public ActionResult Get_Appraisal_Process_Details()
        //{
        //    MTSHRDataLayer.Appraisal data = new MTSHRDataLayer.Appraisal();
        //    var Mapping_Details = data.Get_Appraisal_Process_Details();
        //    return Json(new { success = true, result1 = JsonConvert.SerializeObject(Mapping_Details.Tables[0]) }, JsonRequestBehavior.AllowGet);
        //}

        [HttpGet]
        public JsonResult GetSelfAppraisalTabNameAndData(string employeeid = null, bool isSelfDirectAppraisalPage = false, string viewStatus = "", Int64 AppraisalProcessId = 0)
        {
            Int64 EmplID = Convert.ToInt64(employeeid);
            string empid = string.Empty;
            if (EmplID == 0)
            {
                empid = Session["UserID"].ToString();
                Int64 id = Convert.ToInt64(empid);
            }
            else
            {
                empid = employeeid.ToString();
                Int64 id = Convert.ToInt64(EmplID);
            }
            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                var tabTypes = performanceAppraisal.GetSelfAppraisalTabNameAndData(empid, isSelfDirectAppraisalPage, Convert.ToInt64(viewStatus), AppraisalProcessId);
                return Json(new { success = true, result1 = JsonConvert.SerializeObject(tabTypes.Tables[0]), result2 = JsonConvert.SerializeObject(tabTypes.Tables[1]) }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = false });
        }

        [HttpPost]
        public JsonResult GetIndividualEmployeeSummaryDetails(Int64 empid)
        {

            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                var tabTypes = performanceAppraisal.GetSelfAppraisalTabNameAndData(empid);
                return Json(new { success = true, result1 = JsonConvert.SerializeObject(tabTypes.Tables[0]), result2 = JsonConvert.SerializeObject(tabTypes.Tables[1]) }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = false });
        }

        [HttpGet]
        public JsonResult GetModeratorUnderEmployeesList()
        {
            string ModeratorId = Session["UserID"].ToString();
            //   Int64 id = Convert.ToInt64(empid);
            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                var empList = performanceAppraisal.GetModeratorUnderEmployeesList(ModeratorId);
                return Json(new { success = true, result1 = JsonConvert.SerializeObject(empList.Tables[0]) }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = false });
        }

        [HttpGet]
        public JsonResult GetManagerUnderEmployeesList()
        {
            string Managerid = Session["UserID"].ToString();
            //   Int64 id = Convert.ToInt64(empid);
            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                var empList = performanceAppraisal.GetManagerUnderEmployeesList(Managerid);
                return Json(new { success = true, result1 = JsonConvert.SerializeObject(empList.Tables[0]) }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = false });
        }


        [HttpPost]
        public ActionResult AddKra_SkillWeightage(string idList, string valueList, string status, string TabName, float FinalRating, string EmpId = null, string AppraisalProcessId = null, bool isSelfDirectAppraisalPage = false)
        {
            Int64 EmplID = 0;
            Int64 RoldID = Convert.ToInt64(status);
            if (RoldID == 1 && isSelfDirectAppraisalPage == false)
            {
                status = "3";
            }
            if (RoldID == 1 && isSelfDirectAppraisalPage == true)
            {
                status = "1";
            }
            if (RoldID == 2 || RoldID == 4)
            {
                status = "1";
            }
            if (RoldID == 3 && isSelfDirectAppraisalPage == false)
            {
                status = "2";
            }
            if (RoldID == 3 && isSelfDirectAppraisalPage == true)
            {
                status = "1";
            }

            if (EmpId != "")
            {
                EmplID = Convert.ToInt64(EmpId);
            }
            string empid = string.Empty;
            Int64 employee_id;
            if (EmplID == 0)
            {
                empid = Session["UserID"].ToString();
                employee_id = Convert.ToInt64(empid);
            }
            else
            {
                empid = EmpId.ToString();
                employee_id = Convert.ToInt64(EmplID);
            }

            AppraisalProcessId = string.IsNullOrEmpty(AppraisalProcessId) ? null : AppraisalProcessId;

            Int64 result = 0;
            MTSHRDataLayer.PerformanceAppraisal data = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                string[] IdList = idList.Split(',');
                string[] ValueList = valueList.Split(',');

                if (IdList != null && IdList.Length > 0)
                {
                    for (int int_i = 0;  int_i < IdList.Length; int_i++)
                    {
                        result = data.AddKra_SkillWeightage(Convert.ToInt64(IdList[int_i]), Convert.ToDecimal(ValueList[int_i]), Convert.ToInt64(status), TabName, FinalRating, employee_id, Convert.ToInt64(AppraisalProcessId));
                    }
                }
                if (result > 0)
                {
                    result = 1;
                }


            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }
        [HttpPost]
        public ActionResult SkipManagersToEmployee(string EmployeeIdlist, string AppraisalProcessId = "")
        {
            Int64 result = 0;
            MTSHRDataLayer.PerformanceAppraisal data = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                string[] IdList = EmployeeIdlist.Split(',');

                if (IdList != null && IdList.Length > 0)
                {
                    for (int int_i = 0; int_i < IdList.Length; int_i++)
                    {
                        result = data.SkipManagersToEmployee(Convert.ToInt64(IdList[int_i]), AppraisalProcessId == "" ? (Int64?)0 : Convert.ToInt64(AppraisalProcessId));
                    }
                }
                if (result > 0)
                {
                    result = 1;
                }
                else
                {
                    result = 0;
                }


            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }


        [HttpPost]
        public ActionResult AddEmployeeSummaryDetails(string idList, string valueList, string status, string FeedBackCatagory, string managerid = null, string empId = null, string AppraisalProcessId = null, bool isSelfDirectAppraisalPage = false)
        {
            string empid = string.Empty;
            Int64 Empl_ID = 0;
            Int64 RoldID = Convert.ToInt64(status);
            Int64 feedBackCatagoryID;
            if (FeedBackCatagory != "" && (Session["RoleId"].ToString() == "2" || Session["RoleId"].ToString() == "4"))
            {
                return Json(new { success = false, errMsg = "Only Manager and Final Moderator can select feedBack Catagory" });
            }

            feedBackCatagoryID = FeedBackCatagory == "reward" ? 1 : FeedBackCatagory == "positive" ? 2 : FeedBackCatagory == "observation" ? 3 : FeedBackCatagory == "training" ? 4 : FeedBackCatagory == "negative" ? 5 : 0;

            if (RoldID == 1 && isSelfDirectAppraisalPage == false)
            {
                status = "3";
            }
            if (RoldID == 1 && isSelfDirectAppraisalPage == true)
            {
                status = "1";
            }
            if (RoldID == 2 || RoldID == 4)
            {
                status = "1";
            }
            if (RoldID == 3 && isSelfDirectAppraisalPage == false)
            {
                status = "2";
            }
            if (RoldID == 3 && isSelfDirectAppraisalPage == true)
            {
                status = "1";
            }
            if (empId != "")
            {
                Empl_ID = Convert.ToInt64(empId);
            }
            if (Empl_ID == 0)
            {
                empid = Session["UserID"].ToString();
            }
            else
            {
                empid = empId.ToString();
            }
            AppraisalProcessId = string.IsNullOrEmpty(AppraisalProcessId) ? null : AppraisalProcessId;
            Int64 result = 0;
            MTSHRDataLayer.PerformanceAppraisal data = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                string[] IdList = idList.Split(',');
                string[] ValueList = valueList.Split(',');


                if (IdList != null && IdList.Length > 0)
                {
                    for (int int_i = 0; int_i < IdList.Length; int_i++)
                    {
                        result = data.AddEmployeeSummaryDetails(Convert.ToInt64(empid), (ValueList[int_i]), Convert.ToInt64(IdList[int_i]), Convert.ToInt64(status), feedBackCatagoryID, managerid == "" ? (Int64?)null : Convert.ToInt64(managerid), DateTime.Now, Convert.ToInt64(AppraisalProcessId));
                    }
                }
                if (result > 0)
                {
                    result = 1;
                }


            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }




        [HttpPost]
        public ActionResult AddEmployeeFeedbackDetails(string empId = null, string managerId = null, string feedback = null, Int64 AppraisalProcessId = 0)
        {
            var result = 0;
            MTSHRDataLayer.PerformanceAppraisal data = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                result = data.AddEmployeeFeedbackDetails(Convert.ToInt64(empId), Convert.ToInt64(managerId), feedback, AppraisalProcessId);

                if (result > 0)
                {
                    result = 1;
                }


            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }


        [HttpPost]
        public JsonResult GetPendingDetailsBeforePublishing(Int64 AppraisalProcessId = 0)
        {
            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                var PendingDetails = performanceAppraisal.GetPendingDetailsBeforePublishing(AppraisalProcessId);
                return Json(new { success = true, result1 = JsonConvert.SerializeObject(PendingDetails.Tables[0]), result2 = JsonConvert.SerializeObject(PendingDetails.Tables[1]) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = false });
        }




        [HttpGet]
        public JsonResult getAppraisalProcessDetails()
        {
            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                var appraisalProcessDetails = performanceAppraisal.getAppraisalProcessDetails();
                return Json(new { success = true, result1 = JsonConvert.SerializeObject(appraisalProcessDetails.Tables[0]) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = false });
        }

        [HttpGet]
        public JsonResult Get_Appraisal_Mapping_Table_Details_By_ProcessId(Int64 AppraisalProcessId)
        {
            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                var appraisalProcessDetails = performanceAppraisal.Get_Appraisal_Mapping_Table_Details_By_ProcessId(AppraisalProcessId);
                return Json(new { success = true, result1 = JsonConvert.SerializeObject(appraisalProcessDetails.Tables[0]) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = false });
        }

        [HttpGet ]
        public JsonResult getempRatingsForKraSkills(string empid = null, Int64 AppraisalProcessId = 0, bool isSelfDirectAppraisalPage = false, string viewType=null)
        {
            Int64 Empl_ID = 0;
            Int64 ViewStatus = 0;                                  // To See Which one is seeing the Employee rating page
            Int64 RoleID = Convert.ToInt64(Session["RoleId"]);
            Int64 ViewType = Convert.ToInt64(viewType);
            //if (RoleID == 1)
            //{
            //    ViewStatus = 2;
            //}
            //if (RoleID == 2 || RoleID == 4)
            //{
            //    ViewStatus = 0;
            //}
            //if (RoleID == 3)
            //{
            //    ViewStatus = 1;
            //}
            if(ViewType==1)
            {
                ViewStatus = 1;
            }
            if (ViewType == 2 || ViewType==3)
            {
                ViewStatus = 2;
            }
            if (ViewType ==0)
            {
                ViewStatus = 0;
            }
            if (empid == "0")
            {
                Empl_ID = Convert.ToInt64(Session["UserID"]);
            }
            else
            {
                Empl_ID = Convert.ToInt64(empid);
            }

            MTSHRDataLayer.PerformanceAppraisal performanceAppraisal = new MTSHRDataLayer.PerformanceAppraisal();
            try
            {
                var Emp_Ratings = performanceAppraisal.Get_Emp_Ratings(Empl_ID, AppraisalProcessId, isSelfDirectAppraisalPage, ViewStatus);
                return Json(new { success = true, result1 = JsonConvert.SerializeObject(Emp_Ratings.Tables[0]) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = false });
        }

        [HttpPost]
        public ActionResult AssignFinalModeratorToEmployee(List<string> EmpID, Int64 FinalModeratorID, List<int?> Staging, Int64 AppraisalProcessId)
        {
            Int64 result = 0;
            Int64 res = 0;
            string errMsg;
            List<string> failedEmp = new List<string>();
            try
            {
                MTSHRDataLayer.PerformanceAppraisal assignFinalModerator = new MTSHRDataLayer.PerformanceAppraisal();
                for (int i = 0; i < EmpID.Count; i++)
                {
                    if (Staging[i] == 3)
                    {
                        errMsg = "Can not assign after completion of Appraisal process.";
                        return Json(new { errMsg = errMsg });
                    }
                    else
                    {
                        result = assignFinalModerator.AssignFinalModeratorToEmployee(EmpID[i], FinalModeratorID, AppraisalProcessId);
                        res = res + result;
                        if (result <= 0)
                        {
                            failedEmp.Add(EmpID[i]);
                            return Json(new { success = false });
                        }
                    }
                }
                if (res == EmpID.Count)
                {
                    return Json(new { success = true });
                }
                else
                {
                    res = Math.Abs(res - EmpID.Count);
                    return Json(new { success = true, failedAssign = res, result = JsonConvert.SerializeObject(failedEmp) });
                }

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
                //return Json(new { success = false });
            }
            return Json(new { success = false });
        }

    }
}