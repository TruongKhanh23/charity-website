using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Data;
using PagedList;
using System.Configuration;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Runtime.Remoting.Messaging;
using Model.ViewModel;

namespace Model.DAO
{
    public class DataDao
    {
        public IEnumerable<Religion> ReligionList()
        {
            List<Religion> religion = new List<Religion> {
                                             new Religion{ Name="Công giáo",   ID = 1},
                                             new Religion{ Name="Phật giáo", ID = 2},
                                             new Religion{ Name="Tin Lành",   ID = 3},
                                             new Religion{ Name="Cao Đài",   ID = 4},
                                             new Religion{ Name="Hòa Hảo",   ID = 5},
                                             new Religion{ Name="Ấn Độ Giáo",   ID = 6},
                                             new Religion{ Name="Hồi Giáo",   ID = 7},
                                             new Religion{ Name="Tôn giáo khác",   ID = 8},
                                             new Religion{ Name="Không tôn giáo",   ID = 9},
                                             };
            IEnumerable<Religion> religionList = religion;
            return religionList;
        }
        public Religion ViewDetailReligion(int id)
        {
            return ReligionList().Where(x => x.ID == id).First();
        }
        public IEnumerable<HKChildren> HKList()
        {
            List<HKChildren> hkChildren = new List<HKChildren> {
                                                new HKChildren{ Name="HK01", ID = 1},
                                                new HKChildren{ Name="HK02", ID = 2},
                                                new HKChildren{ Name="HK03", ID = 3}
                                            };
            IEnumerable<HKChildren> hkList = hkChildren;
            return hkList;
        }
        public HKChildren ViewDetailHK(int id)
        {
            return HKList().Where(x => x.ID == id).First();
        }
        //public ChildrenCategory ViewDetail(int id)
        //{
        //    return db.ChildrenCategories.Find(id);
        //}
    }
}
