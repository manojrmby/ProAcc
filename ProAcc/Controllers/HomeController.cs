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
            Common.GeneralList sP_ = _Base.sP_SimplificationReport();
            ViewBag.LOB = new SelectList(sP_._List, "_Value", "Name");
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
        public JsonResult GetSimplificationReport_Bar(string LOB)
        {
            GeneralList sP_ = _Base.sP_SimplificationReport_Bar(LOB);

            return Json(sP_, JsonRequestBehavior.AllowGet);
        }

    }
}