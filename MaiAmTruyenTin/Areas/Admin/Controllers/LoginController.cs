using DocumentFormat.OpenXml.Bibliography;
using Facebook;
using MaiAmTruyenTin.Areas.Admin.Models;
using MaiAmTruyenTin.Common;
using Model.DAO;
using Model.EF;
using System;
using System.Configuration;
using System.Linq;
using System.Web.Mvc;
using System.Web.Services.Description;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }
        public string NameToCode(string name)
        {
            ReceivePayObjectDao dao = new ReceivePayObjectDao();
            string fullName = dao.LocDauTen(name);
            string space = " ";
            //Khởi tạo chuỗi rỗng
            string firstName = "", middleName = "", firstName0 = "", middleName0 = "", lastName0 = "", code = "";
            int spaceCount = dao.spaceCountAction(fullName);

            code = dao.getLastName(fullName);
            while (spaceCount != 0)
            {
                for (int i = 0; i < fullName.Length; i++)
                {
                    if (fullName[i].ToString().Contains(space))
                    {
                        firstName = fullName.Substring(0, i);
                        //Lấy chữ cái đầu của firstName
                        firstName0 = firstName0 + firstName.Substring(0, 1);
                        fullName = fullName.Substring(i + 1);
                        spaceCount--;
                        i = -1;
                    }
                }
                code = code + firstName0;
            }
            return code.ToLower();
        }
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(LoginModel model)
        {
            var dao = new UserDao();
            var result = dao.Login(model.UserName, EncryptString.Encrypt(model.Password));
            try
            {
                if (result == 1)
                {
                    var user = dao.GetByID(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.Name = user.Name;
                    userSession.UserID = user.ID;
                    userSession.Image = user.Image;
                    userSession.GroupID = user.GroupID;
                    var listCredentials = dao.GetListCredentials(model.UserName);
                    Session.Add(CommonConstants.SESSION_CREDENTIALS, listCredentials);
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không có quyền đăng nhập!");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng");
                }
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Lỗi hệ thống!");
            }
            return View("Index");
        }
        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email",
            });
            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code,
            });
            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;
                //Get the user's information, like email, first name, middle name etc,...
                dynamic me = fb.Get("me?fields=first_name, middle_name, last_name, id, email, picture, locale");
                string email = (me.email != null ? me.email : "");
                string username = me.email;
                string firstname = me.first_name;
                string middlename = me.middle_name;
                string lastname = me.last_name;
                string picture = me.pictrure;
                string address = me.locale;

                string userTmp = NameToCode(firstname + " " + lastname);
                if (userTmp.Contains(" "))
                {
                    userTmp = userTmp.Replace(" ", String.Empty);
                }

                var user = new User();
                user.Email = email;
                user.Status = true;
                user.Name = firstname + " " + middlename + " " + lastname;
                user.UserName = (!string.IsNullOrEmpty(email) ? email : userTmp);
                user.Password = "1";
                user.Image = (picture != null ? picture : "/Assets/admin/img/doraemon.png");
                user.Address = address;
                user.CreatedDate = DateTime.Now;
                user.GroupID = "CHILDREN";
                var resultInsert = new UserDao().InsertFacebook(user);
                if (resultInsert > 0)
                {
                    var userTmp1 = db.Users.Where(x => x.ID == resultInsert).FirstOrDefault();
                    var model = new LoginModel();
                    model.UserName = userTmp1.UserName;
                    model.Password = userTmp1.Password;
                    model.RememberMe = false;

                    var dao = new UserDao();
                    var resultLogin = dao.Login(model.UserName, model.Password);
                    //try
                    //{
                    if (resultLogin == 1)
                    {
                        var userLogin = dao.GetByID(model.UserName);
                        var userSession = new UserLogin();
                        userSession.UserName = userLogin.UserName;
                        userSession.Name = userLogin.Name;
                        userSession.UserID = userLogin.ID;
                        userSession.Image = userLogin.Image;
                        userSession.GroupID = userLogin.GroupID;
                        var listCredentials = dao.GetListCredentials(model.UserName);
                        Session.Add(CommonConstants.SESSION_CREDENTIALS, listCredentials);
                        Session.Add(CommonConstants.USER_SESSION, userSession);
                    }
                }
            }
            return Redirect("/he-thong/trang-chu");
        }
    }
}