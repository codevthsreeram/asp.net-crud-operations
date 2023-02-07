using ASP.Net_CRUD_OPERATIONS.DataLayer;
using ASP.Net_CRUD_OPERATIONS.Models;
using System;
using System.Collections.Generic;

namespace ASP.Net_CRUD_OPERATIONS.BussinessLogicLayer
{
    public class BussinessLayer
    {
        public static DBMethods _dbMethods;
        public BussinessLayer()
        {
            _dbMethods = new DBMethods();
        }
        public List<UserModel> List(long skip, long take)
        {
            return _dbMethods.List(skip, take);
        }
        public UserDetail GetById(Guid userId)
        {
            return _dbMethods.GetById(userId);
        }
        public int Create(UserDetail userDetail)
        {
            userDetail.UserId = Guid.NewGuid();
            return _dbMethods.Create(userDetail);
        }
        public int Update(Guid userId, UserDetail userDetail, string action)
        {
            return _dbMethods.Update(userId, userDetail, action);
        }
        public int Delete(Guid userId)
        {
            return _dbMethods.Delete(userId);
        }
    }
}