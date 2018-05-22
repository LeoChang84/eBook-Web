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
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                // try to open Category for seleting cato
                SqlCommand cmd = new SqlCommand("select * from DepCat", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlDep.DataSource = dt;
                    ddlDep.DataTextField = "DepName";
                    ddlDep.DataValueField = "DepId";
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
                using (SqlCommand cmd = new SqlCommand("select * from Users" , con))
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

        protected void btActUploadn_Click(object sender, EventArgs e)
        {   
            try
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
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "UPDATE Users SET Username=@Username,Password=@Password,Email=@Email,Usertype=@Usertype WHERE Uid = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", (gvAct.Rows[e.RowIndex].FindControl("tbEditUserNameAct") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", (gvAct.Rows[e.RowIndex].FindControl("tbEditPwdAct") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", (gvAct.Rows[e.RowIndex].FindControl("tbEditEmailAct") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Usertype", (gvAct.Rows[e.RowIndex].FindControl("tbUsertypeAct") as TextBox).Text.Trim());
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
                String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "DELETE FROM Users WHERE Uid = @id";
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
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Users where userDep = '" + ddlDep.SelectedItem.ToString() + "' ", con))
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