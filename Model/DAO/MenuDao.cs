using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using System.Configuration;
using System.Data.SqlClient;
using Model.ViewModel;
using System.Web.UI;
using System.Globalization;

namespace Model.DAO
{
    public class MenuDao
    {
        MaiAmTruyenTinDbContext db = null;
        public MenuDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(Menu entity)
        {
            //Tạo mới tham số người dùng: entity 
            db.Menus.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(Menu entity)
        {
            try
            {
                var menu = db.Menus.Find(entity.ID);
                menu.Date = entity.Date;
                menu.MorningTapas = entity.MorningTapas;
                menu.MorningFry = entity.MorningFry;
                menu.MorningSoup = entity.MorningSoup;
                menu.Brunch1 = entity.Brunch1;
                menu.Brunch2 = entity.Brunch2;
                menu.NoonTapas = entity.NoonTapas;
                menu.NoonFry = entity.NoonFry;
                menu.NoonSoup = entity.NoonSoup;
                menu.Tea1 = entity.Tea1;
                menu.Tea2 = entity.Tea2;
                menu.AfternoonTapas = entity.AfternoonTapas;
                menu.AfternoonFry = entity.AfternoonFry;
                menu.AfternoonSoup = entity.AfternoonSoup;
                menu.Dinner1 = entity.Dinner1;
                menu.Dinner2 = entity.Dinner2;
                menu.Note = entity.Note;
                menu.CreatedDate = entity.CreatedDate;
                menu.CreatedBy = entity.CreatedBy;
                menu.ModifiedDate = entity.ModifiedDate;
                menu.ModifiedBy = entity.ModifiedBy;
                menu.Status = entity.Status;
                db.Entry(menu).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }
        }
        public IEnumerable<Menu> ListAll()
        {
            return db.Menus.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<MenuViewModel> ListAllPaging(DateTime start, DateTime end, string searchString, int page, int pageSize)
        {
            List<MenuViewModel> modelView = new List<MenuViewModel>();
            var model = from a in db.Menus select a;
            model = model.Where(x => x.Date >= start && x.Date <= end);

            foreach (var item in model)
            {
                var modelViewString = new MenuViewModel();
                modelViewString.ID = item.ID;
                modelViewString.Date = item.Date;
                modelViewString.MorningTapasName = db.Dishes.Find(item.MorningTapas).Name;
                modelViewString.MorningFryName = db.Dishes.Find(item.MorningFry).Name;
                modelViewString.MorningSoupName = db.Dishes.Find(item.MorningSoup).Name;
                modelViewString.BrunchName1 = db.Dishes.Find(item.Brunch1).Name;
                modelViewString.BrunchName2 = db.Dishes.Find(item.Brunch2).Name;
                modelViewString.NoonTapasName = db.Dishes.Find(item.NoonTapas).Name;
                modelViewString.NoonFryName = db.Dishes.Find(item.NoonFry).Name;
                modelViewString.NoonSoupName = db.Dishes.Find(item.NoonSoup).Name;
                modelViewString.TeaName1 = db.Dishes.Find(item.Tea1).Name;
                modelViewString.TeaName2 = db.Dishes.Find(item.Tea2).Name;
                modelViewString.AfternoonTapasName = db.Dishes.Find(item.AfternoonTapas).Name;
                modelViewString.AfternoonFryName = db.Dishes.Find(item.AfternoonFry).Name;
                modelViewString.AfternoonSoupName = db.Dishes.Find(item.AfternoonSoup).Name;
                modelViewString.DinnerName1 = db.Dishes.Find(item.Dinner1).Name;
                modelViewString.DinnerName2 = db.Dishes.Find(item.Dinner2).Name;

                modelView.Add(modelViewString);
            }

            IEnumerable<MenuViewModel> modelViewList = modelView;
            if (!string.IsNullOrEmpty(searchString))
            {
                modelViewList = modelViewList.Where(x => x.MorningTapasName.Contains(searchString));
            }
            return modelViewList.OrderByDescending(x => x.Date).ToPagedList(page, pageSize);
        }
        public Menu ViewDetail(int id)
        {
            var menu = db.Menus.Find(id);
            return db.Menus.Find(id);
        }
        public bool ChangeStatus(long id)
        {
            var menu = db.Menus.Find(id);
            menu.Status = !menu.Status;
            db.SaveChanges();
            return menu.Status;
        }
        public bool Delete(int id)
        {
            try
            {
                var menu = db.Menus.Find(id);
                db.Menus.Remove(menu);
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
