using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace eBookweb
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCat();
            }
        }

        private void BindCat()
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                // try to open Category for seleting cato
                SqlCommand cmd = new SqlCommand("select * from Category", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlCat.DataSource = dt;
                    ddlCat.DataTextField = "CatName";
                    ddlCat.DataValueField = "CatId";
                    ddlCat.DataBind();
                    ddlCat.Items.Insert(0, new ListItem("-選擇分類-", "0"));
                }
            }
        }

        protected void btAddUpload_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into Files values('" + tbAddName.Text + "', '" + tbAddLink.Text + "', '" + ddlCat.SelectedItem + "', 'N')", con);
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