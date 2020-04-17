using ProAcc.BL;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static ProAcc.BL.Model.Common;

namespace ProAcc.Controllers
{
    public class AssessmentController : Controller
    {
        Base _Base = new Base();
        // GET: Assessment
        public ActionResult CreateAnalysis()
        {
            Tuple<List<Lis>, List<Lis>> sP_ = _Base.sP_AnalysisDropdowns();

            ViewBag.Project = new SelectList(sP_.Item2, "Value", "Name");
            ViewBag.Customer = new SelectList(sP_.Item1, "Value", "Name");
            return View();
        }

        //Start  Readiness
        public ActionResult ReadinessReport()
        {
            return View();
        }
        [HttpPost]
        public JsonResult GetSimplificationReport()
        {
            SP_ReadinessReport_Result GetRelevant = _Base.sAPInput();
            return Json(GetRelevant, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetActivities_Bar1()
        {
            GeneralList sP_ = _Base.sP_GetActivities_Bar1();
            return Json(sP_, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetActivities_Bar2()
        {
            GeneralList sP_ = _Base.sP_GetActivities_Bar2();
            return Json(sP_, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetActivities_Donut()
        {
            GeneralList sP_ = _Base.sP_GetActivities_Donut();
            return Json(sP_, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetFiori_Bar()
        {
            GeneralList sP_ = _Base.sP_GetFiori_Bar();
            return Json(sP_, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetCustomCode_Bar()
        {
            GeneralList sP_ = _Base.sP_GetCustomCode_Bar();
            return Json(sP_, JsonRequestBehavior.AllowGet);
        }


        //END  Readiness

        //START Simplification
        public ActionResult SimplificationReport()
        {
            GeneralList sP_ = _Base.sP_SimplificationReport();
            ViewBag.LOB = new SelectList(sP_._List, "_Value", "Name");
            List<SAPInput_SimplificationReport> SR = _Base.SAPInput_SimplificationReport();
            ViewBag.SRReport = SR;
            return View();
        }

        //Post

        [HttpPost]
        public JsonResult GetSimplificationReport_Bar(string LOB)
        {
            GeneralList sP_ = _Base.sP_SimplificationReport_Bar(LOB);

            return Json(sP_, JsonRequestBehavior.AllowGet);
        }
        //END Simplification

        //START Custom Code
        public ActionResult CustomReport()
        {
            //GeneralList sP_ = _Base.sP_SimplificationReport();
            //ViewBag.LOB = new SelectList(sP_._List, "_Value", "Name");
            List<SAPInput_CustomCode> CR = _Base.SAPInput_CustomCodeReport();
            ViewBag.CRReport = CR;
            return View();
        }
        //END Custom Code


        [HttpPost]
        public ActionResult UploadFiles(HttpPostedFileBase[] files)
        {

            //Ensure model state is valid  
            if (ModelState.IsValid)
            {   //iterating through multiple file collection   
                foreach (HttpPostedFileBase file in files)
                {
                    //Checking file is available to save.  
                    if (file != null)
                    {
                        var InputFileName = Path.GetFileName(file.FileName);
                        var ServerSavePath = Path.Combine(Server.MapPath("~/UploadedFiles/") + InputFileName);
                        //Save file to server folder  
                        file.SaveAs(ServerSavePath);
                        //assigning file uploaded status to ViewBag for showing message to user.  
                        ViewBag.UploadStatus = files.Count().ToString() + " files uploaded successfully.";
                    }

                }
            }
            return View();
        }

    }
}