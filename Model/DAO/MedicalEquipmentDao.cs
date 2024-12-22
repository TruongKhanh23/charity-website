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
    public class MedicalEquipmentDao
    {
        MaiAmTruyenTinDbContext db = null;
        public MedicalEquipmentDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public MedicalEquipment GetByID(long id)
        {
            return db.MedicalEquipments.Find(id);
        }
        public int Insert(MedicalEquipment entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.MedicalEquipments.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public MedicalEquipment ViewDetail(int id)
        {
            return db.MedicalEquipments.Find(id);
        }
        public bool Update(MedicalEquipment entity)
        {
            try
            {
                var MedicalEquipment = db.MedicalEquipments.Find(entity.ID);
                MedicalEquipment.Name = entity.Name;
                MedicalEquipment.Uses = entity.Uses;
                MedicalEquipment.Unit = entity.Unit;
                MedicalEquipment.Amount = entity.Amount;
                MedicalEquipment.ManufacturingDate = entity.ManufacturingDate;
                MedicalEquipment.ExpiryDate = entity.ExpiryDate;
                MedicalEquipment.CategoryID = entity.CategoryID;
                MedicalEquipment.ModifiedDate = DateTime.Now;
                MedicalEquipment.ModifiedBy = entity.ModifiedBy;
                MedicalEquipment.Status = entity.Status;
                db.Entry(MedicalEquipment).State = System.Data.Entity.EntityState.Modified;
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
                var MedicalEquipment = db.MedicalEquipments.Find(id);
                db.MedicalEquipments.Remove(MedicalEquipment);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<MedicalEquipment> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<MedicalEquipment> model = db.MedicalEquipments;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Uses.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<MedicalEquipmentViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.MedicalEquipments
                        join b in db.MedicalCategories
                        on a.CategoryID equals b.ID
                        select new MedicalEquipmentViewModel()
                        {
                            ID = a.ID,
                            Name = a.Name,
                            Uses = a.Uses,
                            Unit = a.Unit,
                            Amount = a.Amount,
                            ManufacturingDate = a.ManufacturingDate,
                            ExpiryDate = a.ExpiryDate,
                            CategoryName = b.Name,
                            CreatedDate = a.CreatedDate,
                            ModifiedDate = a.ModifiedDate,
                            Status = a.Status,
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Uses.Contains(searchString) || x.CategoryName.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<MedicalCategory> ListMedicalCategory()
        {
            return db.MedicalCategories.ToList();
        }
        public IEnumerable<MedicalEquipment> ListAll()
        {
            return db.MedicalEquipments.Where(x => x.Status == true).ToList();
        }
        public List<MedicalEquipment> GetActivity(int count)
        {
            return db.MedicalEquipments.OrderByDescending(a => a.CreatedDate).Take(count).ToList();
        }
        public bool ChangeStatus(long id)
        {
            var MedicalEquipment = db.MedicalEquipments.Find(id);
            MedicalEquipment.Status = !MedicalEquipment.Status;
            db.SaveChanges();
            return MedicalEquipment.Status;
        }
    }
}
