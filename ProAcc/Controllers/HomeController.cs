﻿using ProAcc.BL;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProAcc.BL.Model;
using static ProAcc.BL.Model.Common;
//using static ProAcc.BL.Model.Common;

namespace ProAcc.Controllers
{
    [CheckSessionTimeOut]
    [Authorize(Roles = "Admin,Consultant,Customer")]
    public class HomeController : Controller
    {
        Base _Base = new Base();
        private ProAccEntities db = new ProAccEntities();
        // GET: Home
        public ActionResult Home()
        {
            int j = 0;
            var stat = db.HanaStatus.ToList();
            for (int i = 0; i < stat.Count(); i++)
            {
                if (stat[i].IsActive == true)
                {
                    j = j + 1;
                }
            }
            ViewBag.count = j;

            int userType = 0;
            if (User.IsInRole("Admin"))
            {
                userType = 1;
            }
            else if (User.IsInRole("Consultant"))
            {
                userType = 2;
            }
            else if (User.IsInRole("Customer"))
            {
                userType = 3;
            }
            GeneralList sP_ = _Base.spCustomerDropdown(Session["loginid"].ToString(), userType);
            ViewBag.Customer = new SelectList(sP_._List, "Value", "Name");
            Guid InstanceID = Guid.Parse(Session["InstanceId"].ToString());
            int inst = 0;
            if (InstanceID!=Guid.Empty)
            {
                var q = from u in db.ProjectInstanceConfigs where (u.Id == InstanceID && u.UploadStatus==true) select u;
                if (q.Count() > 0)
                {
                    inst = 1;
                }
                else { inst = 0; }
                
            }
            ViewBag.Instance = inst;
            List<SelectListItem> Project = new List<SelectListItem>();
            
            if (User.IsInRole("Customer"))
            {
                Guid customerId = Guid.Parse(Session["loginid"].ToString());
                var query = from u in db.CustomerProjectConfigs where(u.CustomerID== customerId && u.isActive == true) select u;
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
                
                //var query = from u in db.CustomerProjectConfigs where(u.isActive==true)  select u;
                //if (query.Count() > 0)
                //{
                //    foreach (var v in query)
                //    {
                //        Project.Add(new SelectListItem { Text = v.ProjectName, Value = v.Id.ToString() });
                //    }
                //}
            }
           
            
            ViewBag.Project = Project;
            return View();
        }
        public ActionResult Test()
        {
            //List<Customer> cust = db.Customers.Where(a => a.isActive == true).ToList();
            //ViewBag.list = cust;
            return View();
        }
        public JsonResult SubmitInstance(string IDInstance)
        {
            if (IDInstance != "")
            {
                //_Base.AddInstance(IDInstance);
                Session["InstanceId"] = IDInstance;
            }
            Guid ProjectID = Guid.Empty;
            Guid IDInstanceID = Guid.Parse(IDInstance);
            Session["Instance_Name"] = db.ProjectInstanceConfigs.FirstOrDefault(x => x.Id == IDInstanceID).InstaceName;
            ProjectID = db.ProjectInstanceConfigs.FirstOrDefault(x => x.Id == IDInstanceID).CustProjconfigID;
            Session["Project_Name"] = db.CustomerProjectConfigs.FirstOrDefault(x => x.Id == ProjectID).ProjectName;
            return Json(IDInstance, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult LoadInstance(string ProjectId)
        {
            //GeneralList Instance = _Base.GetInstanceDropdown(ProjectId);
            List<SelectListItem> Instance = new List<SelectListItem>();
            if (!String.IsNullOrEmpty(ProjectId)&& ProjectId !="0")
            {
                var ID = Guid.Parse(ProjectId);
                var query = from u in db.ProjectInstanceConfigs where u.CustProjconfigID == ID && u.UploadStatus==true select u;
                if (query.Count() > 0)
                {
                    foreach (var v in query)
                    {
                        Instance.Add(new SelectListItem { Text = v.InstaceName, Value = v.Id.ToString() });
                    }
                }
            }
            return Json(Instance, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult LoadProject(string CustomerId)
        {
            List<SelectListItem> Project = new List<SelectListItem>();
            if (User.IsInRole("Admin"))
            {
                if (!string.IsNullOrEmpty(CustomerId))
                {
                    Guid IDCustomer = Guid.Parse(CustomerId);
                    var query = from u in db.CustomerProjectConfigs where (u.CustomerID == IDCustomer && u.isActive == true) select u;
                    if (query.Count() > 0)
                    {
                        foreach (var v in query)
                        {
                            Project.Add(new SelectListItem { Text = v.ProjectName, Value = v.Id.ToString() });
                        }
                    }
                }
            }
            else if (User.IsInRole("Consultant"))
            {
                Guid loginId = Guid.Parse(Session["loginid"].ToString());
                if (!string.IsNullOrEmpty(CustomerId))
                {
                    Guid IDCustomer = Guid.Parse(CustomerId);
                    var query = from u in db.CustomerProjectConfigs where (u.CustomerID == IDCustomer && u.ConsultantID== loginId && u.isActive == true ) select u;
                    if (query.Count() > 0)
                    {
                        foreach (var v in query)
                        {
                            Project.Add(new SelectListItem { Text = v.ProjectName, Value = v.Id.ToString() });
                        }
                    }
                }

            }
         
            
            
            return Json(Project, JsonRequestBehavior.AllowGet);
        }

    }
}