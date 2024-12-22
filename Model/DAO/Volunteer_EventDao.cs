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
    public class Volunteer_EventDao
    {
        MaiAmTruyenTinDbContext db = null;
        public Volunteer_EventDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Volunteer_Event GetByID(long id)
        {
            return db.Volunteer_Event.Find(id);
        }
        public int Insert(Volunteer_Event entity)
        {
            db.Volunteer_Event.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Volunteer_Event ViewDetail(int id)
        {
            return db.Volunteer_Event.Find(id);
        }
        public bool Update(Volunteer_Event entity)
        {
            try
            {
                var volunteer_event = db.Volunteer_Event.Find(entity.ID);
                volunteer_event.VolunteerID = entity.VolunteerID;
                volunteer_event.EventID = entity.EventID;
                volunteer_event.StartDate = entity.StartDate;
                volunteer_event.EndDate = entity.EndDate;
                volunteer_event.Note = entity.Note;
                volunteer_event.Image = entity.Image;
                volunteer_event.ModifiedDate = DateTime.Now;
                volunteer_event.ModifiedBy = entity.ModifiedBy;
                volunteer_event.Status = entity.Status;
                db.Entry(volunteer_event).State = System.Data.Entity.EntityState.Modified;
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
                var volunteer_event = db.Volunteer_Event.Find(id);
                db.Volunteer_Event.Remove(volunteer_event);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<Volunteer_EventViewModel> ListAllEvent(string searchString, int page, int pageSize)
        {
            List<Volunteer> volunteers = db.Volunteers.ToList();
            List<Event> eventt = db.Events.ToList();
            List<Volunteer_Event> volunteer_event = db.Volunteer_Event.ToList();

            var model = from a in db.Volunteer_Event
                        join b in db.Volunteers on a.VolunteerID equals b.ID into table1
                        from b in table1.ToList()
                        join c in db.Events on a.EventID equals c.ID into table2
                        from c in table2.ToList()
                        select new Volunteer_EventViewModel()
                        {
                            ID = a.ID,
                            VolunteerName = b.Name,
                            EventName = c.Name,
                            StartDate = a.StartDate,
                            EndDate = a.EndDate,
                            Note = a.Note,
                            Image = a.Image,
                            CreatedBy = a.CreatedBy,
                            CreatedDate = a.CreatedDate,
                            ModifiedBy = a.ModifiedBy,
                            ModifiedDate = a.ModifiedDate,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.VolunteerName.Contains(searchString) || x.EventName.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public List<Volunteer_EventModel> ListTop(int ve)
        {
            List<Volunteer_EventModel> lst = new List<Volunteer_EventModel>();
            lst = (from vlt in db.Volunteer_Event
                   where vlt.VolunteerID == ve
                   select (new Volunteer_EventModel
                   {
                       EventName = db.Events.Where(s => s.ID == vlt.EventID).FirstOrDefault().Name,
                       ID = vlt.ID,
                       EventID = vlt.EventID,
                       Note = vlt.Note,
                       StartDate = vlt.StartDate,
                       EndDate = vlt.EndDate
                   })).ToList();
            return lst;
        }
        public IEnumerable<Volunteer_EventModel> ListAllVolunteerInEvent(int eventID, string searchString, int page, int pageSize)
        {
            var model = from a in db.Volunteer_Event
                        join b in db.Volunteers on a.VolunteerID equals b.ID into Table1
                        from b in Table1.ToList()
                        join c in db.Events on a.EventID equals c.ID into Table2
                        from c in Table2.ToList()
                        select new Volunteer_EventModel()
                        {
                            ID = a.ID,
                            EventID = c.ID,
                            VolunteerID = b.ID,
                            VolunteerCode = b.Code,
                            EventName = c.Name,
                            VolunteerName = b.Name,
                            Note = a.Note,
                            StartDate = a.StartDate,
                            EndDate = a.EndDate
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.VolunteerName.Contains(searchString) || x.VolunteerCode.Contains(searchString));
            }
            return model.OrderByDescending(x => x.ID).Where(x => x.EventID == eventID).ToPagedList(page, pageSize);
        }

        public object ListAllPaging(string searchString, int page, int pageSize)
        {
            throw new NotImplementedException();
        }
        //public IEnumerable<Volunteer_Event> ListAllPaging(string searchString, int page, int pageSize)
        //
        //    IQueryable<Volunteer_Event> model = db.Volunteer_Event;
        //    if (!string.IsNullOrEmpty(searchString))
        //    {
        //        model = model.Where(x => x.Name.Contains(searchString) || x.Phone.Contains(searchString));
        //    }
        //    return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        //}
        //public List<Volunteer_Event> GetEmployee(int count)
        //{
        //    return db.Volunteer_Event.OrderByDescending(a => a.Age).Take(count).ToList();
        //}
    }
}
