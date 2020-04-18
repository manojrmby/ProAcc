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
    public class CustomerProjectConfigsController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: CustomerProjectConfigs
        public ActionResult Index()
        {
            var customerProjectConfigs = db.CustomerProjectConfigs.Include(c => c.Consultant).Include(c => c.Customer);
            return View(customerProjectConfigs.ToList());
        }

        // GET: CustomerProjectConfigs/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomerProjectConfig customerProjectConfig = db.CustomerProjectConfigs.Find(id);
            if (customerProjectConfig == null)
            {
                return HttpNotFound();
            }
            return View(customerProjectConfig);
        }

        // GET: CustomerProjectConfigs/Create
        public ActionResult Create()
        {
            ViewBag.ConsultantID = new SelectList(db.Consultants, "Id", "UserName");
            ViewBag.CustomerID = new SelectList(db.Customers, "Id", "UserName");
            return View();
        }

        // POST: CustomerProjectConfigs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ProjectName,CustomerID,ConsultantID,LastUpdated_Dt,isActive,Cre_on,Cre_By,Modified_On,Modified_by,IsDeleted")] CustomerProjectConfig customerProjectConfig)
        {
            if (ModelState.IsValid)
            {
                customerProjectConfig.Id = Guid.NewGuid();
                customerProjectConfig.Cre_on = DateTime.Now.Date;
                customerProjectConfig.LastUpdated_Dt= DateTime.Now.Date;
                db.CustomerProjectConfigs.Add(customerProjectConfig);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ConsultantID = new SelectList(db.Consultants, "Id", "UserName", customerProjectConfig.ConsultantID);
            ViewBag.CustomerID = new SelectList(db.Customers, "Id", "UserName", customerProjectConfig.CustomerID);
            return View(customerProjectConfig);
        }

        // GET: CustomerProjectConfigs/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomerProjectConfig customerProjectConfig = db.CustomerProjectConfigs.Find(id);
            if (customerProjectConfig == null)
            {
                return HttpNotFound();
            }
            ViewBag.ConsultantID = new SelectList(db.Consultants, "Id", "UserName", customerProjectConfig.ConsultantID);
            ViewBag.CustomerID = new SelectList(db.Customers, "Id", "UserName", customerProjectConfig.CustomerID);
            return View(customerProjectConfig);
        }

        // POST: CustomerProjectConfigs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ProjectName,CustomerID,ConsultantID,LastUpdated_Dt,isActive,Cre_on,Cre_By,Modified_On,Modified_by,IsDeleted")] CustomerProjectConfig customerProjectConfig)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customerProjectConfig).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ConsultantID = new SelectList(db.Consultants, "Id", "UserName", customerProjectConfig.ConsultantID);
            ViewBag.CustomerID = new SelectList(db.Customers, "Id", "UserName", customerProjectConfig.CustomerID);
            return View(customerProjectConfig);
        }

        // GET: CustomerProjectConfigs/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomerProjectConfig customerProjectConfig = db.CustomerProjectConfigs.Find(id);
            if (customerProjectConfig == null)
            {
                return HttpNotFound();
            }
            return View(customerProjectConfig);
        }

        // POST: CustomerProjectConfigs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            CustomerProjectConfig customerProjectConfig = db.CustomerProjectConfigs.Find(id);
            db.CustomerProjectConfigs.Remove(customerProjectConfig);
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
