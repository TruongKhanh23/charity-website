using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MaiAmTruyenTin.Areas.Admin.Models
{
    public class EventVolunteerModel
    {
        //ID = EventID
        public int ID { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public int VolunteerID { get; set; }
        public string VolunteerCode { get; set; }
        public string VolunteerImg { get; set; }

    }
}