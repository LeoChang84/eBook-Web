using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Drawing;
using System.Globalization;

namespace eBookweb
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCat();
                BindDep();
            }
        }

        private void BindCat()
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                // try to open Category for seleting cato
                MySqlCommand cmd = new MySqlCommand("select * from BookCategory", con);
                con.Open();
                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlCat.DataSource = dt;
                    ddlCat.DataTextField = "BookName";
                    ddlCat.DataValueField = "BookSelectedValue";
                    ddlCat.DataBind();
                    ddlCat.Items.Insert(0, new ListItem("-選擇分類-", "%"));
                }
            }
        }
        
        private void BindDep()
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                // try to open Category for seleting cato
                MySqlCommand cmd = new MySqlCommand("select * from DepartmentCategory", con);
                con.Open();
                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlDep.DataSource = dt;
                    ddlDep.DataTextField = "DepartmentName";
                    ddlDep.DataValueField = "DepartmentSelectedValue";
                    ddlDep.DataBind();
                    ddlDep.Items.Insert(0, new ListItem("-選擇分類-", "%"));
                }
            }
        }

        protected void btAddUpload_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(CS))
                {
                    String Img_Path = "Images/Books/" + ddlCat.SelectedValue.ToString() + ".jpg";
                    MySqlCommand cmd = new MySqlCommand("insert into FilesData (FileName, FileLink, ImgPath, FileCategoryIndex, FileUploadDepartment) values ('" + tbAddName.Text + "', '" + tbAddLink.Text + "', '" + Img_Path + "' , '" + ddlCat.SelectedValue + "', '" + ddlDep.SelectedValue + "' )", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lbAddmsg.ForeColor = Color.Green;
                    lbAddmsg.Text = "新增成功";
                }
            }
            catch (Exception ex)
            {
                lbAddmsg.ForeColor = Color.Red;
                lbAddmsg.Text = "新增失敗";
            }
        }
    }
}