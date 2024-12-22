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
using System.Text.RegularExpressions;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Admin/Register
        public string NameToCode(string name)
        {
            ReceivePayObjectDao dao = new ReceivePayObjectDao();
            string fullName = dao.LocDauTen(name);
            string space = " ";
            //Khởi tạo chuỗi rỗng
            string firstName = "", middleName = "", firstName0 = "", middleName0 = "", lastName0 = "", code = "";
            int spaceCount = dao.spaceCountAction(fullName);

            code = dao.getLastName(fullName).ToUpper();
            while (spaceCount != 0)
            {
                for (int i = 0; i < fullName.Length; i++)
                {
                    if (fullName[i].ToString().Contains(space))
                    {
                        firstName = fullName.Substring(0, i).ToUpper();
                        //Lấy chữ cái đầu của firstName
                        firstName0 = firstName0 + firstName.Substring(0, 1);
                        fullName = fullName.Substring(i + 1).ToUpper();
                        spaceCount--;
                        i = -1;
                    }
                }
                code = code + firstName0;
                code = code.Trim();
            }
            return code;
        }
        public ActionResult Index(User user)
        {
            return View(user);
        }
        [HttpPost]
        public ActionResult Index(User user, String ConfirmPassword)
        {
            try
            {
                //Kiểm tra Username
                int checkUserName = checkUsername(user.UserName);
                if (checkUserName == 0)
                {
                    ModelState.AddModelError("", "Tên tài khoản không được có khoảng trắng!");
                    return View("Index", user);
                }
                //Kiểm tra password hợp lệ
                int validPassResult = validatePassword(user.Password);
                if (validPassResult != 1)
                {
                    string passMessage = errorPassword(validPassResult);
                    ModelState.AddModelError("", passMessage);
                    user.Password = null;
                    return View("Index", user);
                }
                //Kiểm tra nhập lại password
                int result = confirmPassword(user.Password, ConfirmPassword);
                if (result == 1)
                {
                    user.Email = NameToCode(user.Name) + "@gmail.com";
                    user.Phone = "0123456789";
                    user.Address = "Chưa cập nhật";
                    user.Image = "/Assets/admin/img/doraemon1.png";
                    user.GroupID = "CHILDREN";
                    user.Status = true;
                    user.CreatedBy = user.Name;
                    user.CreatedDate = DateTime.Now;
                    user.Password = EncryptString.Encrypt(user.Password);
                    var dao = new UserDao();
                    int id = dao.Insert(user);
                    if (id > 0){
                        return RedirectToAction("Index", "Login");
                    }
                    else{
                        ModelState.AddModelError("", "Thêm user không thành công");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Mật khẩu không trùng khớp!");
                }
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Có lỗi đã xảy rai!");
            }
            SetViewBagAccountType(user.GroupID);
            return View("Index", user);
        }
        public int checkUsername(String UserName)
        {
            var input = UserName;
            if (!string.IsNullOrEmpty(input))
            {
                return 1;
            }
            else return 0;
        }
        public int confirmPassword(String password, String confirmPassword)
        {
            if (password.Equals(confirmPassword))
            {
                return 1;
            }
            else return 0;
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
        public void SetViewBagAccountType(string selectedID = null)
        {
            var dao = new UserDao();
            ViewBag.AccountType = new SelectList(dao.ListUserGroup(), "ID", "Name", selectedID);
        }
    }
}