using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;
using Model.ViewModel;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class ReceiptDao
    {
        MaiAmTruyenTinDbContext db = null;
        public ReceiptDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Receipt GetByID(long id)
        {
            return db.Receipts.Find(id);
        }
        public IEnumerable<Receipt> ListAll()
        {
            return db.Receipts.Where(x => x.Status == true).ToList();
        }
        public int Insert(Receipt entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Receipts.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Receipt ViewDetail(int id)
        {
            return db.Receipts.Find(id);
        }
        public bool Update(Receipt entity)
        {
            try
            {
                var receipt = db.Receipts.Find(entity.ID);
                receipt.ReceivePayAccountID = entity.ReceivePayAccountID;
                receipt.Date = entity.Date;
                receipt.ReceivePayID = entity.ReceivePayID;
                receipt.Amount = entity.Amount;
                receipt.AmountText = entity.AmountText;
                receipt.Code = entity.Code;
                receipt.ReceivePayObjectID = entity.ReceivePayObjectID;
                receipt.Phone = entity.Phone;
                receipt.IDNo = entity.IDNo;
                receipt.DateOfIssue = entity.DateOfIssue;
                receipt.PlaceOfIssue = entity.PlaceOfIssue;
                receipt.AccountNo = entity.AccountNo;
                receipt.AtBank = entity.AtBank;
                receipt.FinancialPaper = entity.FinancialPaper;
                receipt.Note = entity.Note;
                receipt.Address = entity.Address;
                receipt.ModifiedDate = DateTime.Now;
                receipt.ModifiedBy = entity.ModifiedBy;
                receipt.Status = entity.Status;
                db.Entry(receipt).State = System.Data.Entity.EntityState.Modified;
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
                var receipt = db.Receipts.Find(id);
                db.Receipts.Remove(receipt);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<ReceiptViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.Receipts
                        join b in db.ReceivePays on a.ReceivePayID equals b.ID into Table1
                        from b in Table1.ToList()
                        join c in db.ReceivePayAccounts on a.ReceivePayAccountID equals c.ID into Table2
                        from c in Table2.ToList()
                        join d in db.ReceivePayObjects on a.ReceivePayObjectID equals d.ID into Table3
                        from d in Table3.ToList()
                        select new ReceiptViewModel()
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
                SqlCommand cmdMaxID = new SqlCommand("SELECT MAX(Receipt.ID) FROM Receipt", connection);
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
