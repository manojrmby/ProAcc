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
using ProAcc.BL;

namespace ProAcc.Controllers
{

    [CheckSessionTimeOut]
    [Authorize(Roles = "Admin,Consultant")]
    public class ConsultantsController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: Consultants
        public ActionResult Index()
        {
            Guid AdminUser = Guid.Parse("42DC1071-CAAE-4585-AB73-9ADCBE85FDD5");
            var consultants = db.Consultants.Where(a => a.isActive == true)
                .OrderByDescending(x => x.Cre_on).Where(x => x.Id != AdminUser).ToList();
                //.Where(x => x.Name.StartsWith(search) || search == null).ToPagedList(i ?? 1, 5);
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

        public JsonResult CheckConsultantsUsernameAvailability(string userdata)
        {
            System.Threading.Thread.Sleep(100);
            var SearchData = db.Customers.Where(x => x.UserName == userdata).Where(x=>x.isActive==true).FirstOrDefault();
            var SearchDt = db.Consultants.Where(x => x.UserName == userdata).Where(x => x.isActive == true).FirstOrDefault();
            if (SearchData != null || SearchDt != null)
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("success", JsonRequestBehavior.AllowGet);
            }
        } 
        public JsonResult CheckConsultantsNameAvailability(string namedata)
        {
            System.Threading.Thread.Sleep(100);
            var SearchDt = db.Consultants.Where(x => x.Name == namedata).Where(x => x.isActive == true).FirstOrDefault();
            if (SearchDt != null)
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("success", JsonRequestBehavior.AllowGet);
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
        public ActionResult Create(Consultant con)
        {
            if (ModelState.IsValid)
            {
                if (con.Name != null && con.UserName !=null && con.Password!=null)
                {
                    con.Id = Guid.NewGuid();
                    con.Cre_By = Guid.Parse(Session["loginid"].ToString());
                    con.Cre_on = DateTime.Now;
                    con.isActive = true;
                    if (con.UserTypeID == 1)
                    {
                        con.TeamID = 1;
                    }
                    db.Consultants.Add(con);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    
                    ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", con.UserTypeID);
                    ViewBag.Message = true;
                    return View();
                }
                
            }

            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", con.UserTypeID);
            return View(con);
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
            var Team = db.TeamMasters.Where(a => a.isActive).Where(a => a.Id != 1);
            ViewBag.TeamID = new SelectList(Team, "Id", "TeamName", consultant.TeamID);
            return View(consultant);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Consultant con)
        {
            if (ModelState.IsValid)
            {
                con.Modified_On = DateTime.Now;
                //consultant.Cre_on = DateTime.Now;
                con.isActive = true;
                if (con.UserTypeID == 1)
                {
                    con.TeamID = 1;
                }
                db.Entry(con).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", con.UserTypeID);
            ViewBag.TeamID = new SelectList(db.TeamMasters, "Id", "TeamName", con.TeamID);
            return View(con);
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
