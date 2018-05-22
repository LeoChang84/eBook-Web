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
using System.Collections;

namespace eBookweb
{
    public partial class DefaultAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCat();
                BindFilesRepeater();
            }
        }
        private void BindFilesRepeater()
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Files order by Id", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtDefaultUser = new DataTable();
                        sda.Fill(dtDefaultUser);
                        RptDefaultAdmin.DataSource = dtDefaultUser;
                        RptDefaultAdmin.DataBind();

                        //Create the PagedDataSource that will be used in paging
                        PagedDataSource pgitems = new PagedDataSource();
                        pgitems.DataSource = dtDefaultUser.DefaultView;
                        pgitems.AllowPaging = true;

                        //Control page size from here 
                        pgitems.PageSize = 12;
                        pgitems.CurrentPageIndex = PageNumber;
                        if (pgitems.PageCount > 1)
                        {
                            rptPaging.Visible = true;
                            ArrayList pages = new ArrayList();
                            for (int i = 0; i <= pgitems.PageCount - 1; i++)
                            {
                                pages.Add((i + 1).ToString());
                            }
                            rptPaging.DataSource = pages;
                            rptPaging.DataBind();
                        }
                        else
                        {
                            rptPaging.Visible = false;
                        }

                        //Finally, set the datasource of the repeater
                        RptDefaultAdmin.DataSource = pgitems;
                        RptDefaultAdmin.DataBind();

                    }
                }

            }

 
        }

        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                {
                    return Convert.ToInt32(ViewState["PageNumber"]);
                }
                else
                {
                    return 0;
                }
            }
            set { ViewState["PageNumber"] = value; }
        }
        protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            BindFilesRepeater();
        }

        protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["db4LoginConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("select * from Files where FileCat = '" + ddlDefaultAdminCat.SelectedItem.ToString() + "'", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtDefaultUser = new DataTable();
                        sda.Fill(dtDefaultUser);
                        RptDefaultAdmin.DataSource = dtDefaultUser;
                        RptDefaultAdmin.DataBind();

                        //Create the PagedDataSource that will be used in paging
                        PagedDataSource pgitems = new PagedDataSource();
                        pgitems.DataSource = dtDefaultUser.DefaultView;
                        pgitems.AllowPaging = true;

                        //Control page size from here 
                        pgitems.PageSize = 12;
                        pgitems.CurrentPageIndex = PageNumber;
                        if (pgitems.PageCount > 1)
                        {
                            rptPaging.Visible = true;
                            ArrayList pages = new ArrayList();
                            for (int i = 0; i <= pgitems.PageCount - 1; i++)
                            {
                                pages.Add((i + 1).ToString());
                            }
                            rptPaging.DataSource = pages;
                            rptPaging.DataBind();
                        }
                        else
                        {
                            rptPaging.Visible = false;
                        }

                        //Finally, set the datasource of the repeater
                        RptDefaultAdmin.DataSource = pgitems;
                        RptDefaultAdmin.DataBind();

                    }
                }
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
                    ddlDefaultAdminCat.DataSource = dt;
                    ddlDefaultAdminCat.DataTextField = "CatName";
                    ddlDefaultAdminCat.DataValueField = "CatId";
                    ddlDefaultAdminCat.DataBind();
                    ddlDefaultAdminCat.Items.Insert(0, new ListItem("-選擇分類-", "0"));
                }
            }
        }
    }
}