using ProAcc.BL;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProAcc.BL.Model;
using static ProAcc.BL.Model.Common;

namespace ProAcc.Controllers
{
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

            List<Customer> cust = db.Customers.Where(a => a.isActive == false).ToList();
            ViewBag.list = cust;            
            return View();
        }
        public ActionResult Test()
        {
            List<Customer> cust = db.Customers.Where(a => a.isActive == false).ToList();
            ViewBag.list = cust;
            return View();
        }
    }
}