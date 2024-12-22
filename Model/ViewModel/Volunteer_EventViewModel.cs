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
    public class Volunteer_EventViewModel
    {
        public int ID { get; set; }

        [StringLength(250)]
        public string VolunteerName { get; set; }

        [StringLength(250)]
        public string EventName { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public string Note { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public bool Status { get; set; }
    }
}
