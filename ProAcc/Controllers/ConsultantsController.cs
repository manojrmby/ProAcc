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
    public class ConsultantsController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: Consultants
        public ActionResult Index(String search, int? i)
        {
            var consultants = db.Consultants.Where(a => a.isActive == true)
                .OrderByDescending(x=>x.Cre_on)
                .Where(x => x.Name.StartsWith(search) || search == null).ToList().ToPagedList(i ?? 1, 5);
            //var consultants = db.Consultants.Include(c => c.User_Master).Where(a => a.isActive == true);
            return View(consultants);
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

        public JsonResult CheckUsernameAvailability(string userdata)
        {
            System.Threading.Thread.Sleep(100);
            var SearchData = db.Customers.Where(x => x.UserName == userdata).SingleOrDefault();
            var SearchDt = db.Consultants.Where(x => x.UserName == userdata).SingleOrDefault();
            if (SearchData != null || SearchDt != null)
            {
                return Json(1);
            }
            else
            {
                return Json(0);
            }
        }

        // GET: Consultants/Create
        public ActionResult Create()
        {
            var val = db.User_Master.Where(x => x.isActive == true).ToList();
            ViewBag.UserTypeID = new SelectList(val, "Id", "UserType");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Consultant consultant)
        {
            if (ModelState.IsValid)
            {
                if (consultant.Name != null && consultant.UserName !=null && consultant.Password!=null)
                {
                    consultant.Id = Guid.NewGuid();
                    consultant.Cre_By = ProAcc.BL.Model.Common.User_ID;
                    consultant.Cre_on = DateTime.Now;
                    consultant.isActive = true;
                    db.Consultants.Add(consultant);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", consultant.UserTypeID);
                    ViewBag.Message = true;
                    return View();
                }
                
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
            var val = db.User_Master.Where(a => a.isActive).Where(a => a.Id == 1 || a.Id == 2);
            ViewBag.UserTypeID = new SelectList(val, "Id", "UserType", consultant.UserTypeID);
            return View(consultant);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Consultant consultant)
        {
            if (ModelState.IsValid)
            {
                consultant.Modified_On = DateTime.Now;
                //consultant.Cre_on = DateTime.Now;
                consultant.isActive = true;
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
            if(consultant.Id==id)
            {
                consultant.isActive = false;
                consultant.IsDeleted = true;
                db.Entry(consultant).State = System.Data.Entity.EntityState.Modified;
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
