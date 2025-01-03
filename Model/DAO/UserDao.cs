﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using System.Configuration;
using Model.Common;
using Model.ViewModel;

//using Common;


namespace Model.DAO
{
    public class UserDao
    {
        MaiAmTruyenTinDbContext db = null;
        public UserDao()
        {
            db = new MaiAmTruyenTinDbContext();
        }
        public long InsertFacebook(User entity)
        {
            var user = db.Users.SingleOrDefault(x => x.UserName == entity.UserName);
            if (user == null)
            {
                entity.Password = EncryptString.Encrypt(entity.Password);
                db.Users.Add(entity);
                db.SaveChanges();
                return entity.ID;
            }
            else
            {
                return user.ID;
            }
        }
        public int Insert(User entity)
        {
            //Tạo mới tham số người dùng: entity 
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.ID);
                user.Name = entity.Name;
                user.UserName = entity.UserName;
                if (!string.IsNullOrEmpty(entity.Password))
                {
                    user.Password = EncryptString.Encrypt(entity.Password);
                }
                user.GroupID = entity.GroupID;
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.Phone = entity.Phone;
                user.Status = entity.Status;
                user.Image = entity.Image;
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }
        }
        public IEnumerable<User> ListAll()
        {
            return db.Users.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<UserGroup> ListUserGroup()
        {
            return db.UserGroups.ToList();
        }
        public IEnumerable<User> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<User> model = db.Users;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public User GetByID(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }
        public User ViewDetail(int id)
        {
            var user = db.Users.Find(id);
            return db.Users.Find(id);
        }
        public List<string> GetListCredentials(string userName)
        {
            var user = db.Users.Single(x => x.UserName == userName);
            List<string> listCredentials = db.Credentials.Where(x => x.UserGroupID == user.GroupID).Select(x => x.RoleID).ToList();
            return listCredentials;
        }
        public int Login(string userName, string password)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.GroupID == CommonConstants.ADMIN_GROUP || result.GroupID == CommonConstants.EMPLOYEE_GROUP || result.GroupID == CommonConstants.CHILDREN_GROUP)
                {
                    if (result.Status == false)
                    {
                        return -1;
                    }
                    else
                    {
                        if (result.Password == password)
                            return 1;
                        else
                            return -2;
                    }
                }
                else
                {
                    return -3;
                }
            }
        }
        public bool ChangeStatus(long id)
        {
            var user = db.Users.Find(id);
            user.Status = !user.Status;
            db.SaveChanges();
            return user.Status;
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                db.Users.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                //throw;
            }
        }
        //public bool CheckUserName(string userName)
        //{
        //    return db.Users.Count(x => x.UserName == userName) > 0;
        //}
        //public bool CheckEmail(string email)
        //{
        //    return db.Users.Count(x => x.Email == email) > 0;
        //}
    }
}
