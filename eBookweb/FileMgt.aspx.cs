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
                        if (dtFile.Rows.Count > 0)
                        {
                            gvFile.DataSource = dtFile;
                            gvFile.DataBind();
                        }
                        else
                        {
                            dtFile.Rows.Add(dtFile.NewRow());
                            gvFile.DataSource = dtFile;
                            gvFile.DataBind();
                            gvFile.Rows[0].Cells.Clear();
                            gvFile.Rows[0].Cells.Add(new TableCell());
                            gvFile.Rows[0].Cells[0].ColumnSpan = dtFile.Columns.Count;
                            gvFile.Rows[0].Cells[0].Text = "No Data Found ..!";
                            gvFile.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }

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
                lbFileerrormsg.Text = "";
            }
        }

        protected void gvFile_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFile.EditIndex = e.NewEditIndex;
            lbFileerrormsg.Text = "";
            BindRptFile();
        }

        protected void gvFile_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "UPDATE Files SET Name=@Name, Link=@Link, Brief=@Brief WHERE Id = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", (gvFile.Rows[e.RowIndex].FindControl("tbEditNameFile") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Link", (gvFile.Rows[e.RowIndex].FindControl("tbEditLinkFile") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Brief", (gvFile.Rows[e.RowIndex].FindControl("tbEditBriefFile") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvFile.DataKeys[e.RowIndex].Value.ToString()));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    gvFile.EditIndex = -1;
                    BindRptFile();
                    lbFileerrormsg.ForeColor = Color.Green;
                    lbFileerrormsg.Text = "修改成功";
                }
            }
            catch (Exception ex)
            {
                lbFileerrormsg.ForeColor = Color.Red;
                lbFileerrormsg.Text = "上傳失敗";
            }
        }

        protected void gvFile_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "DELETE FROM Files WHERE Id = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvFile.DataKeys[e.RowIndex].Value.ToString()));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    gvFile.EditIndex = -1;
                    BindRptFile();
                    lbFileerrormsg.ForeColor = Color.Green;
                    lbFileerrormsg.Text = "刪除成功";
                }
            }
            catch (Exception ex)
            {
                lbFileerrormsg.ForeColor = Color.Red;
                lbFileerrormsg.Text = "刪除失敗";
            }
        }

        protected void gvFile_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFile.EditIndex = -1;
            lbFileerrormsg.Text = "";
            BindRptFile();
        }
    }
}