using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProAcc.BL.Model;
using ProACC_DB;
using PagedList;
using PagedList.Mvc;

namespace ProAcc.Controllers
{
    public class CustomersController : Controller
    {
        private ProAccEntities db = new ProAccEntities();

        // GET: Customers
        public ActionResult Index(String search, int? i)
        {
            var customers = db.Customers
                .Where(a => a.isActive == true)
                .Where(x => x.Name.StartsWith(search) || search == null).ToList().ToPagedList(i ?? 1, 5);
            return View(customers);
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
        
        public JsonResult CheckUsernameAvailability(string userdata)
        {
            System.Threading.Thread.Sleep(100);
            var SearchData = db.Customers.Where(x => x.UserName == userdata).SingleOrDefault();
            var SearchDt= db.Consultants.Where(x => x.UserName == userdata).SingleOrDefault();
            if (SearchData!=null|| SearchDt!=null)
            {
                return Json(1);
            }
            else
            {
                return Json(0);
            }
        }

       
        // GET: Customers/Create
        public ActionResult Create()
        {
            var val = db.User_Master.Where(a => a.isActive == true);
            ViewBag.UserTypeID = new SelectList(val, "Id", "UserType");
            var status = db.leadStatus_Master.Where(a => a.isActive == true);
            ViewBag.LeadStatus = new SelectList(status, "Id", "StatusName");
            ViewBag.Id = new SelectList(db.Projects, "Id", "Accuracy");
            CreateViewModel model = new CreateViewModel();
            model.customer = new Customer();
            model.consultant = new Consultant();
            return View(model);
        }

        // POST: Customers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Customer customer)
        {
            if (ModelState.IsValid)
            {
                if (customer.UserName != null && customer.Password != null)
                {
                    customer.Id = Guid.NewGuid();
                    customer.Cre_on = DateTime.Now;
                    customer.Cre_By = ProAcc.BL.Model.Common.User_ID;
                    customer.isActive = true;
                    db.Customers.Add(customer);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", customer.UserTypeID);
                    ViewBag.Id = new SelectList(db.Projects, "Id", "Accuracy", customer.Id);
                    ViewBag.LeadStatus = new SelectList(db.leadStatus_Master, "Id", "StatusName", customer.Id);
                    ViewBag.Message = true;
                    return View();
                }
            }

            ViewBag.UserTypeID = new SelectList(db.User_Master.Where(a => a.isActive == true), "Id", "UserType", customer.UserTypeID);
            ViewBag.Id = new SelectList(db.Projects.Where(a => a.isActive == true), "Id", "Accuracy", customer.Id);
            ViewBag.LeadStatus = new SelectList(db.leadStatus_Master.Where(a => a.isActive == true), "Id", "StatusName", customer.Id);
            CreateViewModel model = new CreateViewModel();
            model.consultant = new Consultant();
            model.customer = customer;
            return View(model);
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
            var val = db.User_Master.Where(a => a.isActive == true);
            ViewBag.UserTypeID = new SelectList(val, "Id", "UserType", customer.UserTypeID);
            ViewBag.Id = new SelectList(db.Projects, "Id", "Accuracy", customer.Id);
            var status = db.leadStatus_Master.Where(a => a.isActive == true);
            ViewBag.LeadStatus = new SelectList(status, "Id", "StatusName", customer.Id);
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Customer customer)
        {
            if (ModelState.IsValid)
            {
                customer.Modified_On = DateTime.Now;
                customer.Cre_on = DateTime.Now;
                customer.Modified_by= @ProAcc.BL.Model.Common.User_ID;
                customer.isActive = true;
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserTypeID = new SelectList(db.User_Master, "Id", "UserType", customer.UserTypeID);
            ViewBag.Id = new SelectList(db.Projects, "Id", "Accuracy", customer.Id);
            var status = db.leadStatus_Master.Where(a => a.isActive == true);
            ViewBag.LeadStatus = new SelectList(status, "Id", "StatusName", customer.Id);
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
            //db.Customers.Remove(customer);
            if(customer.Id==id)
            {
                customer.isActive = false;
                customer.IsDeleted = true;
                db.Entry(customer).State = System.Data.Entity.EntityState.Modified;
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
