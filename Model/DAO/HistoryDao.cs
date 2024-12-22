using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using Model.ViewModel;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class HistoryDao
    {
        MaiAmTruyenTinDbContext db = null;
        public HistoryDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public History GetByID(long id)
        {
            return db.Histories.Find(id);
        }
        public int Insert(History entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Histories.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public History ViewDetail(int id)
        {
            return db.Histories.Find(id);
        }
        public bool Update(History entity)
        {
            try
            {
                var history = db.Histories.Find(entity.ID);
                history.Name = entity.Name;
                history.Description = entity.Description;
                history.ModifiedDate = DateTime.Now;
                history.ModifiedBy = entity.ModifiedBy;
                history.Status = entity.Status;
                db.Entry(history).State = System.Data.Entity.EntityState.Modified;
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
                var history = db.Histories.Find(id);
                db.Histories.Remove(history);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<History> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<History> model = db.Histories;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Description.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<History> ListAll()
        {
            return db.Histories.Where(x => x.Status == true).ToList();
        }
        public bool ChangeStatus(long id)
        {
            var history = db.Histories.Find(id);
            history.Status = !history.Status;
            db.SaveChanges();
            return history.Status;
        }
    }
}
