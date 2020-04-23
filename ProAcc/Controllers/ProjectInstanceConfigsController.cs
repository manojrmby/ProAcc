using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProACC_DB;

namespace ProAcc.Controllers
{
    public class ProjectInstanceConfigsController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: ProjectInstanceConfigs
        public ActionResult Index()
        {
            var projectInstanceConfigs = db.ProjectInstanceConfigs.Include(p => p.CustomerProjectConfig).Where(a => a.isActive == true);
            return View(projectInstanceConfigs.ToList());
        }

        // GET: ProjectInstanceConfigs/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectInstanceConfig projectInstanceConfig = db.ProjectInstanceConfigs.Find(id);
            if (projectInstanceConfig == null)
            {
                return HttpNotFound();
            }
            return View(projectInstanceConfig);
        }


        // GET: ProjectInstanceConfigs/Create
        public ActionResult Create()
        {
            var val = db.CustomerProjectConfigs.Where(x => x.isActive == true).ToList();
            ViewBag.CustProjconfigID = new SelectList(val, "Id", "ProjectName");
            return View();
        }

        // POST: ProjectInstanceConfigs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,InstaceName,CustProjconfigID,LastUpdated_Dt,isActive,Cre_on,Cre_By,Modified_On,Modified_by,IsDeleted")] ProjectInstanceConfig projectInstanceConfig)
        {
            if (ModelState.IsValid)
            {
                projectInstanceConfig.Id = Guid.NewGuid();
                projectInstanceConfig.LastUpdated_Dt = DateTime.Now.Date;
                projectInstanceConfig.Cre_on = DateTime.Now.Date;
                db.ProjectInstanceConfigs.Add(projectInstanceConfig);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CustProjconfigID = new SelectList(db.CustomerProjectConfigs, "Id", "ProjectName", projectInstanceConfig.CustProjconfigID);
            return View(projectInstanceConfig);
        }

        // GET: ProjectInstanceConfigs/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectInstanceConfig projectInstanceConfig = db.ProjectInstanceConfigs.Find(id);
            if (projectInstanceConfig == null)
            {
                return HttpNotFound();
            }
            var val = db.CustomerProjectConfigs.Where(x => x.isActive == true).ToList();
            ViewBag.CustProjconfigID = new SelectList(val, "Id", "ProjectName", projectInstanceConfig.CustProjconfigID);
            return View(projectInstanceConfig);
        }

        // POST: ProjectInstanceConfigs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,InstaceName,CustProjconfigID,LastUpdated_Dt,isActive,Cre_on,Cre_By,Modified_On,Modified_by,IsDeleted")] ProjectInstanceConfig projectInstanceConfig)
        {
            if (ModelState.IsValid)
            {
                db.Entry(projectInstanceConfig).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustProjconfigID = new SelectList(db.CustomerProjectConfigs, "Id", "ProjectName", projectInstanceConfig.CustProjconfigID);
            return View(projectInstanceConfig);
        }

        // GET: ProjectInstanceConfigs/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectInstanceConfig projectInstanceConfig = db.ProjectInstanceConfigs.Find(id);
            if (projectInstanceConfig == null)
            {
                return HttpNotFound();
            }
            return View(projectInstanceConfig);
        }

        // POST: ProjectInstanceConfigs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            ProjectInstanceConfig projectInstanceConfig = db.ProjectInstanceConfigs.Find(id);
            if(projectInstanceConfig.Id==id)
            {
                projectInstanceConfig.isActive = false;
                projectInstanceConfig.IsDeleted = true;
                db.Entry(projectInstanceConfig).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            db.ProjectInstanceConfigs.Remove(projectInstanceConfig);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
