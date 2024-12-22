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
    public class HealthInsuranceDao
    {
        MaiAmTruyenTinDbContext db = null;
        public HealthInsuranceDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public HealthInsurance GetByID(long id)
        {
            return db.HealthInsurances.Find(id);
        }
        public int Insert(HealthInsurance entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.HealthInsurances.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public HealthInsurance ViewDetail(int id)
        {
            return db.HealthInsurances.Find(id);
        }
        public int GetHealthID(int id)
        {
            int healthID = db.HealthInsurances.Where(x => x.ChildrenID == id).FirstOrDefault().ID;
            return healthID;
        }
        public string GetHealthInsuranceNo(int id)
        {
            var model = new HealthInsuranceDao().GetHealthInsuranceInfo(id, 1, 1);
            string result = "";
            if (model.Count() > 0)
            {
                result = model.FirstOrDefault().No;
            }
            else
            {
                result = "Chưa có dữ liệu";
            }
            return result;
        }
        public bool Update(HealthInsurance entity)
        {
            try
            {
                var children = db.HealthInsurances.Find(entity.ID);
                children.ChildrenID = entity.ChildrenID;
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
                var children = db.HealthInsurances.Find(id);
                db.HealthInsurances.Remove(children);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<HealthInsuranceViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.HealthInsurances
                        join b in db.Children
                        on a.ChildrenID equals b.ID
                        select new HealthInsuranceViewModel()
                        {
                            ID = a.ID,
                            ChildrenID = a.ChildrenID,
                            Name = b.FullName,
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
                model = model.Where(x => x.Name.Contains(searchString) || x.No.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<HealthInsuranceViewModel> GetHealthInsuranceInfo(int id, int page, int pageSize)
        {
            var model = from a in db.HealthInsurances
                        join b in db.Children
                        on a.ChildrenID equals b.ID
                        select new HealthInsuranceViewModel()
                        {
                            ID = a.ID,
                            No = a.No,
                            ChildrenID = b.ID
                        };
            model = model.Where(x => x.ChildrenID.Equals(id));
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        public IEnumerable<HealthInsurance> ListAll()
        {
            return db.HealthInsurances.Where(x => x.Status == true).ToList();
        }
        //public IEnumerable<HealthInsurance> ListAll()
        //{
        //    return db.HealthInsurances.Where(x => x.Status == true).ToList();
        //}
        public List<HealthInsurance> ListNewQuote(int top)
        {
            return db.HealthInsurances.OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }
        //public string ChangeStatus(long id)
        //{
        //    var children = db.HealthInsurances.Find(id);
        //    children.Status = !children.Status;
        //    db.SaveChanges();
        //    return children.Status;
        //}
        public List<HealthInsurance> GetChildren(int count)
        {
            return db.HealthInsurances.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }

    }
}
