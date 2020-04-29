using ProAcc.BL;
using ProAcc.BL.Model;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static ProAcc.BL.Model.Common;

namespace ProAcc.Controllers
{
    [Authorize(Roles = "Admin,Consultant,Customer")]
    public class AssessmentController : Controller
    {
       
        ProAccEntities db = new ProAccEntities();
        Base _Base = new Base();
        LogHelper _logHelper = new LogHelper();
        // GET: Assessment
        [Authorize(Roles = "Admin,Consultant")]
        public ActionResult CreateAnalysis()
        {


            //Tuple<List<Lis>, List<Lis>, List<Lis>> sP_ = _Base.sP_AnalysisDropdowns();

            //ViewBag.Project = new SelectList(sP_.Item2, "Value", "Name");
            //ViewBag.Customer = new SelectList(sP_.Item1, "Value", "Name");
            //ViewBag.Instance = new SelectList(sP_.Item3, "Value", "Name");
            List<SelectListItem> Customer = new List<SelectListItem>();
            var query1 = from u in db.Customers select u;
            if (query1.Count() > 0)
            {
                foreach (var v in query1)
                {
                    Customer.Add(new SelectListItem { Text = v.Name, Value = v.Id.ToString() });
                }
            }
            ViewBag.Customer = Customer;

            List<SelectListItem> Project = new List<SelectListItem>();
            var query = from u in db.CustomerProjectConfigs select u;
            if (query.Count() > 0)
            {
                foreach (var v in query)
                {
                    Project.Add(new SelectListItem { Text = v.ProjectName, Value = v.Id.ToString() });
                }
            }
            ViewBag.Project = Project;
            return View();
        }

        //Start  Readiness
        public ActionResult ReadinessReport()
        {
            if (InstanceId == Guid.Empty)
            {
                ViewBag.Message = String.Format("Hello {0},\n Kindly Select Instance", Session["UserName"].ToString());
                //return RedirectToAction("Home", "Home");
            }
            else
            {

            }
            List<SelectListItem> Customer = new List<SelectListItem>();
            var query1 = from u in db.Customers select u;
            if (query1.Count() > 0)
            {
                foreach (var v in query1)
                {
                    Customer.Add(new SelectListItem { Text = v.Name, Value = v.Id.ToString() });
                }
            }
            ViewBag.Customer = Customer;
            List<SelectListItem> Project = new List<SelectListItem>();

            if (User.IsInRole("Customer"))
            {
                Guid customerId = Guid.Parse(Session["loginid"].ToString());
                var query = from u in db.CustomerProjectConfigs where (u.CustomerID == customerId) select u;
                if (query.Count() > 0)
                {
                    foreach (var v in query)
                    {
                        Project.Add(new SelectListItem { Text = v.ProjectName, Value = v.Id.ToString() });
                    }
                }
            }
            else
            {

                var query = from u in db.CustomerProjectConfigs select u;
                if (query.Count() > 0)
                {
                    foreach (var v in query)
                    {
                        Project.Add(new SelectListItem { Text = v.ProjectName, Value = v.Id.ToString() });
                    }
                }
            }


            ViewBag.Project = Project;
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
            if (InstanceId == Guid.Empty)
            {
                ViewBag.Message = String.Format("Hello {0},\n Kindly Select Instance", Session["UserName"].ToString()).Replace("\n",Environment.NewLine);
              
            }
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
            if (InstanceId == Guid.Empty)
            {
                ViewBag.Message = String.Format("Hello {0},\n Kindly Select Instance", Session["UserName"].ToString()).Replace("\n", Environment.NewLine);

            }
            GeneralList sP_ = _Base.sP_SimplificationReport();
            ViewBag.LOB = new SelectList(sP_._List, "_Value", "Name");
            List<SAPInput_CustomCode> CR = _Base.SAPInput_CustomCodeReport();
            ViewBag.CRReport = CR;
            return View();
        }
        //END Custom Code

