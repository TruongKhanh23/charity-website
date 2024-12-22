using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using System.Configuration;

namespace Model.DAO
{
    public class DishDao
    {
        MaiAmTruyenTinDbContext db = null;
        public DishDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(Dish entity)
        {
            //Tạo mới tham số người dùng: entity 
            db.Dishes.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(Dish entity)
        {
            try
            {
                var dish = db.Dishes.Find(entity.ID);
                dish.Name = entity.Name;
                dish.Material = entity.Material;
                dish.Nutrition = entity.Nutrition;
                dish.Note = entity.Note;
                dish.Type = entity.Type;
                dish.CreatedDate = entity.CreatedDate;
                dish.CreatedBy = entity.CreatedBy;
                dish.ModifiedDate = entity.ModifiedDate;
                dish.ModifiedBy = entity.ModifiedBy;
                dish.Status = entity.Status;
                db.Entry(dish).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }
        }
        public IEnumerable<Dish> ListByType(string typeDish)
        {
            return db.Dishes.Where(x => x.Status == true && x.Type == typeDish).ToList();
        }
        public IEnumerable<Dish> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Dish> model = db.Dishes;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Material.Contains(searchString) || x.Type.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public Dish ViewDetail(int id)
        {
            var dish = db.Dishes.Find(id);
            return db.Dishes.Find(id);
        }
        public bool ChangeStatus(long id)
        {
            var dish = db.Dishes.Find(id);
            dish.Status = !dish.Status;
            db.SaveChanges();
            return dish.Status;
        }
        public bool Delete(int id)
        {
            try
            {
                var dish = db.Dishes.Find(id);
                db.Dishes.Remove(dish);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
    }
}
