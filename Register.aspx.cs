using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealProjectB2
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divMsg.Visible = false;
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            if (checkFieldValue() == false)
            {
                int result = saveReg();
                if (result > 0)
                {
                    ClearFieldValue();
                    divMsg.Visible = true;
                    lblMsg.Text = "save successfully";
                }
                else
                {
                    divMsg.Visible = true;
                    lblMsg.Text = "save failed";
                }
            }
        }

        private int saveReg()
        {
            int result = 0;
            string Constr = "Data Source = .; Initial Catalog=RealProjectB2; Integrated Security = true";
            SqlConnection cnn;
            cnn = new SqlConnection(Constr);

            string query = @"insert into UserRegistration
            (UserName,FirstName,MiddleName,LastName,DateOfBirth,Gender,ContactNo,Emal,Address,ReligionId,EntryDate,UserImage)
            values
            (@UserName,@FirstName,@MiddleName,@LastName,@DateOfBirth,@Gender,@ContactNo,@Emal,@Address,@ReligionId,GETDATE(),@UserImage)";

            using(SqlCommand cmd = new SqlCommand(query,cnn))
            {
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@DateOfBirth", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", DDLGender.SelectedValue);
                cmd.Parameters.AddWithValue("@ContactNo", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Emal", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@ReligionId", DDLReligion.SelectedValue);
                //cmd.Parameters.AddWithValue("@EntryDate", EntryDate.Text.Trim());
                cmd.Parameters.AddWithValue("@UserImage", "1.png");

                cnn.Open();
                result = cmd.ExecuteNonQuery();
            }

            return result;
        }

        private void ClearFieldValue()
        {
            txtUserName.Text = "";
            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            txtDOB.Text = "";
            DDLGender.SelectedValue = "0";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
            DDLReligion.SelectedValue = "0";
            FlUserImage.PostedFile.InputStream.Dispose();
        }
        private bool checkFieldValue()
        {
            bool IsReq = false;

            if (txtUserName.Text == "")
            {
                lblMsg.Text = "Username can't be empty";
                txtUserName.Focus();
                IsReq = true;
            }
            else if (txtFirstName.Text == "")
            {
                lblMsg.Text = "First name can't be empty";
                txtFirstName.Focus();
                IsReq = true;
            }

            else if (txtLastName.Text == "")
            {
                lblMsg.Text = "Last name can't be empty";
                txtLastName.Focus();
                IsReq = true;
            }
            else if (txtPhone.Text == "")
            {
                lblMsg.Text = "Phone number can't be empty";
                txtPhone.Focus();
                IsReq = true;
            }
            else if (txtEmail.Text == "")
            {
                lblMsg.Text = "Email can't be empty";
                txtEmail.Focus();
                IsReq = true;
            }
            else if (txtDOB.Text == "")
            {
                lblMsg.Text = "Date of Birth can't be empty";
                txtDOB.Focus();
                IsReq = true;
            }
            else if (DDLGender.SelectedValue == "0")
            {
                lblMsg.Text = "Gender can't be empty";

                IsReq = true;
            }
            else if (DDLReligion.SelectedValue == "0")
            {
                lblMsg.Text = "Religion can't be empty";

                IsReq = true;
            }
            else if (txtAddress.Text == "")
            {
                lblMsg.Text = "Address can't be empty";
                txtAddress.Focus();
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
    }
}