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
    public partial class AccountMgt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRptAct();
            }
        }

        private void BindRptAct()
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Users" , con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtAct = new DataTable();
                        sda.Fill(dtAct);
                        RtrAct.DataSource = dtAct;
                        RtrAct.DataBind();

                    }
                }

            }
        }

        protected void btActUploadn_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("insert into Users values('" + tbActUserName.Text + "', '" + tbActPwd.Text + "', '" + tbActEmail.Text + "', 'U')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                lbActmsg.ForeColor = Color.Green;
                lbActmsg.Text = "新增成功";
            }
        }
    }
}