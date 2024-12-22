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
    public class ChildrenDao
    {
        MaiAmTruyenTinDbContext db = null;
        public ChildrenDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Children GetByID(long id)
        {
            return db.Children.Find(id);
        }
        public int Insert(Children entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Children.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Children ViewDetail(int id)
        {
            return db.Children.Find(id);
        }

        public bool Update(Children entity)
        {
            try
            {
                var children = db.Children.Find(entity.ID);
                children.Code = entity.Code;
                children.IdentityCard = entity.IdentityCard;
                children.Successive = entity.Successive;
                children.FullName = entity.FullName;
                children.FoodExpenses = entity.FoodExpenses;
                children.EducationExpenses = entity.EducationExpenses;
                children.StartLiveDate = entity.StartLiveDate;
                children.DateOfBirth = entity.DateOfBirth;
                children.PlaceOfBirth = entity.PlaceOfBirth;
                children.Gender = entity.Gender;
                children.Ethnic = entity.Ethnic;
                children.Image = entity.Image;
                children.BirthCertificate = entity.BirthCertificate;
                children.HkType = entity.HkType;
                children.HKImage = entity.HKImage;
                children.Confirmation = entity.Confirmation;
                children.EnrollReason = entity.EnrollReason;
                children.Date = entity.Date;
                children.CategoryID = entity.CategoryID;
                children.ProfessionalQualificationID = entity.ProfessionalQualificationID;
                children.MajorID = entity.MajorID;
                children.EducationID = entity.EducationID;
                children.MetaDescriptions = entity.MetaDescriptions;
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
                var children = db.Children.Find(id);
                db.Children.Remove(children);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<ChildrenViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            //IQueryable<ContentViewModel> model = db.Contents;
            var model = from a in db.Children
                        join b in db.ChildrenCategories
                        on a.CategoryID equals b.ID
                        select new ChildrenViewModel()
                        {
                            ID = a.ID,
                            Code = a.Code,
                            Image = a.Image,
                            CateName = b.Name,
                            CateID = b.ID,
                            CreatedDate = a.CreatedDate,
                            Status = a.Status,
                            ModifiedDate = a.ModifiedDate,
                            FullName = a.FullName
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.FullName.Contains(searchString) || x.CateName.Contains(searchString)
                || x.Code.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        //public IEnumerable<Children> ListAllPaging(string searchString, int page, int pageSize)
        //{
        //    IQueryable<Children> model = db.Children;
        //    if (!string.IsNullOrEmpty(searchString))
        //    {
        //        model = model.Where(x => x.Name.Contains(searchString) || x.Metatitle.Contains(searchString));
        //    }
        //    return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        //}
        //public string ChangeStatus(long id)
        //{
        //    var children = db.Children.Find(id);
        //    children.Status = !children.Status;
        //    db.SaveChanges();
        //    return children.Status;
        //}
        public IEnumerable<Children> ListAll()
        {
            return db.Children.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<ChildrenViewModel> ListChildrenHasNotInsurance()
        {
            //Get list children have had joined to this event
            List<int> lstChildID = new List<int>();
            lstChildID = db.HealthInsurances.Select(s => s.ChildrenID).ToList();
            //Get list children have not joined to this event by !Contains child.ID
            var lst = from child in db.Children
                      where !lstChildID.Contains(child.ID)
                      select new ChildrenViewModel()
                      {
                          ID = child.ID,
                          FullName = child.FullName
                      };
            IEnumerable<ChildrenViewModel> lstChild = lst.OrderByDescending(x => x.ID).ToList();
            return lstChild;
        }
        public List<Children> GetChildren(int count)
        {
            return db.Children.OrderByDescending(a => a.DateOfBirth).Take(count).ToList();
        }
    }
}
