using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
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
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(CS))
                {
                    MySqlCommand cmd = new MySqlCommand("select * from UsersData where UserName='" + tbSignInUserName.Text + "' and UserPassword='" + tbSignInPwd.Text + "' ", con);
                    con.Open();
                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
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
                        string UserType;
                        UserType = dt.Rows[0][6].ToString().Trim(); //Get User Type from sixth row 


                        if (UserType == "Admin")
                        {
                            lberror.ForeColor = Color.Green;
                            lberror.Text = "管理員登入成功";
                            Session["USERNAME"] = tbSignInUserName.Text;
                            Response.Redirect("~/AdminHome.aspx");
                        }
                        if (UserType == "Manager")
                        {
                            lberror.ForeColor = Color.Green;
                            lberror.Text = "科室管理員登入成功";
                            Session["USERNAME"] = tbSignInUserName.Text;
                            Response.Redirect("~/ManagerHome.aspx");
                        }

                        if (UserType == "User")
                        {
                            lberror.ForeColor = Color.Green;
                            lberror.Text = "一般使用者登入成功";
                            Session["USERNAME"] = tbSignInUserName.Text;
                            Response.Redirect("~/UserHome.aspx");
                        }

                        if (UserType == "Pending")
                        {
                            lberror.ForeColor = Color.Red;
                            lberror.Text = "帳號尚未認證, 請聯繫科室管理人員";
                        }

                    }
                    else
                    {
                        lberror.ForeColor = Color.Red;
                        lberror.Text = "無效的帳號或密碼!";
                    }
                }
            }
            catch (Exception ex)
            {
                lberror.ForeColor = Color.Red;
                lberror.Text = ex.Message;
            }

        }
    }
}