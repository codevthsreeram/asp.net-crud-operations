using ASP.Net_CRUD_OPERATIONS.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;

namespace ASP.Net_CRUD_OPERATIONS.DataLayer
{
    public class DBMethods
    {
        public static SqlConnection _sqlConnection;
        public DBMethods()
        {
            _sqlConnection = GetConnection();
        }
        public SqlConnection GetConnection()
        {
            var _connectionString = ConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            var sqlConnection = new SqlConnection(_connectionString);
            return sqlConnection;
        }
        public List<UserModel> List(long skip, long take)
        {
            var getCommand = new SqlCommand("[Core].[ListUsers]", _sqlConnection);
            getCommand.CommandType = CommandType.StoredProcedure;
            getCommand.Parameters.AddWithValue("@Skip", skip);
            getCommand.Parameters.AddWithValue("@Take", take);
            if (_sqlConnection.State == ConnectionState.Closed)
                _sqlConnection.Open();
            var dbDataReader = getCommand.ExecuteReader();
            var users = HydrateList(dbDataReader);
            _sqlConnection.Close();
            return users;
        }
        public UserDetail GetById(Guid userId)
        {
            var getCommand = new SqlCommand("[Core].[GetUserById]", _sqlConnection);
            getCommand.CommandType = CommandType.StoredProcedure;
            getCommand.Parameters.AddWithValue("@UserId", userId);
            if (_sqlConnection.State == ConnectionState.Closed)
                _sqlConnection.Open();
            var dbDataReader = getCommand.ExecuteReader();
            var userDetails = Hydrate(dbDataReader);
            _sqlConnection.Close();
            return userDetails;
        }
        public int Create(UserDetail userDetail)
        {
            var createCommand = new SqlCommand("[Core].[InsertUser]", _sqlConnection);
            createCommand.CommandType = CommandType.StoredProcedure;
            createCommand.Parameters.AddWithValue("@UserId", userDetail.UserId);
            createCommand.Parameters.AddWithValue("@FirstName", userDetail.FirstName);
            createCommand.Parameters.AddWithValue("@LastName", userDetail.LastName);
            createCommand.Parameters.AddWithValue("@FullName", userDetail.FullName);
            createCommand.Parameters.AddWithValue("@Address", JsonConvert.SerializeObject(userDetail.Address));
            createCommand.Parameters.AddWithValue("@Email", userDetail.Email);
            if (_sqlConnection.State == ConnectionState.Closed)
                _sqlConnection.Open();
            var result = createCommand.ExecuteNonQuery();
            _sqlConnection.Close();
            return result;
        }
        public int Update(Guid userId, UserDetail userDetail, string action)
        {
            var updateCommand = new SqlCommand("[Core].[UpdateUser]", _sqlConnection);
            updateCommand.CommandType = CommandType.StoredProcedure;
            updateCommand.Parameters.AddWithValue("@UserId", userId);
            updateCommand.Parameters.AddWithValue("@FirstName", userDetail.FirstName);
            updateCommand.Parameters.AddWithValue("@LastName", userDetail.LastName);
            updateCommand.Parameters.AddWithValue("@FullName", userDetail.FullName);
            updateCommand.Parameters.AddWithValue("@Address", JsonConvert.SerializeObject(userDetail.Address));
            updateCommand.Parameters.AddWithValue("@Email", userDetail.Email);
            updateCommand.Parameters.AddWithValue("@IsActive", userDetail.IsActive);
            updateCommand.Parameters.AddWithValue("@Action", action);
            if (_sqlConnection.State == ConnectionState.Closed)
                _sqlConnection.Open();
            var result = updateCommand.ExecuteNonQuery();
            _sqlConnection.Close();
            return result;
        }
        public int Delete(Guid userId)
        {
            var deleteCommand = new SqlCommand("[Core].[DeleteUser]", _sqlConnection);
            deleteCommand.CommandType = CommandType.StoredProcedure;
            deleteCommand.Parameters.AddWithValue("@UserId", userId);
            if (_sqlConnection.State == ConnectionState.Closed)
                _sqlConnection.Open();
            var result = deleteCommand.ExecuteNonQuery();
            _sqlConnection.Close();
            return result;
        }
        public UserDetail Hydrate(DbDataReader dbDataReader)
        {
            var users = new List<UserDetail>();
            if (dbDataReader.HasRows)
            {
                var ordUserId = dbDataReader.GetOrdinal("UserId");
                var ordFullName = dbDataReader.GetOrdinal("FullName");
                var ordFirstName = dbDataReader.GetOrdinal("FirstName");
                var ordLastName = dbDataReader.GetOrdinal("LastName");
                var ordAddress = dbDataReader.GetOrdinal("Address");
                var ordEmail = dbDataReader.GetOrdinal("Email");
                var ordIsActive = dbDataReader.GetOrdinal("IsActive");
                var ordCreatedDate = dbDataReader.GetOrdinal("CreatedDate");
                var ordModifiedDate = dbDataReader.GetOrdinal("ModifiedDate");

                while (dbDataReader.Read())
                {
                    var model = new UserDetail()
                    {
                        UserId = (Guid)dbDataReader.GetValue(ordUserId),
                        FullName = (string)dbDataReader.GetValue(ordFullName),
                        FirstName = (string)dbDataReader.GetValue(ordFirstName),
                        LastName = (string)dbDataReader.GetValue(ordLastName),
                        Address = JsonConvert.DeserializeObject<AddressModel>((string)dbDataReader.GetValue(ordAddress)),
                        Email = (string)dbDataReader.GetValue(ordEmail),
                        IsActive = (bool)dbDataReader.GetValue(ordIsActive),
                        CreatedDate = (DateTime)dbDataReader.GetValue(ordCreatedDate),
                        ModifiedDate =  (DateTime)dbDataReader.GetValue(ordModifiedDate)
                    };
                    users.Add(model);
                }
            }
            return users.FirstOrDefault();
        }
        public List<UserModel> HydrateList(DbDataReader dbDataReader)
        {
            var users = new List<UserModel>();
            if (dbDataReader.HasRows)
            {
                var ordUserId = dbDataReader.GetOrdinal("UserId");
                var ordFullName = dbDataReader.GetOrdinal("FullName");
                var ordCity = dbDataReader.GetOrdinal("City");
                var ordEmail = dbDataReader.GetOrdinal("Email");
                var ordIsActive = dbDataReader.GetOrdinal("IsActive");
                var ordCreatedDate = dbDataReader.GetOrdinal("CreatedDate");

                while (dbDataReader.Read())
                {
                    var model = new UserModel()
                    {
                        UserId = (Guid)dbDataReader.GetValue(ordUserId),
                        FullName = (string)dbDataReader.GetValue(ordFullName),
                        City = (string)dbDataReader.GetValue(ordCity),
                        Email = (string)dbDataReader.GetValue(ordEmail),
                        IsActive = (bool)dbDataReader.GetValue(ordIsActive),
                        CreatedDate = (DateTime)dbDataReader.GetValue(ordCreatedDate)
                    };
                    users.Add(model);
                }
            }
            return users;
        }
    }
}