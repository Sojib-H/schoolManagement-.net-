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
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divMsg.Visible = false;
                showContact();
                submitBtn.Text = "Submit";
                cancelBtn.Visible = false;
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            int result = 0;
            if (submitBtn.Text == "Submit")
            {
                if (checkFieldValue() == false)
                {
                    result = saveReg();
                    if (result > 0)
                    {
                        ClearFieldValue();
                        divMsg.Visible = true;
                        lblMsg.Text = "save successfully";
                        show.Visible = true;
                        showContact();
                    }
                    else
                    {
                        show.Visible = false;
                        divMsg.Visible = true;
                        lblMsg.Text = "save failed";
                        show.Visible = false;
                    }
                }

            }
            else
            {
                if (checkFieldValue() == false)
                {
                    result = updateReg();
                    if (result > 0)
                    {
                        divMsg.Visible = true;
                        lblMsg.Text = "Update successfully";
                        show.Visible = true;
                        showContact();
                        ClearFieldValue();
                        submitBtn.Text = "Submit";
                        cancelBtn.Visible = false;

                    }
                    else
                    {

                        divMsg.Visible = true;
                        lblMsg.Text = "Update failed";
                        show.Visible = false;
                    }
                }
            }

        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            cancelBtn.Visible = false;
            ClearFieldValue();
            submitBtn.Text = "Submit";
            divMsg.Visible = false;
            lblMsg.Text = "";
        }

        private int saveReg()
        {
            int result = 0;
            string Constr = "Data Source = .; Initial Catalog=RealProjectB2; Integrated Security = true";
            SqlConnection cnn;
            cnn = new SqlConnection(Constr);

            string query = @"insert into Contact
            (Name,Contact,Email,Social,Entry_by,Entry_date)
            values
            (@Name,@Contact,@Email,@Social,@Entry_by,GETDATE())";

            using (SqlCommand cmd = new SqlCommand(query, cnn))
            {
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", txtContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Social", txtSocial.Text.Trim());
                cmd.Parameters.AddWithValue("@Entry_by", Session["UserId"]);


                cnn.Open();
                result = cmd.ExecuteNonQuery();
                cnn.Close();
            }

            return result;
        }

        private void showContact()
        {
            string ConnectionString = "Data Source = .; Initial Catalog=RealProjectB2; Integrated Security = true";
            DataTable dt = new DataTable();
            using (SqlConnection cnn = new SqlConnection(ConnectionString))
            {
                string query = "select * from Contact";
                SqlDataAdapter sda = new SqlDataAdapter(query, cnn);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                dt = ds.Tables[0];
                ContactInfo.DataSource = dt;
                ContactInfo.DataBind();
                if (dt.Rows.Count <= 0)
                {
                    lblDataNotice.Text = "No Data Availabe in Database";
                }
                else
                {
                    lblDataNotice.Text = "";
                }

            }
        }

        private bool checkFieldValue()
        {
            bool IsReq = false;

            if (txtName.Text == "")
            {
                lblMsg.Text = "Name can't be empty";
                txtName.Focus();
                IsReq = true;
            }
            else if (txtContactNumber.Text == "")
            {
                lblMsg.Text = "Contact Number can't be empty";
                txtContactNumber.Focus();
                IsReq = true;
            }

            else if (txtEmail.Text == "")
            {
                lblMsg.Text = "Email can't be empty";
                txtEmail.Focus();
                IsReq = true;
            }
            else if (txtSocial.Text == "")
            {
                lblMsg.Text = "Social Link can't be empty";
                txtSocial.Focus();
                IsReq = true;
            }

            if (IsReq == true)
            {
                divMsg.Visible = true;
            }
            else
            {
                divMsg.Visible = false;
            }

            return IsReq;
        }

        private void ClearFieldValue()
        {
            txtName.Text = "";
            txtContactNumber.Text = "";
            txtEmail.Text = "";
            txtSocial.Text = "";

        }

        protected void ContactInfo_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editContact")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                HiddenField hdnCid = (HiddenField)ContactInfo.Rows[rowIndex].Cells[0].FindControl("hdnCid");
                LoadContact(int.Parse(hdnCid.Value));
                cancelBtn.Visible = true;
                divMsg.Visible = false;
                lblMsg.Text = "";
            }
            if (e.CommandName == "deleteContact")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                HiddenField hdnCid = (HiddenField)ContactInfo.Rows[rowIndex].Cells[0].FindControl("hdnCid");
                DeleteContact(int.Parse(hdnCid.Value));
                divMsg.Visible = true;
                lblMsg.Text = "Delete Successfully";
            }
        }

        private void LoadContact(int cid)
        {
            string ConnectionString = "Data Source = .; Initial Catalog=RealProjectB2; Integrated Security = true";
            DataTable dt = new DataTable();
            using (SqlConnection cnn = new SqlConnection(ConnectionString))
            {
                string query = "select * from [dbo].[Contact] where CID = " + cid + "";
                SqlDataAdapter sda = new SqlDataAdapter(query, cnn);

                DataSet ds = new DataSet();

                sda.Fill(ds);
                dt = ds.Tables[0];

            }
            if (dt.Rows.Count > 0)
            {
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtContactNumber.Text = dt.Rows[0]["Contact"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtSocial.Text = dt.Rows[0]["Social"].ToString();

                hdnEditCid.Value = dt.Rows[0]["CID"].ToString();
                submitBtn.Text = "Update";


            }
        }

        private int updateReg()
        {
            int result = 0;
            string Constr = "Data Source = .; Initial Catalog=RealProjectB2; Integrated Security = true";
            SqlConnection cnn;
            cnn = new SqlConnection(Constr);

            string query = @"UPDATE [dbo].[Contact]
                       SET Name = @Name,Contact = @Contact,Email = @Email,Social = @Social,Updated_by = @Updated_by
                          ,Updated_date = GETDATE()
                            WHERE CID = " + hdnEditCid.Value + "";

            using (SqlCommand cmd = new SqlCommand(query, cnn))
            {
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", txtContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Social", txtSocial.Text.Trim());
                cmd.Parameters.AddWithValue("@Updated_by", Session["UserId"]);


                cnn.Open();
                result = cmd.ExecuteNonQuery();
                cnn.Close();
            }

            return result;
        }

        private void DeleteContact(int cid)
        {
            string ConnectionString = "Data Source = .; Initial Catalog=RealProjectB2; Integrated Security = true";
            //DataTable dt = new DataTable();
            using (SqlConnection cnn = new SqlConnection(ConnectionString))
            {
                string query = @"DELETE FROM [dbo].[Contact] WHERE CID = "+ cid +"";
                SqlCommand cmd = new SqlCommand(query, cnn);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                showContact();

            }
        }


    }
}