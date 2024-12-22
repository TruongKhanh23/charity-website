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
    public class RegulationDao
    {
        MaiAmTruyenTinDbContext db = null;
        public RegulationDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Regulation GetByID(long id)
        {
            return db.Regulations.Find(id);
        }
        public int Insert(Regulation entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Regulations.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Regulation ViewDetail(int id)
        {
            return db.Regulations.Find(id);
        }
        public bool Update(Regulation entity)
        {
            try
            {
                var regulation = db.Regulations.Find(entity.ID);
                regulation.Code = entity.Code;
                regulation.Name = entity.Name;
                regulation.MetaDescriptions = entity.MetaDescriptions;
                regulation.ModifiedDate = DateTime.Now;
                regulation.ModifiedBy = entity.ModifiedBy;
                regulation.Status = entity.Status;
                db.Entry(regulation).State = System.Data.Entity.EntityState.Modified;
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
                var regulation = db.Regulations.Find(id);
                db.Regulations.Remove(regulation);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<Regulation> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Regulation> model = db.Regulations;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Code.Contains(searchString) || x.MetaDescriptions.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Regulation> ListAll()
        {
            return db.Regulations.Where(x => x.Status == true).ToList();
        }
        public bool ChangeStatus(long id)
        {
            var regulation = db.Regulations.Find(id);
            regulation.Status = !regulation.Status;
            db.SaveChanges();
            return regulation.Status;
        }
    }
}
