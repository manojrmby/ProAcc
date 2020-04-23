using ProAcc.BL;
using ProAcc.BL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ProAcc.Controllers
{
    [AllowAnonymous]
    public class LoginController : Controller
    {
        Base _Base = new Base();
        // GET: Login

        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            return RedirectToAction("Login");
        }
        [HttpPost]
        public ActionResult Login(UserModel user)
        {
            //ViewBag.Message = message;
            LogedUser logedUser = new LogedUser();
            logedUser.Username = user.Username;
            logedUser.Password = user.Password;

            logedUser = _Base.UserValidation(logedUser);
            if (logedUser.ID != Guid.Empty)
            {
                FormsAuthentication.SetAuthCookie(logedUser.Username, false);
                Session["loginid"] = logedUser.ID.ToString();
               
                //IsValidate = "Login Successfully.";
            }

            return RedirectToAction("Home", "Home");
        }

        //public JsonResult ValidateUser(LogedUser user)
        //{

        //    string IsValidate = string.Empty;
        //    user = _Base.UserValidation(user);
        //    if (user.ID != Guid.Empty)
        //    {
        //        IsValidate = "Login Successfully.";
        //    }

        //    //switch (userId)
        //    //{
        //    //    case -1:
        //    //        IsValidate = "Username and/or password is incorrect.";
        //    //        break;
        //    //    case -2:
        //    //        IsValidate = "Account has not been activated.";
        //    //        break;
        //    //    case -3:
        //    //        IsValidate = "Login Successfully.";
        //    //        break;
        //    //}
        //    return Json(IsValidate, JsonRequestBehavior.AllowGet);
        //}

    }

}

