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
    public class XFamilyBookDao
    {
        MaiAmTruyenTinDbContext db = null;
        public XFamilyBookDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public XFamilyBook GetByID(long id)
        {
            return db.XFamilyBooks.Find(id);
        }
        public int Insert(XFamilyBook entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.XFamilyBooks.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public XFamilyBook ViewDetail(int id)
        {
            return db.XFamilyBooks.Find(id);
        }
        public bool Update(XFamilyBook entity)
        {
            try
            {
                var children = db.XFamilyBooks.Find(entity.ID);
                children.Code = entity.Code;
                children.ChildrenID = entity.ChildrenID;
                children.BaptismalName = entity.BaptismalName;
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
                var children = db.XFamilyBooks.Find(id);
                db.XFamilyBooks.Remove(children);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<XFamilyBookViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.XFamilyBooks
                        join b in db.Children
                        on a.ChildrenID equals b.ID
                        select new XFamilyBookViewModel()
                        {
                            ID = a.ID,
                            ChildrenName = b.FullName,
                            Code = a.Code,
                            BaptismalName = a.BaptismalName,
                            CreatedDate = a.CreatedDate,
                            CreatedBy = a.CreatedBy,
                            ModifiedBy = a.ModifiedBy,
                            ModifiedDate = a.ModifiedDate,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ChildrenName.Contains(searchString) || x.BaptismalName.Contains(searchString) || x.Code.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<XFamilyBookViewModel> GetXFmailyBookInfo(int id, int page, int pageSize)
        {
            var model = from a in db.XFamilyBooks
                        join b in db.Children
                        on a.ChildrenID equals b.ID
                        select new XFamilyBookViewModel()
                        {
                            ID = a.ID,
                            Code = a.Code,
                            ChildrenID = b.ID
                        };
            model = model.Where(x => x.ChildrenID.Equals(id));
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public IEnumerable<XFamilyBook> ListAll()
        {
            return db.XFamilyBooks.Where(x => x.Status == true).ToList();
        }
    }
}
