using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MaiAmTruyenTin.Areas.Admin.Models
{
    public class ChangePasswordObject
    {
        public string PasswordOld { set; get; }
        public string PasswordNew { set; get; }
        public string ConfirmPasswordNew { set; get; }
    }
}