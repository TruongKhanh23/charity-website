using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model.ViewModel
{
    public class EventModel
    {
        public int ID { get; set; }
        public string EventName { get; set; }
        public string EventID { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}