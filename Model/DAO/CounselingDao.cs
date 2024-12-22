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
    public class CounselingDao
    {
        MaiAmTruyenTinDbContext db = null;
        public CounselingDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public Counseling GetByID(long id)
        {
            return db.Counselings.Find(id);
        }
        public int Insert(Counseling entity)
        {
            //Tạo mới tham số đối tượng: entity 
            db.Counselings.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public Counseling ViewDetail(int id)
        {
            return db.Counselings.Find(id);
        }
        public bool Update(Counseling entity)
        {
            try
            {
                var counseling = db.Counselings.Find(entity.ID);
                counseling.ChildrenID = entity.ChildrenID;
                counseling.Problem = entity.Problem;
                counseling.Time = entity.Time;
                counseling.Ticket = entity.Ticket;
                counseling.Solution = entity.Solution;
                counseling.Description = entity.Description;
                counseling.Psychologist = entity.Psychologist;
                counseling.ModifiedDate = DateTime.Now;
                counseling.ModifiedBy = entity.ModifiedBy;
                counseling.Status = entity.Status;
                db.Entry(counseling).State = System.Data.Entity.EntityState.Modified;
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
                var counseling = db.Counselings.Find(id);
                db.Counselings.Remove(counseling);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        public IEnumerable<CounselingViewModel> ListAllCategory(string searchString, int page, int pageSize)
        {
            var model = from a in db.Counselings
                        join b in db.Children
                        on a.ChildrenID equals b.ID
                        select new CounselingViewModel()
                        {
                            ID = a.ID,
                            ChildrenID = b.ID,
                            ChildrenName = b.FullName,
                            Problem = a.Problem,
                            Time = a.Time,
                            Ticket = a.Ticket,
                            Solution = a.Solution,
                            Description = a.Description,
                            CreatedDate = a.CreatedDate,
                            CreatedBy = a.CreatedBy,
                            ModifiedBy = a.ModifiedBy,
                            ModifiedDate = a.ModifiedDate,
                            Status = a.Status
                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ChildrenName.Contains(searchString) || x.Problem.Contains(searchString) || x.Ticket.Contains(searchString) || x.Description.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Counseling> ListAll()
        {
            return db.Counselings.Where(x => x.Status == true).ToList();
        }
        public int GetMaxTime(int childrenID)
        {
            int MaxID = 0;
            SqlConnection connection = new SqlConnection("data source=125.212.218.20;initial catalog=nznjywuj_checkin; user id=nznjywuj_uef;password=hieuhoang@123;MultipleActiveResultSets=True;App=EntityFramework");
            using (connection)
            {
                SqlCommand cmdMaxID = new SqlCommand("select MAX(Counseling.Time) FROM Counseling, Children WHERE Counseling.ChildrenID = Children.ID AND Children.ID = " + childrenID, connection);
                connection.Open();
                SqlDataReader rdMaxID = cmdMaxID.ExecuteReader();
                if (rdMaxID.HasRows) { while (rdMaxID.Read()) { MaxID = rdMaxID.IsDBNull(0) ? 0 : rdMaxID.GetInt32(0); } }
                rdMaxID.Close();
                connection.Close();
            }
            return MaxID;
        }

    }
}
