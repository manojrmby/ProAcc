using ProAcc.BL;
using ProAcc.BL.Model;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProAcc.Controllers
{
    public class ProjectMonitorController : Controller
    {
        Base _Base = new Base();
        private ProAccEntities db = new ProAccEntities();
        // GET: ProjectMonitor
        public ActionResult Create()
        {
            return View();
        }
        public ActionResult GetData()
        {
            List<ProjectMonitorModel> PM = _Base.Sp_GetProjectMonitor();
            return Json(PM, JsonRequestBehavior.AllowGet);
        }

        public ActionResult SubmitProjectMonitor(ProjectMonitorModel Data)
        {

            return Json("", JsonRequestBehavior.AllowGet);
        }
        #region Masters
        public ActionResult GetPhase()
        {
            List<PhaseMaster> P = _Base.GetPhaseMasters();
            return Json(P, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetPending()
        {
            List<PendingMaster> P = _Base.GetPendingMasters();
            return Json(P, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetTeam()
        {
            List<TeamMaster> P = _Base.GetTeamMasters();
            return Json(P, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetConsultant()
        {
            List<Consultant> P = _Base.GetConsultant();
            return Json(P, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetStatus()
        {
            List<StatusMaster> P = _Base.GetStatus();
            return Json(P, JsonRequestBehavior.AllowGet);
        }
        #endregion


    }
}