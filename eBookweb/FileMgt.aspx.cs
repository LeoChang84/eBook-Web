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
    public partial class FileMgt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRptFile();
            }
        }

        private void BindRptFile()
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Files", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtFile = new DataTable();
                        sda.Fill(dtFile);
                        RtrFile.DataSource = dtFile;
                        RtrFile.DataBind();

                    }
                }

            }
        }

        protected void btFileUpload_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("insert into Files values('" + tbFileName.Text + "', '" + tbFileLink.Text + "', '" + tbFileBrief.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                lbFilemsg.ForeColor = Color.Green;
                lbFilemsg.Text = "新增成功";
            }
        }
    }
}