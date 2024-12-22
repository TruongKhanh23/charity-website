using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class MajorDao
    {
        MaiAmTruyenTinDbContext db = null;
        public MajorDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(Major major)
        {
            db.Majors.Add(major);
            db.SaveChanges();
            return major.ID;
        }
        public bool Update(Major entity)
        {
            try
            {
                var major = db.Majors.Find(entity.ID);
                major.ID = entity.ID;
                major.Name = entity.Name;
                major.CreatedBy = entity.CreatedBy;
                major.CreatedDate = entity.CreatedDate;
                major.ModifiedBy = entity.ModifiedBy;
                major.ModifiedDate = DateTime.Now;
                major.Status = entity.Status;
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
                var major = db.Majors.Find(id);
                db.Majors.Remove(major);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;.
            }
        }
        public Major ViewDetail(int id)
        {
            return db.Majors.Find(id);
        }
        public IEnumerable<Major> ListAll()
        {
            return db.Majors.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<Major> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Major> model = db.Majors;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public List<Major> GetEducation(int count)
        {
            return db.Majors.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }
        //public string ChangeStatus(long id)
        //{
        //    var major = db.Majors.Find(id);
        //    major.Status = !major.Status;
        //    db.SaveChanges();
        //    return major.Status;
        //}
    }
}
