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

        public ActionResult Test()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Upload()
        {

            if (Request.Files.Count > 0)
            {
                try
                {
                    //  Get all files from Request object  
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        //string path = AppDomain.CurrentDomain.BaseDirectory + "Uploads/";  
                        //string filename = Path.GetFileName(Request.Files[i].FileName);  

                        HttpPostedFileBase file = files[i];
                        string fname;

                        // Checking for Internet Explorer  
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                        }

                        // Get the complete folder path and store the file inside it.  
                        fname = Path.Combine(Server.MapPath("~/Content/UploadedFiles/"), fname);
                        file.SaveAs(fname);
                    }
                    // Returns message that successfully uploaded  
                    return Json("File Uploaded Successfully!");
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("No files selected.");
            }
            // Verify that the user selected a file
            //if (files != null && files.ContentLength > 0)
            //{
            //    // extract only the filename
            //    var fileName = Path.GetFileName(files.FileName);
            //    // store the file inside ~/App_Data/uploads folder
            //    var path = Path.Combine(Server.MapPath("~/App_Data/uploads"), fileName);
            //    files.SaveAs(path);
            //}
            // redirect back to the index action to show the form once again

            return View("Index");
        }

        //[HttpPost]
        //public ActionResult UploadFile(HttpPostedFileBase file)
        //{
        //    try
        //    {
        //        if (file.ContentLength > 0)
        //        {
        //            string _FileName = Path.GetFileName(file.FileName);
        //            string _path = Path.Combine(Server.MapPath("~/UploadedFiles"), _FileName);
        //            file.SaveAs(_path);
        //        }
        //        ViewBag.Message = "File Uploaded Successfully!!";
        //        return View();
        //    }
        //    catch
        //    {
        //        ViewBag.Message = "File upload failed!!";
        //        return View();
        //    }
        //}


        //public void ProcessRequest(HttpContext context)
        //{
        //    context.Response.ContentType = "text/plain";
        //    try
        //    {
        //        string dirFullPath = Server.MapPath("~/MediaUploader/");
        //        string[] files;
        //        int numFiles;
        //        files = System.IO.Directory.GetFiles(dirFullPath);
        //        numFiles = files.Length;
        //        numFiles = numFiles + 1;
        //        string str_image = "";

        //        foreach (string s in context.Request.Files)
        //        {
        //            HttpPostedFile file = context.Request.Files[s];
        //            string fileName = file.FileName;
        //            string fileExtension = file.ContentType;

        //            if (!string.IsNullOrEmpty(fileName))
        //            {
        //                fileExtension = Path.GetExtension(fileName);
        //                str_image = "MyPHOTO_" + numFiles.ToString() + fileExtension;
        //                string pathToSave_100 = Server.MapPath("~/MediaUploader/") + str_image;
        //                file.SaveAs(pathToSave_100);
        //            }
        //        }
        //        //  database record update logic here  ()

        //        context.Response.Write(str_image);
        //    }
        //    catch (Exception ac)
        //    {

        //    }
        //}
        //public bool IsReusable
        //{
        //    get
        //    {
        //        return false;
        //    }
        //}
        //[HttpPost]
        //public ActionResult UploadFiles(files)
        //{
        //    // Checking no of files injected in Request object  
        //    if (Request.Files.Count > 0)
        //    {
        //        try
        //        {
        //            //  Get all files from Request object  
        //            HttpFileCollectionBase files = Request.Files;
        //            for (int i = 0; i < files.Count; i++)
        //            {
        //                //string path = AppDomain.CurrentDomain.BaseDirectory + "Uploads/";  
        //                //string filename = Path.GetFileName(Request.Files[i].FileName);  

        //                HttpPostedFileBase file = files[i];
        //                string fname;

        //                // Checking for Internet Explorer  
        //                if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
        //                {
        //                    string[] testfiles = file.FileName.Split(new char[] { '\\' });
        //                    fname = testfiles[testfiles.Length - 1];
        //                }
        //                else
        //                {
        //                    fname = file.FileName;
        //                }

        //                // Get the complete folder path and store the file inside it.  
        //                fname = Path.Combine(Server.MapPath("~/Uploads/"), fname);
        //                file.SaveAs(fname);
        //            }
        //            // Returns message that successfully uploaded  
        //            return Json("File Uploaded Successfully!");
        //        }
        //        catch (Exception ex)
        //        {
        //            return Json("Error occurred. Error details: " + ex.Message);
        //        }
        //    }
        //    else
        //    {
        //        return Json("No files selected.");
        //    }
        //}
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


        //[HttpPost]
        //public ActionResult UploadFiles()
        //{
        //    string path = Server.MapPath("~/Content/Upload/");
        //    HttpFileCollectionBase files = Request.Files;
        //    for (int i = 0; i < files.Count; i++)
        //    {
        //        HttpPostedFileBase file = files[i];
        //        file.SaveAs(path + file.FileName);
        //    }
        //    return Json(files.Count + " Files Uploaded!");
        //}
    }
}