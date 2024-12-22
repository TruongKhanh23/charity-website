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

namespace Model.DAO
{
    public class SocialInsuranceDao
    {
        MaiAmTruyenTinDbContext db = null;
        public SocialInsuranceDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public SocialInsurance GetByID(long id)
        {
            return db.SocialInsurances.Find(id);
        }
        public int Insert(SocialInsurance entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.SocialInsurances.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public SocialInsurance ViewDetail(int id)
        {
            return db.SocialInsurances.Find(id);
        }
        public bool Update(SocialInsurance entity)
        {
            try
            {
                var children = db.SocialInsurances.Find(entity.ID);
                children.EmployeeID = entity.EmployeeID;
                children.No = entity.No;
                children.RegisteredHospital = entity.RegisteredHospital;
                children.BoughtDate = entity.BoughtDate;
                children.EndDate = entity.EndDate;
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
                var children = db.SocialInsurances.Find(id);
                db.SocialInsurances.Remove(children);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<SocialInsuranceViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.SocialInsurances
                        join b in db.Employees
                        on a.EmployeeID equals b.ID
                        select new SocialInsuranceViewModel()
                        {
                            ID = a.ID,
                            EmployeeID = a.EmployeeID,
                            EmployeeName = b.Name,
                            No = a.No,
                            RegisteredHospital = a.RegisteredHospital,
                            BoughtDate = a.BoughtDate,
                            EndDate = a.EndDate,
                            CreatedDate = a.CreatedDate,
                            CreatedBy = a.CreatedBy,
                            ModifiedBy = a.ModifiedBy,
                            ModifiedDate = a.ModifiedDate,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.EmployeeName.Contains(searchString) || x.No.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<SocialInsuranceViewModel> GetSocialInsuranceInfo(int id, int page, int pageSize)
        {
            var model = from a in db.SocialInsurances
                        join b in db.Employees
                        on a.EmployeeID equals b.ID
                        select new SocialInsuranceViewModel()
                        {
                            ID = a.ID,
                            EmployeeID = b.ID,
                            No = a.No,
                            RegisteredHospital = a.RegisteredHospital,
                            BoughtDate = a.BoughtDate,
                            EndDate = a.EndDate,
                            CreatedBy = a.CreatedBy,
                            CreatedDate = a.CreatedDate,
                            ModifiedBy = a.ModifiedBy,
                            ModifiedDate = a.ModifiedDate
                        };
            model = model.Where(x => x.EmployeeID.Equals(id));
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<SocialInsurance> ListAll()
        {
            return db.SocialInsurances.Where(x => x.Status == true).ToList();
        }
        //public IEnumerable<SocialInsurance> ListAll()
        //{
        //    return db.SocialInsurances.Where(x => x.Status == true).ToList();
        //}
        public List<SocialInsurance> ListNewQuote(int top)
        {
            return db.SocialInsurances.OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }
        //public string ChangeStatus(long id)
        //{
        //    var children = db.SocialInsurances.Find(id);
        //    children.Status = !children.Status;
        //    db.SaveChanges();
        //    return children.Status;
        //}
        public List<SocialInsurance> GetChildren(int count)
        {
            return db.SocialInsurances.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }

    }
}
