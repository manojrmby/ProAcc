using ProAcc.BL;
using ProAcc.BL.Model;
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
            List<SAPInput_SimplificationReport> SR = _Base.SAPInput_Simplification();
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
            GeneralList sP_ = _Base.sP_SimplificationReport();
            ViewBag.LOB = new SelectList(sP_._List, "_Value", "Name");
            List<SAPInput_CustomCode> CR = _Base.SAPInput_CustomCodeReport();
            ViewBag.CRReport = CR;
            return View();
        }
        //END Custom Code

        public ActionResult Test()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Upload()
        {
            string Cust_ID = Request.Params["Cust_ID"].ToString();
            string IDProject = Request.Params["IDProject"].ToString();
            string InstanceName = Request.Params["InstanceID"].ToString();

            if (IDProject != null)
            {
                if (Request.Files.Count > 0)
                {
                    try
                    {
                        bool Result_Process_Activities = false, Result_Process_Bwextractors = false,
                            Result_Process_CustomCode = false, Result_Processup_HanaDatabaseTables = false,
                            Result_Process_FioriApps = false, Result_Process_Simplification = false,
                            Result_Process_SAPReadinessCheck = false, Result_Instance = false;
                        Guid Instance_ID = Guid.NewGuid();
                        //  Get all files from Request object  
                        HttpFileCollectionBase files = Request.Files;
                        for (int i = 0; i < files.Count; i++)
                        {
                            int FileCount = 0;
                            FileCount = Convert.ToInt32(files.AllKeys[i]) + 1;
                            HttpPostedFileBase file = files[i];
                            string fname;
                            string ext;
                            string NewID = Guid.NewGuid().ToString();
                            //Checking for Internet Explorer
                            if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                            {
                                string[] testfiles = file.FileName.Split(new char[] { '\\' });
                                fname = testfiles[testfiles.Length - 1];
                                ext = System.IO.Path.GetExtension(fname);
                            }
                            else
                            {
                                fname = file.FileName;
                                ext = System.IO.Path.GetExtension(fname);
                            }
                            String _fname = NewID + ext;
                            FileUpload _fileUpload = new FileUpload();
                            // Get the complete folder path and store the file inside it.  
                            fname = Path.Combine(Server.MapPath("~/Asset/UploadedFiles/"), _fname);
                            file.SaveAs(fname);
                            if (FileCount == 1)
                            {
                                Result_Process_Activities = _fileUpload.Process_Activities(fname, NewID, Instance_ID);
                            }
                            if (FileCount == 2)
                            {
                                Result_Process_Bwextractors = _Base.Upload_Bwextractors(NewID, Instance_ID);
                            }
                            else if (FileCount == 3)
                            {
                                Result_Process_CustomCode = _fileUpload.Process_CustomCode(fname, NewID, Instance_ID);
                            }
                            if (FileCount == 4)
                            {
                                Result_Processup_HanaDatabaseTables = _Base.Upload_HanaDatabaseTables(NewID, Instance_ID);
                            }
                            else if (FileCount == 5)
                            {
                                Result_Process_FioriApps = _fileUpload.Process_FioriApps(fname, NewID, Instance_ID);
                            }
                            else if (FileCount == 6)
                            {
                                Result_Process_Simplification = _fileUpload.Process_Simplification(fname, NewID, Instance_ID);
                            }
                            else if (FileCount == 7)
                            {
                                Result_Process_SAPReadinessCheck = _Base.Upload_SAPReadinessCheck(NewID, Instance_ID);
                            }


                        }

                        if (Result_Process_Bwextractors & Result_Process_Bwextractors &
                            Result_Process_CustomCode & Result_Processup_HanaDatabaseTables &
                            Result_Process_FioriApps & Result_Process_Simplification &
                            Result_Process_SAPReadinessCheck)
                        {

                            Result_Instance = _Base.AddInstance(IDProject, InstanceName, Instance_ID);

                            return Json("File Uploaded Successfully!");
                        }
                        return Json("File Uploaded Incomplete");
                        // Returns message that successfully uploaded  

                    }
                    catch (Exception ex)
                    {
                        return Json("Error occurred. Error details: " + ex.Message);
                    }
                }
                else
                {
                    return Json("Select ProjectID");
                }
            }
            else
            {
                return Json("No files selected.");
            }


        }


    }
}