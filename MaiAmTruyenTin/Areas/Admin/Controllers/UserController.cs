//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
//using Model.EF;
//Khai báo Common
using MaiAmTruyenTin.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Net;
using System.Web.UI.WebControls;
using MaiAmTruyenTin.Areas.Admin.Models;
using System.Text.RegularExpressions;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    // Dựa trên BaseController
    public class UserController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/User
        // Chức năng tìm kiếm và phân trang
        [HasCredential(RoleID = "READ_USER")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new UserDao();
            //Phân trang
            var model = dao.ListAllPaging(searchString, page, pageSize);
            //Tìm kiếm
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        [HasCredential(RoleID = "CREATE_USER")]
        public ActionResult Create()
        {
            SetViewBagAccountType();
            return View();
        }

        [HttpPost]
        [HasCredential(RoleID = "CREATE_USER")]
        public ActionResult Create(User user)
        {
            user.Password = EncryptString.Encrypt(user.Password);
            try
            {
                var dao = new UserDao();
                int id = dao.Insert(user);
                if (id > 0)
                {
                    SetAlert("Thêm user thành công", "success");
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm user không thành công");
                }
                return View("Index");
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Tài khoản hoặc email đã tồn tại!");
            }
            SetViewBagAccountType(user.GroupID);
            return View("Create");

        }
        public int confirmPassword(String password, String confirmPassword)
        {
            if (password.Equals(confirmPassword))
            {
                return 1;
            }
            else return 0;
        }
        [HttpGet]
        public ActionResult ChangePassword(ChangePasswordObject temp)
        {
            return View(temp);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChangePassword(ChangePasswordObject temp, int id)
        {
            string passwordOld = temp.PasswordOld;
            string passwordNew = temp.PasswordNew;
            string confirmPasswordNew = temp.ConfirmPasswordNew;
            try
            {
                var user = new UserDao().ViewDetail(id);
                string userPassword = EncryptString.Decrypt(user.Password);
                if (passwordOld.Equals(userPassword))
                {
                    //Kiểm tra password hợp lệ
                    int validPassResult = validatePassword(passwordNew);
                    if (validPassResult != 1)
                    {
                        string passMessage = errorPassword(validPassResult);
                        ModelState.AddModelError("", passMessage);
                        passwordNew = "";
                        return View("ChangePassword", temp);
                    }   
                    //Kiểm tra nhập lại password
                    int confirmResult = confirmPassword(passwordNew, confirmPasswordNew);
                    if (confirmResult == 1)
                    {
                        var dao = new UserDao();
                        SetViewBagAccountType(user.GroupID);
                        user.Status = true;
                        user.Password = passwordNew;
                        var result = dao.Update(user);
                        if (result)
                        {
                            SetAlert("Sửa user thành công", "success");
                            return RedirectToAction("Details", "User", new { id = user.ID });
                        }
                        else
                        {
                            ModelState.AddModelError("", "Cập nhật user không thành công");
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Mật khẩu chưa trùng khớp!");
                        return View("ChangePassword", temp);
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Mật khẩu hiện tại chưa chính xác!");
                    return View("ChangePassword", temp);
                }
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Có lỗi vừa xảy ra!");
            }
            return View("ChangePassword", temp);
        }
        public string errorPassword(int result)
        {
            switch (result)
            {
                case 0:
                    return "Mật khẩu phải có ít nhất một kí tự in hoa!";
                    break;
                case -1:
                    return "Mật khẩu phải có ít nhất một kí tự viết thường!";
                    break;
                case -2:
                    return "Mật khẩu không được trống!";
                    break;
                case -3:
                    return "Mật khẩu tối thiểu 8 kí tự và tối đa 15 kí tự!";
                    break;
                case -4:
                    return "Mật khẩu phải có ít nhất một chữ số!";
                    break;
                case -5:
                    return "Mật khẩu không được có kí tự đặc biệt!";
                    break;
            }
            return "";
        }
        public int validatePassword(string Password)
        {
            //0: ít nhất một từ viết hoa; -1: ít nhất một từ viết thường;  -2: k đc trống ; -3: mật khẩu tối thiểu 8 kí tự, tối đa 15 kí tự;
            // -4: phải chứa một số; -5: không được có ký tự đặc biệt; 1: password hợp lệ
            var input = Password;
            var hasNumber = new Regex(@"[0-9]+");
            var hasUpperChar = new Regex(@"[A-Z]+");
            var hasMiniMaxChars = new Regex(@".{8,15}");
            var hasLowerChar = new Regex(@"[a-z]+");
            var hasSymbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");
            if (!hasUpperChar.IsMatch(input))
            {
                return 0;
            }
            else if (!hasLowerChar.IsMatch(input))
            {
                return -1;
            }
            else if (string.IsNullOrWhiteSpace(input))
            {
                return -2;
            }
            else if (!hasMiniMaxChars.IsMatch(input))
            {
                return -3;
            }
            else if (!hasNumber.IsMatch(input))
            {
                return -4;
            }

            else if (hasSymbols.IsMatch(input))
            {
                return -5;
            }
            else
            {
                return 1;
            }
        }
        [HasCredential(RoleID = "UPDATE_USER")]
        public ActionResult Edit(int id)
        {
            var user = new UserDao().ViewDetail(id);
            user.Password = EncryptString.Decrypt(user.Password);
            SetViewBagAccountType();
            return View(user);
        }
        [HttpPost]
        [ValidateInput(false)]
        [HasCredential(RoleID = "UPDATE_USER")]
        public ActionResult Edit(User user)
        {
            try
            {
                var dao = new UserDao();
                SetViewBagAccountType(user.GroupID);
                user.Status = true;
                var result = dao.Update(user);
                if (result)
                {
                    SetAlert("Sửa user thành công", "success");
                    return RedirectToAction("Details", "User", new { id = user.ID });
                }
                else
                {
                    ModelState.AddModelError("", "Email bạn vừa nhập đã được sử dụng bởi tài khoản khác!");
                }
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Có lỗi gì đó vừa xảy ra!");
            }
            SetViewBagAccountType(user.GroupID);
            return View("Edit", user);
        }
        [HttpPost]
        [HasCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            new UserDao().Delete(id);
            return RedirectToAction("Index", "User");
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            user.Password = EncryptString.Decrypt(user.Password);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }
        [HttpPost]
        [HasCredential(RoleID = "UPDATE_USER")]
        public JsonResult ChangeStatus(long id)
        {
            var result = new UserDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
        public void SetViewBagAccountType(string selectedID = null)
        {
            var dao = new UserDao();
            ViewBag.AccountType = new SelectList(dao.ListUserGroup(), "ID", "Name", selectedID);
        }
    }
}