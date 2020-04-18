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
    public class ConsultantsController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: Consultants
        public ActionResult Index()
        {
            var consultants = db.Consultants.Include(c => c.User_Master);
            return View(consultants.ToList());
        }

        // GET: Consultants/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consultant consultant = db.Consultants.Find(id);
            if (consultant == null)
            {
                return HttpNotFound();
            }
            return View(consultant);
        }

        // GET: Consultants/Create
        public ActionResult Create()
        {
            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType");
            return View();
        }

        // POST: Consultants/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserName,Password,UserTypeID,Name,Designation,Phone,EMail,isActive,Cre_on,Cre_By,Modified_On,Modified_by,IsDeleted")] Consultant consultant)
        {
            if (ModelState.IsValid)
            {
                consultant.Id = Guid.NewGuid();
                consultant.Cre_on = DateTime.Now.Date;
                db.Consultants.Add(consultant);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", consultant.UserTypeID);
            return View(consultant);
        }

        // GET: Consultants/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consultant consultant = db.Consultants.Find(id);
            if (consultant == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", consultant.UserTypeID);
            return View(consultant);
        }

        // POST: Consultants/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserName,Password,UserTypeID,Name,Designation,Phone,EMail,isActive,Cre_on,Cre_By,Modified_On,Modified_by,IsDeleted")] Consultant consultant)
        {
            if (ModelState.IsValid)
            {
                db.Entry(consultant).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", consultant.UserTypeID);
            return View(consultant);
        }

        // GET: Consultants/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consultant consultant = db.Consultants.Find(id);
            if (consultant == null)
            {
                return HttpNotFound();
            }
            return View(consultant);
        }

        // POST: Consultants/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Consultant consultant = db.Consultants.Find(id);
            db.Consultants.Remove(consultant);
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
