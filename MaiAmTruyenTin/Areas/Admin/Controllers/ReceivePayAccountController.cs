using Model.DAO;
using Model.EF;
using System.Web.Mvc;
using System.Net;
using System;
using Model.ViewModel;
using System.Linq;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class ReceivePayAccountController : BaseController
    {
        // GET: Admin/ReceivePayAccount
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new ReceivePayAccountDao();
                var model = dao.ListAllCategory(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        public string OriginalTotal()
        {
            var sum = db.ReceivePayAccounts.Sum(x => x.Original).Value;
            decimal originalTotal = Convert.ToDecimal(sum.ToString("#.00"));
            return String.Format("{0:0,0}", originalTotal);
        }
        public string ReceivedTotal()
        {
            var sum = db.Receipts.Sum(x => x.Amount).Value;
            decimal receivedTotal = Convert.ToDecimal(sum.ToString("#.00"));
            return String.Format("{0:0,0}", receivedTotal);
        }
        public string PayedTotal()
        {
            var sum = db.Payments.Sum(x => x.Amount).Value;
            decimal payedTotal = Convert.ToDecimal(sum.ToString("#.00"));
            return String.Format("{0:0,0}", payedTotal);
        }
        public string FinancialPosition()
        {
            decimal originalTotal = db.ReceivePayAccounts.Sum(x => x.Original).Value;
            decimal receivedTotal = db.Receipts.Sum(x => x.Amount).Value;
            decimal payedTotal = db.Payments.Sum(x => x.Amount).Value;
            decimal available = originalTotal + receivedTotal - payedTotal;
            return String.Format("{0:0,0}", available);
        }
        //THEO TỪNG TÀI KHOẢN
        public string ReceivedTotalEachAccount(int id)
        {
            decimal receivedTotal = db.Receipts.Where(x => x.ReceivePayAccountID == id).ToList().Sum(x => x.Amount).Value;
            return String.Format("{0:0,0}", receivedTotal);
        }
        public string PayedTotalEachAccount(int id)
        {
            decimal payedTotal = db.Payments.Where(x => x.ReceivePayAccountID == id).ToList().Sum(x => x.Amount).Value;
            return String.Format("{0:0,0}", payedTotal);
        }
        public string AvailableMoneyEachAccount(int id)
        {
            ReceivePayAccount item = db.ReceivePayAccounts.Find(id);
            decimal original = Convert.ToDecimal(item.Original.Value.ToString("#.00"));

            decimal receivedTotal = db.Receipts.Where(x => x.ReceivePayAccountID == id).ToList().Sum(x => x.Amount).Value;
            decimal payedTotal = db.Payments.Where(x => x.ReceivePayAccountID == id).ToList().Sum(x => x.Amount).Value;

             decimal available = original + receivedTotal - payedTotal;
            return String.Format("{0:0,0}", available);
        }
        public ActionResult Create()
        {
            try
            {
                SetViewBagCurrency();
                return View();
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpPost]
        public ActionResult Create(ReceivePayAccount model)
        {

            try
            {
                var id = new ReceivePayAccountDao().Insert(model);
                if (id > 0)
                {
                    SetAlert("Thêm quỹ/ tài khoản thành công", "success");
                    return RedirectToAction("Index", "ReceivePayAccount");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm quỹ/ tài khoản không thành công");
                }
                SetViewBagCurrency(model.CurrencyID);
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            SetViewBagCurrency();
            var receivepay = new ReceivePayAccountDao().ViewDetail(id);
            return View(receivepay);
        }
        [HttpPost]
        public ActionResult Edit(ReceivePayAccount receivepay)
        {
            var dao = new ReceivePayAccountDao();
            var result = dao.Update(receivepay);
            if (result)
            {
                SetAlert("Sửa quỹ/ tài khoản thành công", "success");
                return RedirectToAction("Index", "ReceivePayAccount");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật quỹ/ tài khoản không thành công");
            }
            SetViewBagCurrency(receivepay.CurrencyID);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new ReceivePayAccountDao().Delete(id);
            }
            catch
            {

            }
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //SetViewBag();
            ReceivePayAccount receivepay = db.ReceivePayAccounts.Find(id);
            if (receivepay == null)
            {
                return HttpNotFound();
            }
            return View(receivepay);
        }
        public void SetViewBagCurrency(long? selectedID = null)
        {
            var dao = new CurrencyDao();
            ViewBag.CurrencyName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
    }
}