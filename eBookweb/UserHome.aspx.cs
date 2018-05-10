using System;
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
                lbUserHomesuccess.Text = "Login Success, Welcome "+Session["USERNAME"].ToString()+"";
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