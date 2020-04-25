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
    public class CustomerProjectConfigsController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: CustomerProjectConfigs
        public ActionResult Index(String search, int? i)
        {
            var customerProjectConfigs = db.CustomerProjectConfigs.Where(a => a.isActive == true)
                .OrderByDescending(x => x.Cre_on)
                .Where(x => x.ProjectName.StartsWith(search) || search == null).ToList().ToPagedList(i ?? 1, 5);
           // var customerProjectConfigs = db.CustomerProjectConfigs.Include(c => c.Consultant).Include(c => c.Customer).Where(a=>a.isActive==true);
            return View(customerProjectConfigs);
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
            
            var val = db.Consultants.Where(a => a.isActive == true);
            ViewBag.ConsultantID = new SelectList(val, "Id", "Name");
            var val1 = db.Customers.Where(a => a.isActive == true);
            ViewBag.CustomerID = new SelectList(val1, "Id", "Name");
            return View();
        }

        // POST: CustomerProjectConfigs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CustomerProjectConfig customerProjectConfig)
        {
            if (ModelState.IsValid)
            {
                if (customerProjectConfig.ProjectName != null)
                {
                    customerProjectConfig.Id = Guid.NewGuid();
                    customerProjectConfig.Cre_on = DateTime.Now;
                    customerProjectConfig.LastUpdated_Dt = DateTime.Now;
                    customerProjectConfig.isActive = true;
                    db.CustomerProjectConfigs.Add(customerProjectConfig);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    var valid = db.Consultants.Where(a => a.isActive == true);
                    ViewBag.ConsultantID = new SelectList(valid, "Id", "Name", customerProjectConfig.ConsultantID);
                    var valid1 = db.Customers.Where(a => a.isActive == true);
                    ViewBag.CustomerID = new SelectList(valid1, "Id", "Name", customerProjectConfig.CustomerID);
                    ViewBag.Message = true;
                    return View();
                }
            }

            var val = db.Consultants.Where(a => a.isActive == true);
            ViewBag.ConsultantID = new SelectList(val, "Id", "Name", customerProjectConfig.ConsultantID);
            var val1 = db.Customers.Where(a => a.isActive == true);
            ViewBag.CustomerID = new SelectList(val1, "Id", "Name", customerProjectConfig.CustomerID);
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
            var val = db.Consultants.Where(a => a.isActive == true);
            ViewBag.ConsultantID = new SelectList(val, "Id", "Name", customerProjectConfig.ConsultantID);
            var val1 = db.Customers.Where(a => a.isActive == true);
            ViewBag.CustomerID = new SelectList(val1, "Id", "Name", customerProjectConfig.CustomerID);
            return View(customerProjectConfig);
        }

        // POST: CustomerProjectConfigs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CustomerProjectConfig customerProjectConfig)
        {
            if (ModelState.IsValid)
            {
                customerProjectConfig.Modified_On = DateTime.Now;
                db.Entry(customerProjectConfig).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var val = db.Consultants.Where(a => a.isActive == true);
            ViewBag.ConsultantID = new SelectList(val, "Id", "Name", customerProjectConfig.ConsultantID);
            var val1 = db.Customers.Where(a => a.isActive == true);
            ViewBag.CustomerID = new SelectList(val1, "Id", "Name", customerProjectConfig.CustomerID);
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
            if(customerProjectConfig.Id==id)
            {
                customerProjectConfig.isActive = false;
                customerProjectConfig.IsDeleted = true;
                db.Entry(customerProjectConfig).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            
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
