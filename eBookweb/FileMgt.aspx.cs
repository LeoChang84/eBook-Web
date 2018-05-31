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

namespace eBookweb
{
    public partial class FileMgt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCat();
                BindRptFile();
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

        private void BindRptFile()
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                using (MySqlCommand cmd = new MySqlCommand("select * from FilesData", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
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
                using (MySqlConnection con = new MySqlConnection(CS))
                {
                    string query = "UPDATE FilesData SET FileName=@Name, FileLink=@Link, FileCategoryIndex=@Index, FileUploadDepartment=@Upload WHERE FileId = @id";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", (gvFile.Rows[e.RowIndex].FindControl("tbEditNameFile") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Link", (gvFile.Rows[e.RowIndex].FindControl("tbEditLinkFile") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Index", (gvFile.Rows[e.RowIndex].FindControl("tbEditIndexFile") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Upload", (gvFile.Rows[e.RowIndex].FindControl("tbEditUploadFile") as TextBox).Text.Trim());
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
                using (MySqlConnection con = new MySqlConnection(CS))
                {
                    string query = "DELETE FROM FilesData WHERE FileId = @id";
                    MySqlCommand cmd = new MySqlCommand(query, con);
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

        protected void btCatUpload_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(CS))
                {
                    MySqlCommand cmd = new MySqlCommand("insert into BookCategory (BookName, BookSelectedValue) values( '" + tbCatName.Text + "', '" + tbCatValue.Text + "' )", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lbCatmsg.ForeColor = Color.Green;
                    lbCatmsg.Text = "新增成功";
                }
            }
            catch (Exception ex)
            {
                lbCatmsg.ForeColor = Color.Red;
                lbCatmsg.Text = "新增失敗";
            }
        }

        protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
        {

            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                using (MySqlCommand cmd = new MySqlCommand("select * from FilesData where FileCategoryIndex = '"+ ddlCat.SelectedValue +"' ", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
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
    }
}