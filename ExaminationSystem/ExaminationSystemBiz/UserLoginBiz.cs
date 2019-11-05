using ExaminationSystem.ExaminationSystemData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExaminationSystem.ExaminationSystemBiz
{
    public class UserLoginBiz
    {
        ExaminationSystemEntities db = new ExaminationSystemEntities();

        public bool LoginMethod(UserModel vmModel)//login method
        {
            bool isLogin = false;
            try
            {
                var record = (from a in db.UserLogins
                              where a.UserName == vmModel.UserName && a.Password == vmModel.Password
                              select a).Count() > 0 ? true : false;
                if (record)
                {
                    isLogin = true;
                }
            }
            catch (Exception ex)
            {

            }
            return isLogin;
        }
    }
}
