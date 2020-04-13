using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProAcc.Controllers
{
    public class AssessmentController : Controller
    {
        // GET: Assessment
        public ActionResult CreateAnalysis()
        {
            return View();
        }
    }
}