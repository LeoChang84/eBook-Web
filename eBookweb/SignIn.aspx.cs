using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace eBookweb
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Response.Cookies["UNAME"] != null && Request.Cookies["PWD"] != null)
                {
                    tbSignInUserName.Text = Request.Cookies["UNAME"].Value;
                    tbSignInPwd.Attributes["value"] = Request.Cookies["PWD"].Value;
                    cbSignInRmb.Checked = true;
                }
            }
        }

        protected void btSignUplogin_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from Users where Username='"+ tbSignInUserName.Text + "' and Password='"+ tbSignInPwd.Text + "' ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {   
                    if (cbSignInRmb.Checked)
                    {
                        Response.Cookies["UNAME"].Value = tbSignInUserName.Text;
                        Response.Cookies["PWD"].Value = tbSignInPwd.Text;
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
                    }
                    else
                    {
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                    }
                    string Utype;
                    Utype = dt.Rows[0][4].ToString().Trim();

                    if(Utype == "U")
                    {
                        lberror.ForeColor = Color.Green;
                        lberror.Text = "一般使用者登入成功";
                        Session["USERNAME"] = tbSignInUserName.Text;
                        Response.Redirect("~/UserHome.aspx");
                    }
                    if (Utype == "A")
                    {
                        lberror.ForeColor = Color.Green;
                        lberror.Text = "管理員登入成功";
                        Session["USERNAME"] = tbSignInUserName.Text;
                        Response.Redirect("~/AdminHome.aspx");
                    }
                    if (Utype == "W")
                    {
                        lberror.ForeColor = Color.Red;
                        lberror.Text = "帳號尚未認證, 請點選Contact來聯繫管理人員";
                    }

                }
                else
                {
                    lberror.ForeColor = Color.Red;
                    lberror.Text = "無效的帳號或密碼!";
                }
            }
        }
    }
}