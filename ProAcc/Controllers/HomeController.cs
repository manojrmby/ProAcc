using ProAcc.BL;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProAcc.BL.Model;

namespace ProAcc.Controllers
{
    public class HomeController : Controller
    {
        Base _Base = new Base();
        // GET: Home
        public ActionResult Home()
        {

            return View();
        }
        public ActionResult PreConvertion()
        {
            return View();
        }



        public ActionResult ReadinessReport()
        {
            return View();
        }
        public ActionResult SimplificationReport()
        {
            SP_SimplificationReport.GetDropdown sP_ = _Base.sP_SimplificationReport();

            return View();
        }

        //Post
        [HttpPost]
        public JsonResult GetSimplificationReport()
        {

            SP_ReadinessReport_Result GetRelevant = _Base.sAPInput();
            return Json(GetRelevant, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetSimplificationReport_Bar()
        {

            SP_SimplificationReport.GetDropdown sP_ = _Base.sP_SimplificationReport();
            return Json(sP_, JsonRequestBehavior.AllowGet);
        }

    }
}