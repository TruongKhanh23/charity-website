using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;
using Model.ViewModel;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class ReceivePayAccountDao
    {
        MaiAmTruyenTinDbContext db = null;
        public ReceivePayAccountDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public ReceivePayAccount GetByID(long id)
        {
            return db.ReceivePayAccounts.Find(id);
        }
        public IEnumerable<ReceivePayAccount> ListAll()
        {
            return db.ReceivePayAccounts.Where(x => x.Status == true).ToList();
        }
        public int Insert(ReceivePayAccount entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.ReceivePayAccounts.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public ReceivePayAccount ViewDetail(int id)
        {
            return db.ReceivePayAccounts.Find(id);
        }
        public bool Update(ReceivePayAccount entity)
        {
            try
            {
                var receivepay = db.ReceivePayAccounts.Find(entity.ID);
                receivepay.Code = entity.Code;
                receivepay.Name = entity.Name;
                receivepay.CurrencyID = entity.CurrencyID;
                receivepay.Original = entity.Original;
                receivepay.Note = entity.Note;
                receivepay.ModifiedDate = DateTime.Now;
                receivepay.ModifiedBy = entity.ModifiedBy;
                receivepay.Status = entity.Status;
                db.Entry(receivepay).State = System.Data.Entity.EntityState.Modified;
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
                var receivepay = db.ReceivePayAccounts.Find(id);
                db.ReceivePayAccounts.Remove(receivepay);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<ReceivePayAccountViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            //IQueryable<ContentViewModel> model = db.Contents;
            var model = from a in db.ReceivePayAccounts
                        join b in db.Currencies on a.CurrencyID equals b.ID
                        select new ReceivePayAccountViewModel()
                        {
                            ID = a.ID,
                            Code = a.Code,
                            Name = a.Name,
                            CurrencyName = b.Name,
                            Original = a.Original,
                            Note = a.Note,
                            CreatedDate = a.CreatedDate,
                            CreatedBy = a.CreatedBy,
                            ModifiedDate = a.ModifiedDate,
                            ModifiedBy = a.ModifiedBy,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.CurrencyName.Contains(searchString)
                || x.ModifiedBy.Contains(searchString) || x.CreatedBy.Contains(searchString) || x.Note.Contains(searchString));
            }
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        //Tính tổng tiền ban đầu, tổng thu chi của tất cả quỹ tài khoản
        public ReceivePayAccountViewModel FinancialPosition()
        {
            var model = new ReceivePayAccountViewModel();
            SqlConnection connection = new SqlConnection("data source=DESKTOP-55F5CKQ;initial catalog=MaiAmBaoTroXaHoi;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework");
            using (connection)
            {
                //SqlCommand cmdReceivedTotal = new SqlCommand("SELECT SUM(CAST(Receipt.Amount AS MONEY)) FROM Receipt", connection);
                SqlCommand cmdReceivedTotal = new SqlCommand("SELECT SUM(Receipt.Amount) FROM Receipt", connection);
                connection.Open();
                SqlDataReader rdReceivedTotal = cmdReceivedTotal.ExecuteReader();
                if (rdReceivedTotal.HasRows)
                {
                    while (rdReceivedTotal.Read())
                    {
                        model.ReceivedTotal = rdReceivedTotal.IsDBNull(0) ? 0 : rdReceivedTotal.GetDecimal(0);
                    }
                }
                else { }
                rdReceivedTotal.Close();
                connection.Close();

                //SqlCommand cmdPayedTotal = new SqlCommand("SELECT SUM(CAST(Payment.Amount AS MONEY)) FROM Payment", connection);
                SqlCommand cmdPayedTotal = new SqlCommand("SELECT SUM(Payment.Amount) FROM Payment", connection);
                connection.Open();
                SqlDataReader rdPayedTotal = cmdPayedTotal.ExecuteReader();
                if (rdPayedTotal.HasRows)
                {
                    while (rdPayedTotal.Read())
                    {
                        model.PayedTotal = rdPayedTotal.IsDBNull(0) ? 0 : rdPayedTotal.GetDecimal(0);
                    }
                }
                else { }
                rdPayedTotal.Close();
                connection.Close();

                //SqlCommand cmdOriginalTotal = new SqlCommand("SELECT SUM(CAST(ReceivePayAccount.Original AS MONEY)) FROM ReceivePayAccount", connection);
                SqlCommand cmdOriginalTotal = new SqlCommand("SELECT SUM(ReceivePayAccount.Original) FROM ReceivePayAccount", connection);
                connection.Open();
                SqlDataReader rdOriginalTotal = cmdOriginalTotal.ExecuteReader();
                if (rdOriginalTotal.HasRows)
                {
                    while (rdOriginalTotal.Read())
                    {
                        model.OriginalTotal = rdOriginalTotal.IsDBNull(0) ? 0 : rdOriginalTotal.GetDecimal(0);
                    }
                }
                else { }
                rdOriginalTotal.Close();
                connection.Close();
            }
            return model;
        }
        // Tính tổng thu chi theo ID của quỹ tài khoản 
        public ReceivePayAccountViewModel GetSumReceivePayByAccountID(int id)
        {
            var model1 = new ReceivePayAccountViewModel();
            SqlConnection connection = new SqlConnection("data source=DESKTOP-55F5CKQ;initial catalog=MaiAmBaoTroXaHoi;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework");
            using (connection)
            {
                SqlCommand cmdReceivedTotal = new SqlCommand("SELECT SUM(CAST(Receipt.Amount AS MONEY)) FROM ReceivePayAccount, Receipt WHERE Receipt.ReceivePayAccountID = ReceivePayAccount.ID AND ReceivePayAccount.ID = " + id, connection);
                connection.Open();
                SqlDataReader rdReceivedTotal = cmdReceivedTotal.ExecuteReader();
                if (rdReceivedTotal.HasRows) { while (rdReceivedTotal.Read()) { model1.ReceivedTotal = rdReceivedTotal.IsDBNull(0) ? 0 : rdReceivedTotal.GetDecimal(0); } }
                rdReceivedTotal.Close();
                connection.Close();

                SqlCommand cmdPayedTotal = new SqlCommand("SELECT SUM(CAST(Payment.Amount AS MONEY)) FROM ReceivePayAccount, Payment WHERE Payment.ReceivePayAccountID = ReceivePayAccount.ID AND ReceivePayAccount.ID = " + id, connection);
                connection.Open();
                SqlDataReader rdPayedTotal = cmdPayedTotal.ExecuteReader();
                if (rdPayedTotal.HasRows) { while (rdPayedTotal.Read()) { model1.PayedTotal = rdPayedTotal.IsDBNull(0) ? 0 : rdPayedTotal.GetDecimal(0); } }
                rdPayedTotal.Close();
                connection.Close();
            }
            return model1;
        }
    }
}
