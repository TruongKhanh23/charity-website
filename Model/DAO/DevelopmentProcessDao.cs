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
    public class DevelopmentProcessDao
    {
        MaiAmTruyenTinDbContext db = null;
        public DevelopmentProcessDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(DevelopmentProcess developmentprocess)
        {
            db.DevelopmentProcesses.Add(developmentprocess);
            db.SaveChanges();
            return developmentprocess.ID;
        }
        public bool Update(DevelopmentProcess entity)
        {
            try
            {
                var developmentprocess = db.DevelopmentProcesses.Find(entity.ID);
                developmentprocess.ID = entity.ID;
                developmentprocess.ChildrenID = entity.ChildrenID;
                developmentprocess.Title = entity.Title;
                developmentprocess.MetaDescription = entity.MetaDescription;
                developmentprocess.Description = entity.Description;
                developmentprocess.Image = entity.Image;
                developmentprocess.Thumbnail = entity.Thumbnail;
                developmentprocess.ModifiedBy = entity.ModifiedBy;
                developmentprocess.ModifiedDate = DateTime.Now;
                developmentprocess.Status = entity.Status;
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
                var developmentprocess = db.DevelopmentProcesses.Find(id);
                db.DevelopmentProcesses.Remove(developmentprocess);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;.
            }
        }
        public DevelopmentProcess ViewDetail(int id)
        {
            return db.DevelopmentProcesses.Find(id);
        }
        public IEnumerable<DevelopmentProcessViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.DevelopmentProcesses
                        join b in db.Children
                        on a.ChildrenID equals b.ID
                        select new DevelopmentProcessViewModel()
                        {
                            ID = a.ID,
                            ChildrenID = a.ChildrenID,
                            Name = b.FullName,
                            Title = a.Title,
                            MetaDescription = a.MetaDescription,
                            Description = a.Description,
                            Image = a.Image,
                            Thumbnail = a.Description,
                            CreatedBy = a.CreatedBy,
                            CreatedDate = a.CreatedDate,
                            ModifiedDate = a.ModifiedDate,
                            ModifiedBy = a.ModifiedBy,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Title.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<DevelopmentProcess> ListAll()
        {
            return db.DevelopmentProcesses.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<DevelopmentProcess> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<DevelopmentProcess> model = db.DevelopmentProcesses;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Title.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public List<DevelopmentProcess> ListTop(int id)
        {
            List<DevelopmentProcess> lst = new List<DevelopmentProcess>();
            lst = db.DevelopmentProcesses.Where(s => s.ChildrenID == id).OrderByDescending(s => s.CreatedDate).ToList();
            return lst;
        }

        //public string ChangeStatus(long id)
        //{
        //    var developmentprocess = db.DevelopmentProcesses.Find(id);
        //    developmentprocess.Status = !developmentprocess.Status;
        //    db.SaveChanges();
        //    return developmentprocess.Status;
        //}
    }
}
