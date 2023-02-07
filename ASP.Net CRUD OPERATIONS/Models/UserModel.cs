using System;

namespace ASP.Net_CRUD_OPERATIONS.Models
{
    public class UserModel
    {
        public Guid UserId { get; set; }
        public string FullName { get; set; }
        public string City { get; set; }
        public string Email { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}