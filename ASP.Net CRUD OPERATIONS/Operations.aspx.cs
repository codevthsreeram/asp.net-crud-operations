using ASP.Net_CRUD_OPERATIONS.BussinessLogicLayer;
using ASP.Net_CRUD_OPERATIONS.Models;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Web.Services;

namespace ASP.Net_CRUD_OPERATIONS
{
    public partial class Operations : System.Web.UI.Page
    {
        public static BussinessLayer _bussinessLayer;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_bussinessLayer==null)
            {
                _bussinessLayer = new BussinessLayer();
            }
            if (!IsPostBack)
            {
                BindUsersData(0, 10);
            }
            hdnUserId.Value = Guid.NewGuid().ToString();
        }
        public void BindUsersData(long skip, long take)
        {
            var users = _bussinessLayer.List(skip, take);
            if (users.Any())
            {
                grdUser.DataSource = users;
                grdUser.DataBind();
            }
        }
        [WebMethod]
        public static int DeleteUser(string userId)
        {
            return _bussinessLayer.Delete(Guid.Parse(userId));
        }
        [WebMethod]
        public static UserDetail GetEditUserDetails(string userId)
        {
            return _bussinessLayer.GetById(Guid.Parse(userId));
        }
        [WebMethod]
        public static string SaveUserDetails(string userDetails)
        {
            var result = string.Empty;
            if (!string.IsNullOrEmpty(userDetails))
            {
                var userModel = JsonConvert.DeserializeObject<UserDetail>(userDetails);
                if (userModel != null&&userModel.UserId!=Guid.Empty)
                {
                    var updateResult = _bussinessLayer.Update(userModel.UserId, userModel, "All");
                    result = updateResult>0 ? "User updated successfully..!" : "User not found..!";
                }
                else
                {
                    var createResult = _bussinessLayer.Create(userModel);
                    result = createResult>0 ? "User created successfully..!" : "Internal server error..!";
                }
            }
            return result;
        }
    }
}