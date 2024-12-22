using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class ReceivePayObjectCategoryDao
    {
        MaiAmTruyenTinDbContext db = null;
        public ReceivePayObjectCategoryDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(ReceivePayObjectCategory category)
        {
            db.ReceivePayObjectCategories.Add(category);
            db.SaveChanges();
            return category.ID;
        }
        public bool Update(ReceivePayObjectCategory entity)
        {
            try
            {
                var category = db.ReceivePayObjectCategories.Find(entity.ID);
                category.ID = entity.ID;
                category.Code = entity.Code;
                category.Name = entity.Name;
                category.CreatedBy = entity.CreatedBy;
                category.CreatedDate = entity.CreatedDate;
                category.ModifiedBy = entity.ModifiedBy;
                category.ModifiedDate = DateTime.Now;
                category.Status = entity.Status;
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
                var category = db.ReceivePayObjectCategories.Find(id);
                db.ReceivePayObjectCategories.Remove(category);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;.
            }
        }
        public ReceivePayObjectCategory ViewDetail(int id)
        {
            return db.ReceivePayObjectCategories.Find(id);
        }
        public IEnumerable<ReceivePayObjectCategory> ListAll()
        {
            return db.ReceivePayObjectCategories.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<ReceivePayObjectCategory> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<ReceivePayObjectCategory> model = db.ReceivePayObjectCategories;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

    }
}
