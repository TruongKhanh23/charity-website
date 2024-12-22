using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using System.Configuration;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Runtime.Remoting.Messaging;
using Model.ViewModel;

namespace Model.DAO
{
    public class SECategoryDao
    {
        MaiAmTruyenTinDbContext db = null;
        public SECategoryDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(SECategory category)
        {
            db.SECategories.Add(category);
            db.SaveChanges();
            return category.ID;
        }
        public bool Update(SECategory entity)
        {
            try
            {
                var secategory = db.SECategories.Find(entity.ID);
                secategory.ID = entity.ID;
                secategory.Code = entity.Code;
                secategory.Name = entity.Name;
                secategory.Description = entity.Description;
                secategory.ModifiedBy = entity.ModifiedBy;
                secategory.ModifiedDate = DateTime.Now;
                secategory.Status = entity.Status;
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
                var secategory = db.SECategories.Find(id);
                db.SECategories.Remove(secategory);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;.
            }
        }
        public SECategory ViewDetail(int id)
        {
            return db.SECategories.Find(id);
        }
        public IEnumerable<SECategory> ListAll()
        {
            return db.SECategories.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<SECategory> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<SECategory> model = db.SECategories;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        //public string ChangeStatus(long id)
        //{
        //    var secategory = db.SECategories.Find(id);
        //    secategory.Status = !secategory.Status;
        //    db.SaveChanges();
        //    return secategory.Status;
        //}
    }
}
