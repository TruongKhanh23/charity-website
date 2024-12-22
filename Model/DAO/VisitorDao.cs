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
    public class VisitorDao
    {
        MaiAmTruyenTinDbContext db = null;
        public VisitorDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(Visitor entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Visitors.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public IEnumerable<Visitor> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Visitor> model = db.Visitors;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.VisitReason.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        public bool Delete(int id)
        {
            try
            {
                var visitor = db.Visitors.Find(id);
                db.Visitors.Remove(visitor);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
    }
}
