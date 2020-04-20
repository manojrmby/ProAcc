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
    public class CustomersController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: Customers
        public ActionResult Index()
        {
            var customers = db.Customers.Include(c => c.User_Master).Include(c => c.Project);
            return View(customers.ToList());
        }

        // GET: Customers/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }
        
        // GET: Customers/Create
        public ActionResult Create()
        {
            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType");
            ViewBag.Id = new SelectList(db.Projects, "Id", "Accuracy");
            return View();
        }

        // POST: Customers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserName,Password,UserTypeID,Name,Company,Work_Function,Phone,Email,EstimatedSale,LastContact_Dt,NextAction_Dt,NextContact_Dt,LeadStatus,LeadSource,Conv_Cust_Status,isActive,Cre_on,Cre_By,Modified_On,Modified_by,IsDeleted")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                //if (customer.UserName != null)
                //{
                //    customer.UserName
                //}
                customer.Id = Guid.NewGuid();
                customer.Cre_on = DateTime.Now.Date;
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", customer.UserTypeID);
            ViewBag.Id = new SelectList(db.Projects, "Id", "Accuracy", customer.Id);
            return View(customer);
        }

        // GET: Customers/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", customer.UserTypeID);
            ViewBag.Id = new SelectList(db.Projects, "Id", "Accuracy", customer.Id);
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserName,Password,UserTypeID,Name,Company,Work_Function,Phone,Email,EstimatedSale,LastContact_Dt,NextAction_Dt,NextContact_Dt,LeadStatus,LeadSource,Conv_Cust_Status,isActive,Cre_on,Cre_By,Modified_On,Modified_by,IsDeleted")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", customer.UserTypeID);
            ViewBag.Id = new SelectList(db.Projects, "Id", "Accuracy", customer.Id);
            return View(customer);
        }

        // GET: Customers/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
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
