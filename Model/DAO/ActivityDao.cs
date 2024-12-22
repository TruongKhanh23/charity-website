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
    public class ActivityDao
    {
        MaiAmTruyenTinDbContext db = null;
        public ActivityDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Activity GetByID(long id)
        {
            return db.Activities.Find(id);
        }
        public int Insert(Activity entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Activities.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Activity ViewDetail(int id)
        {
            return db.Activities.Find(id);
        }
        public bool Update(Activity entity)
        {
            try
            {
                var Activity = db.Activities.Find(entity.ID);
                Activity.Name = entity.Name;
                Activity.MetaTitle = entity.MetaTitle;
                Activity.Description = entity.Description;
                Activity.Image = entity.Image;
                Activity.Details = entity.Details;
                Activity.CreatedDate = DateTime.Now;
                Activity.CreatedBy = entity.CreatedBy;
                Activity.ModifiedDate = DateTime.Now;
                Activity.ModifiedBy = entity.ModifiedBy;
                Activity.Status = entity.Status;
                db.Entry(Activity).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }
        }
        public bool UpdateAbout(About about)
        {
            try
            {
                var aboutEdit = db.Abouts.Find(about.ID);
                aboutEdit.BigTitleLine1 = about.BigTitleLine1;
                aboutEdit.BigTitleLine2 = about.BigTitleLine2;
                aboutEdit.Description = about.Description;
                aboutEdit.Slogan = about.Slogan;
                aboutEdit.Introduce = about.Introduce;
                aboutEdit.BankingNumber = about.BankingNumber;
                aboutEdit.BankBranch = about.Slogan;
                aboutEdit.AccountHolder = about.AccountHolder;
                aboutEdit.Email = about.Email;
                db.Entry(aboutEdit).State = System.Data.Entity.EntityState.Modified;
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
                var Activity = db.Activities.Find(id);
                db.Activities.Remove(Activity);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<Activity> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Activity> model = db.Activities;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Description.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Activity> ListAll()
        {
            return db.Activities.Where(x => x.Status == true).ToList();
        }
        public List<Activity> GetActivity(int count)
        {
            return db.Activities.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }
        public bool ChangeStatus(long id)
        {
            var Activity = db.Activities.Find(id);
            Activity.Status = !Activity.Status;
            db.SaveChanges();
            return Activity.Status;
        }
    }
}
