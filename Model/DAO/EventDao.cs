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
    public class EventDao
    {
        MaiAmTruyenTinDbContext db = null;
        public EventDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public int Insert(Event eventt)
        {
            db.Events.Add(eventt);
            db.SaveChanges();
            return eventt.ID;
        }
        public bool Update(Event entity)
        {
            try
            {
                var eventt = db.Events.Find(entity.ID);
                eventt.ID = entity.ID;
                eventt.Code = entity.Code;
                eventt.Type = entity.Type;
                eventt.Name = entity.Name;
                eventt.Description = entity.Description;
                eventt.MoreInformation = entity.MoreInformation;
                eventt.StartDate = entity.StartDate;
                eventt.EndDate = entity.EndDate;
                eventt.Image = entity.Image;
                eventt.ModifiedBy = entity.ModifiedBy;
                eventt.ModifiedDate = DateTime.Now;
                eventt.Status = entity.Status;
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
                var eventt = db.Events.Find(id);
                db.Events.Remove(eventt);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;.
            }
        }
        public Event ViewDetail(int id)
        {
            return db.Events.Find(id);
        }
        public IEnumerable<EventViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.Events
                        select new EventViewModel()
                        {
                            ID = a.ID,
                            Code = a.Code,
                            Type = a.Type,
                            Name = a.Name,
                            Description = a.Description,
                            MoreInformation = a.MoreInformation,
                            StartDate = a.StartDate,
                            EndDate = a.EndDate,
                            CreatedBy = a.CreatedBy,
                            CreatedDate = a.CreatedDate,
                            ModifiedDate = a.ModifiedDate,
                            ModifiedBy = a.ModifiedBy,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Code.Contains(searchString) || x.Type.Contains(searchString)
                || x.Description.Contains(searchString) || x.MoreInformation.Contains(searchString) || x.CreatedBy.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Event> ListAll()
        {
            return db.Events.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<Event> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Event> model = db.Events;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public List<Event> ListTop(string clid)
        {
            List<Event> lst = new List<Event>();
            lst = db.Events.Where(s => s.Name == clid).ToList();
            return lst;
        }

        //public string ChangeStatus(long id)
        //{
        //    var eventt = db.Events.Find(id);
        //    eventt.Status = !eventt.Status;
        //    db.SaveChanges();
        //    return eventt.Status;
        //}
    }
}
