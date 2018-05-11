﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eBookweb
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                lbUserHomesuccess.Text = Session["USERNAME"].ToString()+ "您好, 請點選Home以進入首頁"+"";
                Response.Redirect("~/DefaultUser.aspx");
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }

        protected void btUserHomeSignOut_Click(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}