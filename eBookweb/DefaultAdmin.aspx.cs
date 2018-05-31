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
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                using (MySqlCommand cmd = new MySqlCommand("select * from FilesData order by FileId DESC", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
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
            using (MySqlConnection con = new MySqlConnection(CS))
            {

                using (MySqlCommand cmd = new MySqlCommand("select * from FilesData where FileCategoryIndex = '" + ddlDefaultAdminCat.SelectedValue + "'", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
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
                    ddlDefaultAdminCat.DataSource = dt;
                    ddlDefaultAdminCat.DataTextField = "BookName";
                    ddlDefaultAdminCat.DataValueField = "BookSelectedValue";
                    ddlDefaultAdminCat.DataBind();
                    ddlDefaultAdminCat.Items.Insert(0, new ListItem("-選擇分類-", "0"));
                }
            }
        }
    }
}