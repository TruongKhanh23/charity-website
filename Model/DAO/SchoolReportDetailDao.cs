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
using System.Runtime.CompilerServices;

namespace Model.DAO
{
    public class SchoolReportDetailDao
    {
        MaiAmTruyenTinDbContext db = null;
        public SchoolReportDetailDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public SchoolReportDetail GetByID(long id)
        {
            return db.SchoolReportDetails.Find(id);
        }
        public IEnumerable<SchoolReportDetail> ListAll()
        {
            return db.SchoolReportDetails.Where(x => x.Status == true).ToList();
        }
        public int Insert(SchoolReportDetail entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.SchoolReportDetails.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public SchoolReportDetail ViewDetail(int id)
        {
            return db.SchoolReportDetails.Find(id);
        }
        public bool Update(SchoolReportDetail entity)
        {
            try
            {
                var schoolreportdetail = db.SchoolReportDetails.Find(entity.ID);
                schoolreportdetail.SchoolReportID = entity.SchoolReportID;
                schoolreportdetail.SchoolName = entity.SchoolName;
                schoolreportdetail.SchoolYear = entity.SchoolYear;
                schoolreportdetail.TeacherName = entity.TeacherName;
                schoolreportdetail.Semester1 = entity.Semester1;
                schoolreportdetail.Semester2 = entity.Semester2;
                schoolreportdetail.FullYear = entity.FullYear;
                schoolreportdetail.Rating = entity.Rating;
                schoolreportdetail.TeacherEvaluation = entity.TeacherEvaluation;
                schoolreportdetail.Image = entity.Image;
                schoolreportdetail.MetaDescriptions = entity.MetaDescriptions;
                schoolreportdetail.ModifiedDate = DateTime.Now;
                schoolreportdetail.ModifiedBy = entity.ModifiedBy;
                schoolreportdetail.Status = entity.Status;
                db.Entry(schoolreportdetail).State = System.Data.Entity.EntityState.Modified;
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
                var schoolreportdetail = db.SchoolReportDetails.Find(id);
                db.SchoolReportDetails.Remove(schoolreportdetail);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<SchoolReportDetailViewModel> ListAllCategory(int schoolReportID, int page, int pageSize)
        {
            //IQueryable<ContentViewModel> model = db.Contents;
            var model = from a in db.SchoolReportDetails
                        join b in db.SchoolReports on a.SchoolReportID equals b.ID into Table1
                        from b in Table1.ToList()
                        join c in db.Children on b.ChildrenID equals c.ID into Table2
                        from c in Table2.ToList()
                        join d in db.SchoolReportTypes on b.Type equals d.ID into Table3
                        from d in Table3.ToList()
                        select new SchoolReportDetailViewModel()
                        {
                            ID = a.ID,
                            FullName = c.FullName,
                            SchoolReportID = b.ID,
                            SchoolReportCode = b.Code,
                            SchoolYear = a.SchoolYear,
                            SchoolName = a.SchoolName,
                            FullYear = a.FullYear,
                            Rating = a.Rating,
                            SchoolReportTypeName = d.Name,
                            CreatedBy = a.CreatedBy,
                            ModifiedBy = a.ModifiedBy
                        };
            model = model.Where(x => x.SchoolReportID.Equals(schoolReportID));
            return model.OrderByDescending(x => x.Rating).ToPagedList(page, pageSize);
        }
        public IEnumerable<SchoolReportDetailViewModel> ListAllSchoolReportDetails(int id, int page, int pageSize)
        {
            var model = from a in db.Children
                        join b in db.SchoolReports on a.ID equals b.ChildrenID into Table1
                        from b in Table1.ToList()
                        join c in db.SchoolReportDetails on b.ID equals c.SchoolReportID into Table2
                        from c in Table2.ToList()
                        select new SchoolReportDetailViewModel()
                        {
                            ID = c.ID,
                            ChildrenID = a.ID,
                            SchoolYear = c.SchoolYear,
                            FullYear = c.FullYear,
                            Image = c.Image

                        };
            model = model.Where(x => x.ChildrenID.Equals(id));
            return model.OrderBy(x => x.ID).ToPagedList(page, pageSize);
        }
        public List<SchoolReportDetail> GetSchoolReports(int count)
        {
            return db.SchoolReportDetails.OrderByDescending(a => a.Rating).Take(count).ToList();
        }
    }
}
