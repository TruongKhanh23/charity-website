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
    public class SchoolReportTypeDao
    {
        MaiAmTruyenTinDbContext db = null;
        public SchoolReportTypeDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(SchoolReportType category)
        {
            db.SchoolReportTypes.Add(category);
            db.SaveChanges();
            return category.ID;
        }
        public bool Update(SchoolReportType entity)
        {
            try
            {
                var schoolreporttype = db.SchoolReportTypes.Find(entity.ID);
                schoolreporttype.ID = entity.ID;
                schoolreporttype.Code = entity.Code;
                schoolreporttype.Name = entity.Name;
                schoolreporttype.ModifiedBy = entity.ModifiedBy;
                schoolreporttype.ModifiedDate = DateTime.Now;
                schoolreporttype.Status = entity.Status;
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
                var schoolreporttype = db.SchoolReportTypes.Find(id);
                db.SchoolReportTypes.Remove(schoolreporttype);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;.
            }
        }
        public SchoolReportType ViewDetail(int id)
        {
            return db.SchoolReportTypes.Find(id);
        }
        public IEnumerable<SchoolReportType> ListAll()
        {
            return db.SchoolReportTypes.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<SchoolReportType> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<SchoolReportType> model = db.SchoolReportTypes;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        //public string ChangeStatus(long id)
        //{
        //    var schoolreporttype = db.SchoolReportTypes.Find(id);
        //    schoolreporttype.Status = !schoolreporttype.Status;
        //    db.SaveChanges();
        //    return schoolreporttype.Status;
        //}
    }
}
