using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealProjectB2
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divMsg.Visible = false;
                RememberMe();
            }
        }

        private void RememberMe()
        {
            if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null)
            {
                txtEmail.Text = Request.Cookies["Username"].Value;
                txtPassword.Attributes["Value"] = Request.Cookies["Password"].Value;
            }
            else
            {
                txtEmail.Text = "";
                txtPassword.Attributes["Value"] = "";
            }

        }

        private DataTable loginCheck( string UserName, string Password)
        {
            DataTable dt = new DataTable();
            string Constr = "Data Source = .; Initial Catalog=RealProjectB2; Integrated Security = true";
            SqlConnection cnn;
            cnn = new SqlConnection(Constr);
            SqlCommand cmd;

            string sqlStr = @"select UserAuth.UserId,(UserRegistration.FirstName+ ' ' + ISNULL( UserRegistration.MiddleName,'')+' ' +UserRegistration.LastName) as FullName ,UserAuth.Password,UserRegistration.UserImage
            from UserAuth inner join UserRegistration on UserAuth.UserId = UserRegistration.UserId

            where UserAuth.isActive = 1 AND UserAuth.UserName = '" + UserName + "' AND UserAuth.Password = '" + Password + "'";
            SqlDataAdapter sda = new SqlDataAdapter();

            DataSet ds = new DataSet();
            try
            {
                cnn.Open();
                cmd = new SqlCommand(sqlStr,cnn);
                sda.SelectCommand = cmd;
                sda.Fill(ds);
                dt = ds.Tables[0];
                cnn.Close();
            }
            catch (Exception)
            {

                throw;
            }

            return dt;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (checkFieldValue() == false)
            {
                DataTable dtloginInfo = new DataTable();
                dtloginInfo = loginCheck(txtEmail.Text.Trim(), txtPassword.Text.Trim());
                if (dtloginInfo.Rows.Count>0)
                {
                    Session["UserId"] = dtloginInfo.Rows[0]["UserId"].ToString();
                    Session["Username"] = dtloginInfo.Rows[0]["FullName"].ToString();
                    CreateCookie();
                    Response.Redirect("~/AdminHome.aspx");
                }
                else
                {
                    lblMsg.Text = "Username or Password is incorrect";
                    divMsg.Visible = true;
                }
            }
        }

        private void CreateCookie()
        {
            if (CheckBoxRemember.Checked)
            {
                HttpCookie auth = new HttpCookie("auth");
                auth["Username"] = "";
                auth["Password"] = "";
                Response.Cookies.Add(auth);

                Response.Cookies["Username"].Expires = DateTime.Now.AddMinutes(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(30);

                Response.Cookies["Username"].Value = txtEmail.Text.Trim();
                Response.Cookies["Password"].Value = txtPassword.Text.Trim();
            }
            else
            {
                Response.Cookies["Username"].Expires = DateTime.Now.AddMinutes(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(-1);
            }


        }

        private bool checkFieldValue()
        {
            bool IsReq = false;

            if (txtEmail.Text == "")
            {
                lblMsg.Text = "Username can't be empty";
                txtEmail.Focus();
                IsReq = true;
            }
            else if (txtPassword.Text == "")
            {
                lblMsg.Text = "Password can't be empty";
                txtPassword.Focus();
                IsReq = true;
            }

            if (IsReq == true)
            {
                divMsg.Visible = true;
            }
            else
            {
                divMsg.Visible = true;
            }

            return IsReq;
        }
    }
}