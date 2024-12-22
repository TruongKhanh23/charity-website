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
    public class YellowBookDao
    {
        MaiAmTruyenTinDbContext db = null;
        public YellowBookDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public YellowBook GetByID(long id)
        {
            return db.YellowBooks.Find(id);
        }
        public int Insert(YellowBook entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.YellowBooks.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public YellowBook ViewDetail(int id)
        {
            return db.YellowBooks.Find(id);
        }
        public bool Update(YellowBook entity)
        {
            try
            {
                var YellowBook = db.YellowBooks.Find(entity.ID);
                YellowBook.Date = entity.Date;
                YellowBook.GiverName = entity.GiverName;
                YellowBook.Phone = entity.Phone;
                YellowBook.Address = entity.Address;
                YellowBook.ReceiverName = entity.ReceiverName;
                YellowBook.ProductName1 = entity.ProductName1;
                YellowBook.Amount1 = entity.Amount1;
                YellowBook.Unit1 = entity.Unit1;
                YellowBook.Price1 = entity.Price1;
                YellowBook.ProductName2 = entity.ProductName2;
                YellowBook.Amount2 = entity.Amount2;
                YellowBook.Unit2 = entity.Unit2;
                YellowBook.Price2 = entity.Price2;
                YellowBook.ProductName3 = entity.ProductName3;
                YellowBook.Amount3 = entity.Amount3;
                YellowBook.Unit3 = entity.Unit3;
                YellowBook.Price3 = entity.Price3;
                YellowBook.TotalMoney = entity.TotalMoney;
                YellowBook.ModifiedDate = DateTime.Now;
                YellowBook.ModifiedBy = entity.ModifiedBy;
                YellowBook.Status = entity.Status;
                db.Entry(YellowBook).State = System.Data.Entity.EntityState.Modified;
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
                var YellowBook = db.YellowBooks.Find(id);
                db.YellowBooks.Remove(YellowBook);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<YellowBook> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<YellowBook> model = db.YellowBooks;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.GiverName.Contains(searchString) || x.ReceiverName.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<YellowBook> ListAll()
        {
            return db.YellowBooks.Where(x => x.Status == true).ToList();
        }
        public List<YellowBook> GetActivity(int count)
        {
            return db.YellowBooks.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }
        public bool ChangeStatus(long id)
        {
            var YellowBook = db.YellowBooks.Find(id);
            YellowBook.Status = !YellowBook.Status;
            db.SaveChanges();
            return YellowBook.Status;
        }
        public decimal GetSumMoney()
        {
            decimal totalMoney = 0;
            SqlConnection connection = new SqlConnection("data source=DESKTOP-55F5CKQ;initial catalog=MaiAmBaoTroXaHoi;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework");
            using (connection)
            {
                SqlCommand cmd = new SqlCommand("SELECT SUM(YellowBook.TotalMoney) FROM YellowBook", connection);
                connection.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows) { while (rd.Read()) { totalMoney = rd.IsDBNull(0) ? 0 : rd.GetDecimal(0); } }
                rd.Close();
                connection.Close();
            }
            return totalMoney;
        }
    }
}
