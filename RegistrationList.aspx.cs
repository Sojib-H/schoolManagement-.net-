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
    public partial class RegistrationList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblDataNotice.Visible = false;
                LoadGridData();
            }
        }

        private void LoadGridData()
        {
            string religion = DDLReligion.SelectedValue;
            string gender = DDLGender.SelectedValue;
            string ConnectionString = "Data Source = .; Initial Catalog=RealProjectB2; Integrated Security = true";
            DataTable dt = new DataTable();
            SqlConnection cnn = new SqlConnection(ConnectionString);

            string query = @"select UserId,UserName,
                            (FirstName+ ' '+ISNULL(MiddleName,'')+' '+LastName) as Full_Name,
                            (case when Gender=1 then 'Male'
                            when Gender = 2 then 'Female' else 'Other' end) as Gender
                            ,FORMAT (DateOfBirth, 'dd-MM-yy') as Date_Of_Birth
                            ,ContactNo,ReligionName 
                            from UserRegistration inner join Conf_Religion on UserRegistration.ReligionId = Conf_Religion.ReligionId
                            where (UserRegistration.ReligionId = " + religion + " or " + religion + @"=0 )
                            and (Gender = " + gender + " or " + gender + "=0)";

            using (SqlCommand cmd = new SqlCommand(query, cnn))
            {
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                cnn.Open();

                sda.SelectCommand = cmd;
                sda.Fill(ds);
                dt = ds.Tables[0];
            }

            if(dt.Rows.Count> 0)
            {
                lblDataNotice.Visible = false;
                gvRegList.DataSource = dt;
                gvRegList.DataBind();
            }
            else
            {
                lblDataNotice.Visible = true;
                lblDataNotice.Text = "No Record Found";
                gvRegList.DataSource = null;
                gvRegList.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }
    }
}