using ExaminationSystem.ExaminationSystemBiz;
using ExaminationSystem.ExaminationSystemData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExaminationSystem
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signInBtn_Click(object sender, EventArgs e)
        {
            UserModel vmModel = new UserModel();

            Response.Cookies["UserName"].Value = Username.Text.Trim();
            Response.Cookies["Password"].Value = password.Text.Trim();
            vmModel.UserName = Username.Text.Trim();
            vmModel.Password = password.Text.Trim();
            UserLoginBiz loginBiz = new UserLoginBiz();
            bool msg = loginBiz.LoginMethod(vmModel);
            if (msg)
            {

                Response.Redirect("Default.aspx");
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Login ID and Password is invalid.";
            }
        }
    }
}