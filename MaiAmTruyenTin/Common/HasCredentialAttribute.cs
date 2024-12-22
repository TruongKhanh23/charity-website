using DocumentFormat.OpenXml.Drawing.Charts;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Common;
using System.Security.Cryptography;

namespace MaiAmTruyenTin.Common
{
    public class HasCredentialAttribute : AuthorizeAttribute
    {
        public string RoleID { get; set; }


        protected override bool AuthorizeCore(System.Web.HttpContextBase httpContext)
        {
            var session = (UserLogin)HttpContext.Current.Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                return false;
            }
            List<string> privilegeLevels = this.GetCredentialByLoggedInUser(session.UserName);
            if (privilegeLevels.Contains(this.RoleID) || session.GroupID == Model.Common.CommonConstants.ADMIN_GROUP)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new ViewResult
            {
                ViewName = "~/Areas/Admin/Views/Shared/ErrorRole.cshtml"
            };
        }
        private List<string> GetCredentialByLoggedInUser(string userName)
        {
            var credentials = (List<string>)HttpContext.Current.Session[CommonConstants.SESSION_CREDENTIALS];
            return credentials;
        }

    }
}