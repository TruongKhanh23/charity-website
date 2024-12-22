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
    public class QuoteDao
    {
        MaiAmTruyenTinDbContext db = null;
        public QuoteDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Quote GetByID(long id)
        {
            return db.Quotes.Find(id);
        }
        public int Insert(Quote entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Quotes.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Quote ViewDetail(int id)
        {
            return db.Quotes.Find(id);
        }
        public bool Update(Quote entity)
        {
            try
            {
                var quote = db.Quotes.Find(entity.ID);
                quote.Code = entity.Code;
                quote.Name = entity.Name;
                quote.Quote1 = entity.Quote1;
                quote.ModifiedDate = DateTime.Now;
                quote.ModifiedBy = entity.ModifiedBy;
                quote.Image = entity.Image;
                quote.Status = entity.Status;
                db.Entry(quote).State = System.Data.Entity.EntityState.Modified;
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
                var quote = db.Quotes.Find(id);
                db.Quotes.Remove(quote);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<Quote> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Quote> model = db.Quotes;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Code.Contains(searchString) || x.Quote1.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Quote> ListAllPagingChildren(string searchString, string childrenName, int page, int pageSize)
        {
            IQueryable<Quote> model = db.Quotes;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Code.Contains(searchString) || x.Quote1.Contains(searchString));
            }
            model = model.Where(x => x.CreatedBy.Equals(childrenName));
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Quote> ListAll()
        {
            return db.Quotes.Where(x => x.Status == true).OrderByDescending(x => x.CreatedDate).Take(6).ToList();
        }
        public bool ChangeStatus(long id)
        {
            var quote = db.Quotes.Find(id);
            quote.Status = !quote.Status;
            db.SaveChanges();
            return quote.Status;
        }
    }
}
