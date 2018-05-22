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
    public partial class ManagerAccountMgt : System.Web.UI.Page
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
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
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
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
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
                            gvManagerAct.DataSource = dtAct;
                            gvManagerAct.DataBind();
                        }
                        else
                        {
                            dtAct.Rows.Add(dtAct.NewRow());
                            gvManagerAct.DataSource = dtAct;
                            gvManagerAct.DataBind();
                            gvManagerAct.Rows[0].Cells.Clear();
                            gvManagerAct.Rows[0].Cells.Add(new TableCell());
                            gvManagerAct.Rows[0].Cells[0].ColumnSpan = dtAct.Columns.Count;
                            gvManagerAct.Rows[0].Cells[0].Text = "No Data Found ..!";
                            gvManagerAct.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }

                    }
                }
            }
        }

        protected void btManagerActUpload_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into Users values('" + tbManagerActAddUserName.Text + "', '" + tbManagerActAddUserEmail.Text + "', '" + tbManagerActAddUserUnder.Text + "', '" + tbManagerActAddUserDepartment.Text + "','" + tbManagerActAddUserPassword.Text + "',  'User')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lbManagerActmsg.ForeColor = Color.Green;
                    lbManagerActmsg.Text = "新增成功";
                }
            }
            catch (Exception ex)
            {
                lbManagerActmsg.Text = "資料新增失敗";
            }
        }

        protected void gvManagerAct_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvManagerAct.EditIndex = e.NewEditIndex;
            lbManagerActerrormsg.Text = "";
            BindRptAct();
        }

        protected void gvManagerAct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvManagerAct.EditIndex = -1;
            lbManagerActerrormsg.Text = "";
            BindRptAct();
        }

        protected void gvManagerAct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "UPDATE UsersData SET UserName=@UserName, UserEmail=@UserEmail, UserUnder=@UserUnder, UserDepartment=@UserDepartment, UserPassword=@UserPassword, UserType=@UserType WHERE UserId = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserName", (gvManagerAct.Rows[e.RowIndex].FindControl("tbEditManagerActUserName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserEmail", (gvManagerAct.Rows[e.RowIndex].FindControl("tbEditManagerActUserEmail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserUnder", (gvManagerAct.Rows[e.RowIndex].FindControl("tbEditManagerActUserUnder") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserDepartment", (gvManagerAct.Rows[e.RowIndex].FindControl("tbEditManagerActUserDepartment") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserPassword", (gvManagerAct.Rows[e.RowIndex].FindControl("tbEditManagerActPassword") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@UserType", (gvManagerAct.Rows[e.RowIndex].FindControl("tbEditManagerActUserType") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvManagerAct.DataKeys[e.RowIndex].Value.ToString()));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    gvManagerAct.EditIndex = -1;
                    BindRptAct();
                    lbManagerActerrormsg.ForeColor = Color.Green;
                    lbManagerActerrormsg.Text = "修改成功";
                }
            }
            catch (Exception ex)
            {
                lbManagerActerrormsg.ForeColor = Color.Red;
                lbManagerActerrormsg.Text = "上傳失敗";
            }
        }

        protected void gvManagerAct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "DELETE FROM UsersData WHERE UserId = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvManagerAct.DataKeys[e.RowIndex].Value.ToString()));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    gvManagerAct.EditIndex = -1;
                    BindRptAct();
                    lbManagerActerrormsg.ForeColor = Color.Green;
                    lbManagerActerrormsg.Text = "刪除成功";
                }
            }
            catch (Exception ex)
            {
                lbManagerActerrormsg.ForeColor = Color.Red;
                lbManagerActerrormsg.Text = "刪除失敗";
            }
        }

        protected void ddlDep_SelectedIndexChanged(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
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
                            gvManagerAct.DataSource = dtAct;
                            gvManagerAct.DataBind();
                        }
                        else
                        {
                            dtAct.Rows.Add(dtAct.NewRow());
                            gvManagerAct.DataSource = dtAct;
                            gvManagerAct.DataBind();
                            gvManagerAct.Rows[0].Cells.Clear();
                            gvManagerAct.Rows[0].Cells.Add(new TableCell());
                            gvManagerAct.Rows[0].Cells[0].ColumnSpan = dtAct.Columns.Count;
                            gvManagerAct.Rows[0].Cells[0].Text = "No Data Found ..!";
                            gvManagerAct.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }

                    }
                }
            }
        }
    }
}