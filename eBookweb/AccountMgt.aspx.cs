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
                BindDep();
                BindRptAct();
            }
        }

        private void BindDep()
        {
            String CS =ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                // try to open Category for seleting cato
                SqlCommand cmd = new SqlCommand("select * from Director", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlDep.DataSource = dt;
                    ddlDep.DataTextField = "Department";
                    ddlDep.DataValueField = "DirectorId";
                    ddlDep.DataBind();
                    ddlDep.Items.Insert(0, new ListItem("-選擇分類-", "0"));
                }
            }
        }

        private void BindRptAct()
        {
            String CS =ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from UsersData", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtAct = new DataTable();
                        sda.Fill(dtAct);
                        if (dtAct.Rows.Count > 0)
                        {
                            gvAct.DataSource = dtAct;
                            gvAct.DataBind();
                        }
                        else
                        {
                            dtAct.Rows.Add(dtAct.NewRow());
                            gvAct.DataSource = dtAct;
                            gvAct.DataBind();
                            gvAct.Rows[0].Cells.Clear();
                            gvAct.Rows[0].Cells.Add(new TableCell());
                            gvAct.Rows[0].Cells[0].ColumnSpan = dtAct.Columns.Count;
                            gvAct.Rows[0].Cells[0].Text = "No Data Found ..!";
                            gvAct.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }

                    }
                }
            }
        }

        protected void btActUpload_Click(object sender, EventArgs e)
        {
            try
            {
                String CS =ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into Users values('" + tbActAddUserName.Text + "', '" + tbActAddUserEmail.Text + "', '" + tbActAddUserUnder.Text + "', '" + tbActAddUserDepartment.Text + "','" + tbActAddUserPassword.Text + "',  'User')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lbActmsg.ForeColor = Color.Green;
                    lbActmsg.Text = "新增成功";
                }
            }
            catch (Exception ex)
            {
                lbActmsg.Text = "資料新增失敗";
            }
        }

        protected void gvAct_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAct.EditIndex = e.NewEditIndex;
            lbActerrormsg.Text = "";
            BindRptAct();
        }

        protected void gvAct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAct.EditIndex = -1;
            lbActerrormsg.Text = "";
            BindRptAct();
        }

        protected void gvAct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                String CS =ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "UPDATE UsersData SET UserName=@UserName, UserEmail=@UserEmail, UserUnder=@UserUnder, UserDepartment=@UserDepartment, UserPassword=@UserPassword, UserType=@UserType WHERE UserId = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserName", (gvAct.Rows[e.RowIndex].FindControl("tbEditActUserName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserEmail", (gvAct.Rows[e.RowIndex].FindControl("tbEditActUserEmail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserUnder", (gvAct.Rows[e.RowIndex].FindControl("tbEditUserActUserUnder") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserDepartment", (gvAct.Rows[e.RowIndex].FindControl("tbEditUserActUserDepartment") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserPassword", (gvAct.Rows[e.RowIndex].FindControl("tbEditUserActPassword") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserType", (gvAct.Rows[e.RowIndex].FindControl("tbActUserType") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvAct.DataKeys[e.RowIndex].Value.ToString()));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    gvAct.EditIndex = -1;
                    BindRptAct();
                    lbActerrormsg.ForeColor = Color.Green;
                    lbActerrormsg.Text = "修改成功";
                }
            }
            catch (Exception ex)
            {
                lbActerrormsg.ForeColor = Color.Red;
                lbActerrormsg.Text = "上傳失敗";
            }
        }

        protected void gvAct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                String CS =ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "DELETE FROM UsersData WHERE UserId = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvAct.DataKeys[e.RowIndex].Value.ToString()));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    gvAct.EditIndex = -1;
                    BindRptAct();
                    lbActerrormsg.ForeColor = Color.Green;
                    lbActerrormsg.Text = "刪除成功";
                }
            }
            catch (Exception ex)
            {
                lbActerrormsg.ForeColor = Color.Red;
                lbActerrormsg.Text = "刪除失敗";
            }
        }

        protected void ddlDep_SelectedIndexChanged(object sender, EventArgs e)
        {
            String CS =ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from UsersData where userDepartment = '" + ddlDep.SelectedItem.ToString() + "' ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtAct = new DataTable();
                        sda.Fill(dtAct);


                        if (dtAct.Rows.Count > 0)
                        {
                            gvAct.DataSource = dtAct;
                            gvAct.DataBind();
                        }
                        else
                        {
                            dtAct.Rows.Add(dtAct.NewRow());
                            gvAct.DataSource = dtAct;
                            gvAct.DataBind();
                            gvAct.Rows[0].Cells.Clear();
                            gvAct.Rows[0].Cells.Add(new TableCell());
                            gvAct.Rows[0].Cells[0].ColumnSpan = dtAct.Columns.Count;
                            gvAct.Rows[0].Cells[0].Text = "No Data Found ..!";
                            gvAct.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }

                    }
                }
            }
        }
    }
}