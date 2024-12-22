using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;
using Model.ViewModel;


namespace Model.DAO
{
    public class BankDao
    {
        MaiAmTruyenTinDbContext db = null;
        public BankDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Bank GetByID(long id)
        {
            return db.Banks.Find(id);
        }
        public int Insert(Bank entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Banks.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Bank ViewDetail(int id)
        {
            return db.Banks.Find(id);
        }
        public bool Update(Bank entity)
        {
            try
            {
                var bank = db.Banks.Find(entity.ID);
                bank.Name = entity.Name;
                bank.EnglishName = entity.EnglishName;
                bank.ShorcutName = entity.ShorcutName;
                bank.Website = entity.Website;
                bank.Address = entity.Address;
                bank.NationalName = entity.NationalName;
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
                var bank = db.Banks.Find(id);
                db.Banks.Remove(bank);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<Bank> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Bank> model = db.Banks;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public List<Bank> GetChildren(int count)
        {
            return db.Banks.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }
        public IEnumerable<Bank> ListAll()
        {
            return db.Banks.Where(x => x.Status == true).ToList();
        }
    }
}
