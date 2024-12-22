using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;
using Model.ViewModel;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class PaymentDao
    {
        MaiAmTruyenTinDbContext db = null;
        public PaymentDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Payment GetByID(long id)
        {
            return db.Payments.Find(id);
        }
        public IEnumerable<Payment> ListAll()
        {
            return db.Payments.Where(x => x.Status == true).ToList();
        }
        public int Insert(Payment entity)
        {
            //Tạo mới tham số đối tượng: entity
            db.Payments.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Payment ViewDetail(int id)
        {
            return db.Payments.Find(id);
        }
        public bool Update(Payment entity)
        {
            try
            {
                var payment = db.Payments.Find(entity.ID);
                payment.ReceivePayAccountID = entity.ReceivePayAccountID;
                payment.Date = entity.Date;
                payment.ReceivePayID = entity.ReceivePayID;
                payment.Amount = entity.Amount;
                payment.AmountText = entity.AmountText;
                payment.Code = entity.Code;
                payment.ReceivePayObjectID = entity.ReceivePayObjectID;
                payment.Phone = entity.Phone;
                payment.IDNo = entity.IDNo;
                payment.DateOfIssue = entity.DateOfIssue;
                payment.PlaceOfIssue = entity.PlaceOfIssue;
                payment.AccountNo = entity.AccountNo;
                payment.AtBank = entity.AtBank;
                payment.Note = entity.Note;
                payment.FinancialPaper = entity.FinancialPaper;
                payment.Reason = entity.Reason;
                payment.Address = entity.Address;
                payment.ModifiedDate = DateTime.Now;
                payment.ModifiedBy = entity.ModifiedBy;
                payment.Status = entity.Status;
                db.Entry(payment).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var payment = db.Payments.Find(id);
                db.Payments.Remove(payment);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public int CheckExistObject(string code)
        {
            var model = new Payment();
            SqlConnection connection = new SqlConnection("data source=DESKTOP-55F5CKQ;initial catalog=MaiAmBaoTroXaHoi;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework");
            using (connection)
            {
                //SqlCommand cmdReceivedTotal = new SqlCommand("SELECT SUM(CAST(Receipt.Amount AS MONEY)) FROM Receipt", connection);
                SqlCommand cmdObject = new SqlCommand("SELECT ReceivePayObject.ID FROM ReceivePayObject WHERE ReceivePayObject.Code = '" + code + "'", connection);
                connection.Open();
                SqlDataReader rdObject = cmdObject.ExecuteReader();
                if (rdObject.HasRows) { while (rdObject.Read()) { model.ReceivePayObjectID = rdObject.IsDBNull(0) ? 0 : rdObject.GetInt32(0); } } else { }
                rdObject.Close();
                connection.Close();
            }
            return model.ReceivePayObjectID;
        }
        public IEnumerable<PaymentViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            //IQueryable<ContentViewModel> model = db.Contents;
            var model = from a in db.Payments
                        join b in db.ReceivePays on a.ReceivePayID equals b.ID into Table1
                        from b in Table1.ToList()
                        join c in db.ReceivePayAccounts on a.ReceivePayAccountID equals c.ID into Table2
                        from c in Table2.ToList()
                        join d in db.ReceivePayObjects on a.ReceivePayObjectID equals d.ID into Table3
                        from d in Table3.ToList()
                        select new PaymentViewModel()
                        {
                            ID = a.ID,
                            ReceivePayAccountName = c.Name,
                            Date = a.Date,
                            ReceivePayName = b.Name,
                            Amount = a.Amount,
                            Code = a.Code,
                            ReceivePayObjectName = d.Name,
                            Address = a.Address,
                            CreatedDate = a.CreatedDate,
                            CreatedBy = a.CreatedBy,
                            ModifiedDate = a.ModifiedDate,
                            ModifiedBy = a.ModifiedBy,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ReceivePayAccountName.Contains(searchString) || x.ReceivePayName.Contains(searchString)
                || x.Code.Contains(searchString) || x.ReceivePayObjectName.Contains(searchString) || x.CreatedBy.Contains(searchString) || x.ModifiedBy.Contains(searchString));
            }
            return model.OrderByDescending(x => x.Date).ToPagedList(page, pageSize);
        }
        public int GetMaxID()
        {
            int MaxID = 0;
            SqlConnection connection = new SqlConnection("data source=DESKTOP-55F5CKQ;initial catalog=MaiAmBaoTroXaHoi;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework");
            using (connection)
            {
                SqlCommand cmdMaxID = new SqlCommand("SELECT MAX(Payment.ID) FROM Payment", connection);
                connection.Open();
                SqlDataReader rdMaxID = cmdMaxID.ExecuteReader();
                if (rdMaxID.HasRows) { while (rdMaxID.Read()) { MaxID = rdMaxID.IsDBNull(0) ? 0 : rdMaxID.GetInt32(0); } }
                rdMaxID.Close();
                connection.Close();
            }
            return MaxID;
        }
    }
}
