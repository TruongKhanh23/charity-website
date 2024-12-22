using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model.ViewModel
{
    public class Volunteer_EventModel
    {
        public int ID { get; set; }
        public int EventID { get; set; }
        public string EventName { get; set; }
        public int VolunteerID { get; set; }
        public string VolunteerCode { get; set; }
        public string VolunteerName { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string Note { get; set; }
    }
}