using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProACC_DB;
using PagedList;
using PagedList.Mvc;

namespace ProAcc.Controllers
{
    public class ProjectInstanceConfigsController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: ProjectInstanceConfigs
        public ActionResult Index(String search, int? i)
        {
            var projectInstanceConfigs = db.ProjectInstanceConfigs.Where(a => a.isActive == true)
                .OrderByDescending(x => x.Cre_on)
                .Where(x => x.InstaceName.StartsWith(search) || search == null).ToList().ToPagedList(i ?? 1, 5);
            //var projectInstanceConfigs = db.ProjectInstanceConfigs.Include(p => p.CustomerProjectConfig).Where(a => a.isActive == true);
            return View(projectInstanceConfigs);
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
        public ActionResult Create(ProjectInstanceConfig projectInstanceConfig)
        {
            if (ModelState.IsValid)
            {
                if (projectInstanceConfig.InstaceName != null)
                {
                    projectInstanceConfig.Id = Guid.NewGuid();
                    projectInstanceConfig.LastUpdated_Dt = DateTime.Now;
                    projectInstanceConfig.Cre_on = DateTime.Now;
                    projectInstanceConfig.isActive = true;
                    db.ProjectInstanceConfigs.Add(projectInstanceConfig);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    var valid = db.CustomerProjectConfigs.Where(x => x.isActive == true).ToList();
                    ViewBag.CustProjconfigID = new SelectList(valid, "Id", "ProjectName", projectInstanceConfig.CustProjconfigID);
                    ViewBag.Message = true;
                    return View();
                }
            }

            var val = db.CustomerProjectConfigs.Where(x => x.isActive == true).ToList();
            ViewBag.CustProjconfigID = new SelectList(val, "Id", "ProjectName", projectInstanceConfig.CustProjconfigID);
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
        public ActionResult Edit(ProjectInstanceConfig projectInstanceConfig)
        {
            if (ModelState.IsValid)
            {
                projectInstanceConfig.Modified_On = DateTime.Now;
                db.Entry(projectInstanceConfig).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var val = db.CustomerProjectConfigs.Where(a => a.isActive == true);
            ViewBag.CustProjconfigID = new SelectList(val, "Id", "ProjectName", projectInstanceConfig.CustProjconfigID);
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
