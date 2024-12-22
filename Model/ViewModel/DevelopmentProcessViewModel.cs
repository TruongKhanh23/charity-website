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
    public class DevelopmentProcessViewModel
    {
        public int ID { get; set; }
        [StringLength(50)]
        [DisplayName(" Mã trẻ ")]
        public int ChildrenID { get; set; }

        [StringLength(250)]
        [DisplayName(" Tên trẻ ")]
        public string Name { get; set; }
        [StringLength(500)]
        [DisplayName(" Tiêu đề ")]
        public string Title { get; set; }

        [DisplayName(" Mô tả ngắn ")]
        public string MetaDescription { get; set; }

        [DisplayName(" Nội dung mô tả chi tiết ")]
        public string Description { get; set; }

        [StringLength(250)]
        [DisplayName(" Hình ảnh ")]
        public string Image { get; set; }

        [StringLength(250)]
        [DisplayName(" Ảnh thu nhỏ ")]
        public string Thumbnail { get; set; }

        [StringLength(500)]
        [DisplayName(" Tạo bởi ")]
        public string CreatedBy { get; set; }

        [DisplayName(" Ngày tạo ")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        [DisplayName(" Cập nhật bởi ")]
        public string ModifiedBy { get; set; }

        [DisplayName(" Ngày cập nhật ")]
        public DateTime? ModifiedDate { get; set; }

        [DisplayName(" Trạng thái ")]
        public bool Status { get; set; }

    }
}
