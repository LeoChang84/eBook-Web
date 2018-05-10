using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;


namespace eBookweb
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSignUp_Click(object sender, EventArgs e)
        {   
            if (tbUname.Text != "" && tbEmail.Text != "" && tbPwd.Text != "" && tbConPwd.Text != "")
            {
                if (tbPwd.Text == tbConPwd.Text)
                {
                    String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Users values('" + tbUname.Text + "', '" + tbPwd.Text + "', '" + tbEmail.Text + "')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lbmsg.ForeColor = Color.Green;
                        lbmsg.Text = "註冊成功";
                        Response.Redirect("~/SignIn.aspx");

                    }
                }
                else
                {
                    lbmsg.ForeColor = Color.Red;
                    lbmsg.Text = "密碼不相符，請重新輸入";
                }
            }
            else
            {
                lbmsg.ForeColor = Color.Red;
                lbmsg.Text = "請完成全部空格";
            }
        }
    }
}