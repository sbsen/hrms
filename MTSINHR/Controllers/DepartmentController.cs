using MTSEntBlocks.DataBlock;
using System;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Newtonsoft.Json;


namespace MTSINHR.Controllers
{
    public class DepartmentController : SecureController
    {
        // GET: Department
        public ActionResult Department()
        {
            return View();
        }
        public JsonResult Read()
        {
            MTSHRDataLayer.Department department = new MTSHRDataLayer.Department();
            return Json(JsonConvert.SerializeObject(department.Read()), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Edit(Departments depart)
        {
            MTSHRDataLayer.Department data_depart = new MTSHRDataLayer.Department();
            int result = data_depart.Update(depart.id, depart.department);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);


        }
        [HttpPost]
        public JsonResult Add(Departments depart)
        {
            MTSHRDataLayer.Department data_department = new MTSHRDataLayer.Department();
            int result = data_department.Create(depart.department);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}