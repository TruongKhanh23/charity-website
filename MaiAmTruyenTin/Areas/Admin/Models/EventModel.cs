using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MaiAmTruyenTin.Areas.Admin.Models
{
    public class EventModel
    {
        public int ID { get; set; }
        public string EventName { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}