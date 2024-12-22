using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;
using Model.ViewModel;

namespace Model.DAO
{
    public class CurrencyDao
    {
        MaiAmTruyenTinDbContext db = null;
        public CurrencyDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Currency GetByID(long id)
        {
            return db.Currencies.Find(id);
        }
        public int Insert(Currency entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Currencies.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Currency ViewDetail(int id)
        {
            return db.Currencies.Find(id);
        }
        public bool Update(Currency entity)
        {
            try
            {
                var bank = db.Currencies.Find(entity.ID);
                bank.Code = entity.Code;
                bank.Name = entity.Name;
                bank.NameInternational = entity.NameInternational;
                bank.Symbol = entity.Symbol;
                bank.ModifiedDate = DateTime.Now;
                bank.ModifiedBy = entity.ModifiedBy;
                bank.Status = entity.Status;
                db.Entry(bank).State = System.Data.Entity.EntityState.Modified;
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
                var bank = db.Currencies.Find(id);
                db.Currencies.Remove(bank);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<Currency> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Currency> model = db.Currencies;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public List<Currency> GetChildren(int count)
        {
            return db.Currencies.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }
        public IEnumerable<Currency> ListAll()
        {
            return db.Currencies.Where(x => x.Status == true).ToList();
        }
    }
}
