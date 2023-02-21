using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealProjectB2.AdminLayout
{
    public partial class AdminMain : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null && Session["UserId"] != null)
                {
                    lblUsername.Text = Session["Username"].ToString();
                    string UserId = Session["UserId"].ToString();
                    imguser.ImageUrl = "~/Asset/img/users/" + UserId + ".png";
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
            }
        }

        protected void btnLogout2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}