        //Start  Readiness
        public ActionResult ActivitieReport()
        {
            if (InstanceId == Guid.Empty)
            {
                ViewBag.Message = String.Format("Hello {0},\n Kindly Select Instance", Session["UserName"].ToString()).Replace("\n", Environment.NewLine);

            }
            Tuple<List<Lis>, List<Lis>> sP_ = _Base.sp_GetActivitiesReportDropdown();

            ViewBag.Condition = new SelectList(sP_.Item2, "Value", "Name");
            ViewBag.Phase = new SelectList(sP_.Item1, "Value", "Name");
            List<BL.Model.SAPInput_Activities> AR = _Base.GetActivitiesReport_Table();
            ViewBag.ARReport = AR;
            return View();
        }
        public JsonResult GetActivitiesReport_Bar(string Phase, string condition)
        {
            GeneralList sP_ = _Base.sP_GetActivitiesReport_Bar(Phase, condition);
            return Json(sP_, JsonRequestBehavior.AllowGet);
        }
        public ActionResult FioriAppsReport()
        {
            if (InstanceId == Guid.Empty)
            {
                ViewBag.Message = String.Format("Hello {0},\n Kindly Select Instance", Session["UserName"].ToString()).Replace("\n", Environment.NewLine);

            }
            GeneralList sP_ = _Base.sp_GetFioriAppsReportDropdown();
            ViewBag.Roles = new SelectList(sP_._List, "_Value", "Name");
            List<SAPFioriAppsModel> FiR = _Base.sp_GetSAPFioriAppsTable();
            ViewBag.FiRReport = FiR;
            return View();
        }
        public JsonResult GetFioriAppsReportt_Bar(string Input)
        {
            GeneralList sP_ = _Base.sP_GetSAPFioriAppsReport_Bar(Input);
            return Json(sP_, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        [Authorize(Roles = "Admin,Consultant")]
        public ActionResult Upload()
        {
            //string Cust_ID = Request.Params["Cust_ID"].ToString();
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
                        Guid Instance_ID = Guid.Parse(InstanceName);
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
                            fname = Path.Combine(Server.MapPath(ConfigurationManager.AppSettings["Upload_filePath"].ToString()), _fname);
                            file.SaveAs(fname);
                            if (FileCount == 1)
                            {
                                Result_Process_Activities = _fileUpload.Process_Activities(fname, NewID, Instance_ID);
                            }
                            else if (FileCount == 2)
                            {
                                Result_Process_Bwextractors = _Base.Upload_Bwextractors(NewID, Instance_ID);
                            }
                            else if (FileCount == 3)
                            {
                                Result_Process_CustomCode = _fileUpload.Process_CustomCode(fname, NewID, Instance_ID);
                            }
                            else if (FileCount == 4)
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

                        //if (Result_Process_Bwextractors & Result_Process_Bwextractors &
                        //    Result_Process_CustomCode & Result_Processup_HanaDatabaseTables &
                        //    Result_Process_FioriApps & Result_Process_Simplification &
                        //    Result_Process_SAPReadinessCheck)
                        //{

                        //    //Result_Instance = _Base.AddInstance(IDProject, InstanceName, Instance_ID);

                        //    return Json("File Uploaded Successfully!");
                        //}
                        return Json("File Uploaded Successfully!");
                        // Returns message that successfully uploaded  

                    }
                    catch (Exception ex)
                    {
                        _logHelper.createLog(ex);
                        String msg = ex.Message;
                        if (msg.Contains("Activities"))
                        {

                        }
                        else if(msg.Contains("Activities"))
                        {

                        }
                        else if (msg.Contains("Activities"))
                        {

                        }
                        else if (msg.Contains("Activities"))
                        {

                        }
                        else if (msg.Contains("Activities"))
                        {

                        }
                        else if (msg.Contains("Activities"))
                        {

                        }
                        else if (msg.Contains("Activities"))
                        {

                        }
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

        [HttpPost]
        public JsonResult LoadProject(string CustomerId)
        {
            Guid IDCustomer = Guid.Parse(CustomerId);
            List<SelectListItem> Project = new List<SelectListItem>();
            var query = from u in db.CustomerProjectConfigs where (u.CustomerID == IDCustomer) select u;
            if (query.Count() > 0)
            {
                foreach (var v in query)
                {
                    Project.Add(new SelectListItem { Text = v.ProjectName, Value = v.Id.ToString() });
                }
            }
            



            //GeneralList sP_ = _Base.GetInstanceDropdown(ProjectId);
            //SelectList items = new SelectList(sP_._List, "Value", "Name");
            return Json(Project, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult LoadInstance(string ProjectId)
        {
            GeneralList sP_ = _Base.GetInstanceDropdown(ProjectId);
            SelectList items = new SelectList(sP_._List, "Value", "Name");
            return Json(items, JsonRequestBehavior.AllowGet);
        }



        
    }
}