using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;
using Model.ViewModel;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class ReceivePayDao
    {
        MaiAmTruyenTinDbContext db = null;
        public ReceivePayDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public ReceivePay GetByID(long id)
        {
            return db.ReceivePays.Find(id);
        }
        public IEnumerable<ReceivePay> ListAllPaymentPay()
        {
            return db.ReceivePays.Where(x => x.Status == true && x.ReceivableIsTrue == false).ToList();
        }
        public IEnumerable<ReceivePay> ListAllReceiptPay()
        {
            return db.ReceivePays.Where(x => x.Status == true && x.ReceivableIsTrue == true).ToList();
        }

        public int Insert(ReceivePay entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.ReceivePays.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public ReceivePay ViewDetail(int id)
        {
            return db.ReceivePays.Find(id);
        }
        public bool Update(ReceivePay entity)
        {
            try
            {
                var receivepay = db.ReceivePays.Find(entity.ID);
                receivepay.Name = entity.Name;
                receivepay.ReceivableIsTrue = entity.ReceivableIsTrue;
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
                var receivepay = db.ReceivePays.Find(id);
                db.ReceivePays.Remove(receivepay);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<ReceivePay> ListAllPaging(string searchString, int page, int pageSize, bool Status)
        {
            IQueryable<ReceivePay> model = db.ReceivePays;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            model = model.Where(x => x.ReceivableIsTrue.Value.ToString().Contains(Status.ToString()));
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public bool ChangeStatus(long id)
        {
            var receivepay = db.ReceivePays.Find(id);
            receivepay.Status = !receivepay.Status;
            db.SaveChanges();
            return receivepay.Status;
        }
    }
}
