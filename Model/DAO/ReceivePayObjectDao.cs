using System;
using System.Collections.Generic;
using System.Linq;
using Model.EF;
using PagedList;
using Model.ViewModel;


namespace Model.DAO
{
    public class ReceivePayObjectDao
    {
        MaiAmTruyenTinDbContext db = null;
        public ReceivePayObjectDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }

        public ReceivePayObject GetByID(long id)
        {
            return db.ReceivePayObjects.Find(id);
        }
        public IEnumerable<ReceivePayObject> ListAll()
        {
            return db.ReceivePayObjects.Where(x => x.Status == true).ToList();
        }
        public int Insert(ReceivePayObject entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.ReceivePayObjects.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public ReceivePayObject ViewDetail(int id)
        {
            return db.ReceivePayObjects.Find(id);
        }
        public bool Update(ReceivePayObject entity)
        {
            try
            {
                var receivepayobject = db.ReceivePayObjects.Find(entity.ID);
                receivepayobject.Code = entity.Code;
                receivepayobject.Name = entity.Name;
                receivepayobject.AffiliatedUnit = entity.AffiliatedUnit;
                receivepayobject.Address = entity.Address;
                receivepayobject.Phone = entity.Phone;
                receivepayobject.Fax = entity.Fax;
                receivepayobject.Website = entity.Website;
                receivepayobject.Email = entity.Email;
                receivepayobject.BankingNumber = entity.BankingNumber;
                receivepayobject.HolderName = entity.HolderName;
                receivepayobject.BankID = entity.BankID;
                receivepayobject.Note = entity.Note;
                receivepayobject.CategoryID = entity.CategoryID;
                receivepayobject.ModifiedDate = DateTime.Now;
                receivepayobject.ModifiedBy = entity.ModifiedBy;
                receivepayobject.Status = entity.Status;
                db.Entry(receivepayobject).State = System.Data.Entity.EntityState.Modified;
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
                var receivepayobject = db.ReceivePayObjects.Find(id);
                db.ReceivePayObjects.Remove(receivepayobject);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<ReceivePayObjectViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.ReceivePayObjects
                        join b in db.Banks on a.BankID equals b.ID into Table1
                        from b in Table1.ToList()
                        join c in db.ReceivePayObjectCategories on a.CategoryID equals c.ID into Table2
                        from c in Table2.ToList()
                        select new ReceivePayObjectViewModel()
                        {
                            ID = a.ID,
                            Code = a.Code,
                            Name = a.Name,
                            AffiliatedUnit = a.AffiliatedUnit,
                            Address = a.Address,
                            Phone = a.Phone,
                            Fax = a.Fax,
                            Website = a.Website,
                            Email = a.Email,
                            BankingNumber = a.BankingNumber,
                            BankName = b.Name,
                            HolderName = a.HolderName,
                            CategoryName = c.Name,
                            Note = a.Note,
                            CreatedDate = a.CreatedDate,
                            CreatedBy = a.CreatedBy,
                            ModifiedDate = a.ModifiedDate,
                            ModifiedBy = a.ModifiedBy,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.AffiliatedUnit.Contains(searchString)
                || x.Address.Contains(searchString) || x.Phone.Contains(searchString) || x.Fax.Contains(searchString)
                || x.Website.Contains(searchString) || x.Email.Contains(searchString) || x.BankingNumber.Contains(searchString)
                || x.BankName.Contains(searchString) || x.CategoryName.Contains(searchString) || x.Note.Contains(searchString)
                 || x.CreatedBy.Contains(searchString) || x.ModifiedBy.Contains(searchString));
            }
            return model.OrderByDescending(x => x.ID).Where(x => x.Status == true).ToPagedList(page, pageSize);
        }
        public string[] VietNamChar = new string[]
        {
            "aAeEoOuUiIdDyY",
            "áàạảãâấầậẩẫăắằặẳẵ",
            "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
            "éèẹẻẽêếềệểễ",
            "ÉÈẸẺẼÊẾỀỆỂỄ",
            "óòọỏõôốồộổỗơớờợởỡ",
            "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
            "úùụủũưứừựửữ",
            "ÚÙỤỦŨƯỨỪỰỬỮ",
            "íìịỉĩ",
            "ÍÌỊỈĨ",
            "đ",
            "Đ",
            "ýỳỵỷỹ",
            "ÝỲỴỶỸ"
        };
        public string LocDauTen(string name)
        {
            //Thay thế và lọc dấu từng char      
            for (int i = 1; i < VietNamChar.Length; i++)
            {
                for (int j = 0; j < VietNamChar[i].Length; j++)
                    name = name.Replace(VietNamChar[i][j], VietNamChar[0][i - 1]);
            }
            return name;
        }
        public int spaceCountAction(string name)
        {
            int spaceCount = 0;
            name = LocDauTen(name);
            for (int i = 0; i < name.Length; i++)
            {
                if (name[i].ToString().Contains(" "))
                {
                    spaceCount++;
                }
            }
            return spaceCount;
        }
        public string getLastName(string name)
        {
            int indexLast = name.LastIndexOf(" ");
            string lastName = name.Substring(indexLast);
            return lastName;
        }
        public bool ChangeStatus(long id)
        {
            var repaObject = db.ReceivePayObjects.Find(id);
            repaObject.Status = !repaObject.Status;
            db.SaveChanges();
            return repaObject.Status;
        }
    }
}
