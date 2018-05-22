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
    public partial class AdminBookStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRptBookStatus();
            }
        }
        private void BindRptBookStatus()
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select FileCat, Count(FileCat) As TotalNum From Files Group by FileCat", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtFile = new DataTable();
                        sda.Fill(dtFile);
                        if (dtFile.Rows.Count > 0)
                        {
                            gvBookStatus.DataSource = dtFile;
                            gvBookStatus.DataBind();
                        }
                        else
                        {
                            dtFile.Rows.Add(dtFile.NewRow());
                            gvBookStatus.DataSource = dtFile;
                            gvBookStatus.DataBind();
                            gvBookStatus.Rows[0].Cells.Clear();
                            gvBookStatus.Rows[0].Cells.Add(new TableCell());
                            gvBookStatus.Rows[0].Cells[0].ColumnSpan = dtFile.Columns.Count;
                            gvBookStatus.Rows[0].Cells[0].Text = "No Data Found ..!";
                            gvBookStatus.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }

                    }
                }
            }
        }
    }
}