using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{ 
    public class EventVolunteerModel
    {
        public int ID { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }

    }
}