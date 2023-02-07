using Newtonsoft.Json;
using System;

namespace ASP.Net_CRUD_OPERATIONS.Models
{
    public class UserDetail
    {
        public Guid UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public AddressModel Address { get; set; }
        public string Email { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        [JsonIgnore]
        public string Action { get; set; }
    }
}