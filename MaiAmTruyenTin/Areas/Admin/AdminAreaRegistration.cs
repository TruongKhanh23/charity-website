using System.Web.Mvc;

namespace MaiAmTruyenTin.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "HomeAdmin",
                "he-thong/trang-chu",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "LoginAdmin",
                "he-thong/dang-nhap",
                new { controller = "Login", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "LogoutAdmin",
                "he-thong/dang-xuat",
                new { controller = "Home", action = "LogOut", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Register",
                "he-thong/dang-ky",
                new { controller = "Register", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
               "ChangePassword",
               "he-thong/tai-khoan-nguoi-dung/doi-mat-khau",
               new { controller = "User", action = "ChangePassword", id = UrlParameter.Optional }
           );



            //DANH SÁCH
            context.MapRoute(
                "YellowBook",
                "he-thong/so-vang/danh-sach",
                new { controller = "YellowBook", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "MedicalEquipment",
                "he-thong/dung-cu-y-te/danh-sach",
                new { controller = "MedicalEquipment", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Menu",
                "he-thong/thuc-don/danh-sach",
                new { controller = "Menu", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Dish",
                "he-thong/mon-an/danh-sach",
                new { controller = "Dish", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Visitor",
                "he-thong/khach-vieng-tham/danh-sach",
                new { controller = "Visitor", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Activity",
                "he-thong/hoat-dong/danh-sach",
                new { controller = "Activity", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Payment",
                "he-thong/phieu-chi/danh-sach",
                new { controller = "Payment", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Receipt",
                "he-thong/phieu-thu/danh-sach",
                new { controller = "Receipt", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "ReceivePayAccount",
                "he-thong/quy-tai-khoan/danh-sach",
                new { controller = "ReceivePayAccount", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "ReceivePay",
                "he-thong/khoan-thu/danh-sach",
                new { controller = "ReceivePay", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "ReceivePay1",
                "he-thong/khoan-chi/danh-sach",
                new { controller = "ReceivePay", action = "Index1", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "ReceivePayObject",
                "he-thong/doi-tuong-thu-chi/danh-sach",
                new { controller = "ReceivePayObject", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "ChildrenCategory",
                "he-thong/danh-muc-hoan-canh-tre/danh-sach",
                new { controller = "ChildrenCategory", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "SECategory",
                "he-thong/danh-muc-thiet-bi-vat-tu/danh-sach",
                new { controller = "SECategory", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Education",
                "he-thong/danh-muc-trinh-do/danh-sach",
                new { controller = "Education", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Children",
                "he-thong/tre-em/danh-sach",
                new { controller = "Children", action = "Index", id = UrlParameter.Optional }
            );
            //
            context.MapRoute(
                "SchoolReport",
                "he-thong/hoc-ba/danh-sach",
                new { controller = "SchoolReport", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "HealthInsurance",
                "he-thong/bao-hiem-y-te/danh-sach",
                new { controller = "HealthInsurance", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Counseling",
                "he-thong/tham-van-tam-ly/danh-sach",
                new { controller = "Counseling", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Quote",
                "he-thong/cam-nhan-cua-tre/danh-sach",
                new { controller = "Quote", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DevelopmentProcess",
                "he-thong/lich-su-phat-trien-cua-tre/danh-sach",
                new { controller = "DevelopmentProcess", action = "Index", id = UrlParameter.Optional }
            );
            //
            context.MapRoute(
                "Employee",
                "he-thong/nhan-vien/danh-sach",
                new { controller = "Employee", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "SocialInsurance",
                "he-thong/bao-hiem-xa-hoi/danh-sach",
                new { controller = "SocialInsurance", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Volunteer",
                "he-thong/tinh-nguyen-vien/danh-sach",
                new { controller = "Volunteer", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Event",
                "he-thong/su-kien/danh-sach",
                new { controller = "Event", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Cost",
                "he-thong/chi-phi/danh-sach",
                new { controller = "Cost", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "SuppliesEquipment",
                "he-thong/co-so-vat-chat/danh-sach",
                new { controller = "SuppliesEquipment", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Regulation1",
                "he-thong/quy-dinh/danh-sach",
                new { controller = "Regulation", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "History1",
                "he-thong/lich-su-hoat-dong/danh-sach",
                new { controller = "History", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "User",
                "he-thong/tai-khoan-nguoi-dung/danh-sach",
                new { controller = "User", action = "Index", id = UrlParameter.Optional }
            );

            //THÊM MỚI
            context.MapRoute(
                "CreateYellowBook",
                "he-thong/so-vang/them-moi",
                new { controller = "YellowBook", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateMedicalEquipment",
                "he-thong/dung-cu-y-te/them-moi",
                new { controller = "MedicalEquipment", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateMenu",
                "he-thong/thuc-don/them-moi",
                new { controller = "Menu", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateDish",
                "he-thong/mon-an/them-moi",
                new { controller = "Dish", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "VolunteerEvent",
                "he-thong/su-kien/{eventID}/them-tinh-nguyen-vien/",
                new { controller = "Event", action = "GetVolunteer", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateActivity",
                "he-thong/hoat-dong/them-moi",
                new { controller = "Activity", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreatePayment",
                "he-thong/phieu-chi/them-moi",
                new { controller = "Payment", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateReceipt",
                "he-thong/phieu-thu/them-moi",
                new { controller = "Receipt", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateReceivePayAccount",
                "he-thong/quy-tai-khoan/them-moi",
                new { controller = "ReceivePayAccount", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateReceivePay1",
                "he-thong/khoan-chi/them-moi",
                new { controller = "ReceivePay", action = "Create1", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateReceivePay",
                "he-thong/khoan-thu/them-moi",
                new { controller = "ReceivePay", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateReceivePayObject",
                "he-thong/doi-tuong-thu-chi/them-moi",
                new { controller = "ReceivePayObject", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateSchoolReportDetail",
                "he-thong/hoc-ba-chi-tiet/them-moi",
                new { controller = "SchoolReportDetail", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateChildrenCategory",
                "he-thong/danh-muc-hoan-canh-tre/them-moi",
                new { controller = "ChildrenCategory", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateEducation",
                "he-thong/danh-muc-trinh-do/them-moi",
                new { controller = "Education", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateCostCategory",
                "he-thong/danh-muc-chi-phi/them-moi",
                new { controller = "CostCategory", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateSECategory",
                "he-thong/danh-muc-thiet-bi-vat-tu/them-moi",
                new { controller = "SECategory", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateChildren",
                "he-thong/tre-em/them-moi",
                new { controller = "Children", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateSchoolReport",
                "he-thong/hoc-ba/them-moi",
                new { controller = "SchoolReport", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateHealthInsurance",
                "he-thong/bao-hiem-y-te/them-moi",
                new { controller = "HealthInsurance", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateCounseling",
                "he-thong/tham-van-tam-ly/them-moi",
                new { controller = "Counseling", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateQuote",
                "he-thong/cam-nhan-cua-tre/them-moi",
                new { controller = "Quote", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateDevelopmentProcess",
                "he-thong/lich-su-phat-trien-cua-tre/them-moi",
                new { controller = "DevelopmentProcess", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateEmployee",
                "he-thong/nhan-vien/them-moi",
                new { controller = "Employee", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateSocialInsurance",
                "he-thong/bao-hiem-xa-hoi/them-moi",
                new { controller = "SocialInsurance", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateVolunteer",
                "he-thong/tinh-nguyen-vien/them-moi",
                new { controller = "Volunteer", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateEvent",
                "he-thong/su-kien/them-moi",
                new { controller = "Event", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateCost",
                "he-thong/chi-phi/them-moi",
                new { controller = "Cost", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateSuppliesEquipment",
                "he-thong/co-so-vat-chat/them-moi",
                new { controller = "SuppliesEquipment", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateRegulation",
                "he-thong/quy-dinh/them-moi",
                new { controller = "Regulation", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateHistory",
                "he-thong/lich-su-hoat-dong/them-moi",
                new { controller = "History", action = "Create", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "CreateUser",
                "he-thong/tai-khoan-nguoi-dung/them-moi",
                new { controller = "User", action = "Create", id = UrlParameter.Optional }
            );

            //CHỈNH SỬA
            context.MapRoute(
                "EdiAbout",
                "he-thong/gioi-thieu/chinh-sua/{id}",
                new { controller = "About", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditYellowBook",
                "he-thong/so-vang/chinh-sua/{id}",
                new { controller = "YellowBook", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditMedicalEquipment",
                "he-thong/dung-cu-y-te/chinh-sua/{id}",
                new { controller = "MedicalEquipment", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditMenu",
                "he-thong/thuc-don/chinh-sua/{id}",
                new { controller = "Menu", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditDish",
                "he-thong/mon-an/chinh-sua/{id}",
                new { controller = "Dish", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditActivity",
                "he-thong/hoat-dong/chinh-sua/{id}",
                new { controller = "Activity", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditReceipt",
                "he-thong/phieu-thu/chinh-sua/{id}",
                new { controller = "Receipt", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditPayment",
                "he-thong/phieu-chi/chinh-sua/{id}",
                new { controller = "Payment", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditReceivePayAccount",
                "he-thong/quy-tai-khoan/chinh-sua/{id}",
                new { controller = "ReceivePayAccount", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditReceivePay",
                "he-thong/khoan-thu-chi/chinh-sua/{id}",
                new { controller = "ReceivePay", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditReceivePayObject",
                "he-thong/doi-tuong-thu-chi/chinh-sua/{id}",
                new { controller = "ReceivePayObject", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditSchoolReportDetail",
                "he-thong/hoc-ba-chi-tiet/chinh-sua/{id}",
                new { controller = "SchoolReportDetail", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditChildrenCategory",
                "he-thong/danh-muc-hoan-canh-tre/chinh-sua/{id}",
                new { controller = "ChildrenCategory", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditEducation",
                "he-thong/danh-muc-trinh-do/chinh-sua/{id}",
                new { controller = "Education", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditCostCategory",
                "he-thong/danh-muc-chi-phi/chinh-sua/{id}",
                new { controller = "CostCategory", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditSECategory",
                "he-thong/danh-muc-thiet-bi-vat-tu/chinh-sua/{id}",
                new { controller = "SECategory", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditChildren",
                "he-thong/tre-em/chinh-sua/{id}",
                new { controller = "Children", action = "Edit", id = UrlParameter.Optional }
            );
            //
            context.MapRoute(
                "EditSchoolReport",
                "he-thong/hoc-ba/chinh-sua/{id}",
                new { controller = "SchoolReport", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditHealthInsurance",
                "he-thong/bao-hiem-y-te/chinh-sua/{id}",
                new { controller = "HealthInsurance", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditCounseling",
                "he-thong/tham-van-tam-ly/chinh-sua/{id}",
                new { controller = "Counseling", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditQuote",
                "he-thong/cam-nhan-cua-tre/chinh-sua/{id}",
                new { controller = "Quote", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditDevelopmentProcess",
                "he-thong/lich-su-phat-trien-cua-tre/chinh-sua/{id}",
                new { controller = "DevelopmentProcess", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditEmployee",
                "he-thong/nhan-vien/chinh-sua/{id}",
                new { controller = "Employee", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditSocialInsurance",
                "he-thong/bao-hiem-xa-hoi/chinh-sua/{id}",
                new { controller = "SocialInsurance", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditVolunteer",
                "he-thong/tinh-nguyen-vien/chinh-sua/{id}",
                new { controller = "Volunteer", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditEvent",
                "he-thong/su-kien/chinh-sua/{id}",
                new { controller = "Event", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditCost",
                "he-thong/chi-phi/chinh-sua/{id}",
                new { controller = "Cost", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditSuppliesEquipment",
                "he-thong/thiet-bi-vat-tu/chinh-sua/{id}",
                new { controller = "SuppliesEquipment", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditRegulation",
                "he-thong/quy-dinh/chinh-sua/{id}",
                new { controller = "Regulation", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditHistory",
                "he-thong/lich-su-hoat-dong/chinh-sua/{id}",
                new { controller = "History", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "EditUser",
                "he-thong/tai-khoan-nguoi-dung/chinh-sua/{id}",
                new { controller = "User", action = "Edit", id = UrlParameter.Optional }
            );

            //CHI TIẾT
            context.MapRoute(
               "DetailAbout",
               "he-thong/gioi-thieu/chi-tiet/{id}",
               new { controller = "About", action = "Details", id = UrlParameter.Optional }
           );
            context.MapRoute(
               "DetailYellowBook",
               "he-thong/so-vang/chi-tiet/{id}",
               new { controller = "YellowBook", action = "Details", id = UrlParameter.Optional }
           );
            context.MapRoute(
               "DetailMedicalEquipment",
               "he-thong/dung-cu-y-te/chi-tiet/{id}",
               new { controller = "MedicalEquipment", action = "Details", id = UrlParameter.Optional }
           );
            context.MapRoute(
                "DetailMenu",
                "he-thong/thuc-don/chi-tiet/{id}",
                new { controller = "Menu", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailDish",
                "he-thong/mon-an/chi-tiet/{id}",
                new { controller = "Dish", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailSocialInsurance",
                "he-thong/bao-hiem-xa-hoi/chi-tiet/{id}",
                new { controller = "SocialInsurance", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailVisitor",
                "he-thong/khach-vieng-tham/chi-tiet/{id}",
                new { controller = "Visitor", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailActivity",
                "he-thong/hoat-dong/chi-tiet/{id}",
                new { controller = "Activity", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailPayment",
                "he-thong/phieu-chi/chi-tiet/{id}",
                new { controller = "Payment", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailReceipt",
                "he-thong/phieu-thu/chi-tiet/{id}",
                new { controller = "Receipt", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailReceivePay",
                "he-thong/khoan-thu-chi/chi-tiet/{id}",
                new { controller = "ReceivePay", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailReceivePayObject",
                "he-thong/doi-tuong-thu-chi/chi-tiet/{id}",
                new { controller = "ReceivePayObject", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailSchoolReportDetail",
                "he-thong/hoc-ba-chi-tiet/chi-tiet/{id}",
                new { controller = "SchoolReportDetail", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailChildrenCategory",
                "he-thong/danh-muc-hoan-canh-tre/chi-tiet/{id}",
                new { controller = "ChildrenCategory", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailChildren",
                "he-thong/tre-em/chi-tiet/{id}",
                new { controller = "Children", action = "Details", id = UrlParameter.Optional }
            );
            //
            context.MapRoute(
                "DetailSchoolReport",
                "he-thong/hoc-ba/chi-tiet/{id}",
                new { controller = "SchoolReport", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailHealthInsurance",
                "he-thong/bao-hiem-y-te/chi-tiet/{id}",
                new { controller = "HealthInsurance", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailCounseling",
                "he-thong/tham-van-tam-ly/chi-tiet/{id}",
                new { controller = "Counseling", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailQuote",
                "he-thong/cam-nhan-cua-tre/chi-tiet/{id}",
                new { controller = "Quote", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailDevelopmentProcess",
                "he-thong/lich-su-phat-trien-cua-tre/chi-tiet/{id}",
                new { controller = "DevelopmentProcess", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailEmployee",
                "he-thong/nhan-vien/chi-tiet/{id}",
                new { controller = "Employee", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailVolunteer",
                "he-thong/tinh-nguyen-vien/chi-tiet/{id}",
                new { controller = "Volunteer", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailEvent",
                "he-thong/su-kien/chi-tiet/{id}",
                new { controller = "Event", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailCost",
                "he-thong/chi-phi/chi-tiet/{id}",
                new { controller = "Cost", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailSuppliesEquipment",
                "he-thong/thiet-bi-vat-tu/chi-tiet/{id}",
                new { controller = "SuppliesEquipment", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailRegulation",
                "he-thong/quy-dinh/chi-tiet/{id}",
                new { controller = "Regulation", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailHistory",
                "he-thong/lich-su-hoat-dong/chi-tiet/{id}",
                new { controller = "History", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DetailUser",
                "he-thong/tai-khoan-nguoi-dung/chi-tiet/{id}",
                new { controller = "User", action = "Details", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}