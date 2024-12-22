using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class ProfessionalQualificationDao
    {
        MaiAmTruyenTinDbContext db = null;
        public ProfessionalQualificationDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(ProfessionalQualification professionalqualification)
        {
            db.ProfessionalQualifications.Add(professionalqualification);
            db.SaveChanges();
            return professionalqualification.ID;
        }
        public bool Update(ProfessionalQualification entity)
        {
            try
            {
                var professionalqualification = db.ProfessionalQualifications.Find(entity.ID);
                professionalqualification.ID = entity.ID;
                professionalqualification.Name = entity.Name;
                professionalqualification.CreatedBy = entity.CreatedBy;
                professionalqualification.CreatedDate = entity.CreatedDate;
                professionalqualification.ModifiedBy = entity.ModifiedBy;
                professionalqualification.ModifiedDate = DateTime.Now;
                professionalqualification.Status = entity.Status;
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
                var professionalqualification = db.ProfessionalQualifications.Find(id);
                db.ProfessionalQualifications.Remove(professionalqualification);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;.
            }
        }
        public ProfessionalQualification ViewDetail(int id)
        {
            return db.ProfessionalQualifications.Find(id);
        }
        public IEnumerable<ProfessionalQualification> ListAll()
        {
            return db.ProfessionalQualifications.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<ProfessionalQualification> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<ProfessionalQualification> model = db.ProfessionalQualifications;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public List<ProfessionalQualification> GetEducation(int count)
        {
            return db.ProfessionalQualifications.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }
        //public string ChangeStatus(long id)
        //{
        //    var professionalqualification = db.ProfessionalQualifications.Find(id);
        //    professionalqualification.Status = !professionalqualification.Status;
        //    db.SaveChanges();
        //    return professionalqualification.Status;
        //}
    }
}

