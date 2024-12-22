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
    public class SchoolReportDao
    {
        MaiAmTruyenTinDbContext db = null;
        public SchoolReportDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public SchoolReport GetByID(long id)
        {
            return db.SchoolReports.Find(id);
        }
        public int Insert(SchoolReport entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.SchoolReports.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public SchoolReport ViewDetail(int id)
        {
            return db.SchoolReports.Find(id);
        }
        public bool Update(SchoolReport entity)
        {
            try
            {
                var children = db.SchoolReports.Find(entity.ID);
                children.Code = entity.Code;
                children.ChildrenID = entity.ChildrenID;
                children.Type = entity.Type;
                children.ModifiedDate = DateTime.Now;
                children.ModifiedBy = entity.ModifiedBy;
                children.Status = entity.Status;
                db.Entry(children).State = System.Data.Entity.EntityState.Modified;
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
                var children = db.SchoolReports.Find(id);
                db.SchoolReports.Remove(children);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<SchoolReportViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.SchoolReports
                        join b in db.SchoolReportTypes on a.Type equals b.ID into Table1
                        from b in Table1.ToList()
                        join c in db.Children on a.ChildrenID equals c.ID into Table2
                        from c in Table2.ToList()
                        select new SchoolReportViewModel()
                        {
                            ID = a.ID,
                            ChildrenID = c.ID,
                            ChildrenName = c.FullName,
                            SchoolReportCode = a.Code,
                            TypeName = b.Name,
                            CreatedBy = a.CreatedBy,
                            ModifiedBy = a.ModifiedBy,
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ChildrenName.Contains(searchString) || x.SchoolReportCode.Contains(searchString) || x.TypeName.Contains(searchString));
            }
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        public IEnumerable<SchoolReportViewModel> ListAllSchoolReport(int id, int page, int pageSize)
        {
            var model = from a in db.SchoolReports
                        join b in db.SchoolReportTypes on a.Type equals b.ID into Table1
                        from b in Table1.ToList()
                        join c in db.Children on a.ChildrenID equals c.ID into Table2
                        from c in Table2.ToList()
                        select new SchoolReportViewModel()
                        {
                            ID = a.ID,
                            ChildrenID = c.ID,
                            ChildrenName = c.FullName,
                            SchoolReportCode =  a.Code,
                            TypeName = b.Name,
                            CreatedBy = a.CreatedBy,
                            ModifiedBy = a.ModifiedBy,
                        };
            model = model.Where(x => x.ChildrenID.Equals(id));
            return model.OrderBy(x => x.ID).ToPagedList(page, pageSize);
        }
        public IEnumerable<SchoolReport> ListAll()
        {
            return db.SchoolReports.Where(x => x.Status == true).ToList();
        }

    }
}
