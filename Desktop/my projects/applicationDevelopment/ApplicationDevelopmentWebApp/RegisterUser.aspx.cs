using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApplicationDevelopmentWebApp
{
    public partial class AddUser : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_addUser(object sender, EventArgs e)
        {

            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            try
            {
                mySqlConnection.Open();
                SqlCommand insertIntoUser = new SqlCommand("insertIntoUser", mySqlConnection);
                insertIntoUser.CommandType = CommandType.StoredProcedure;

                insertIntoUser.Parameters.AddWithValue("@user_id", value: userId.Text.ToString());
                insertIntoUser.Parameters.AddWithValue("@user_username", value: uuname.Text.ToString());
                insertIntoUser.Parameters.AddWithValue("@user_firstname", value: userfirstname.Text.ToString());
                insertIntoUser.Parameters.AddWithValue("@user_lastname", value: userlastname.Text.ToString());
                insertIntoUser.Parameters.AddWithValue("@user_password", value: userpassword.Text.ToString());

                //insertIntoUser.Parameters.AddWithValue("@user_lastname", value: userId.Text.ToString());
                insertIntoUser.Parameters.AddWithValue("@user_address", value: userId.Text.ToString());
                insertIntoUser.Parameters.AddWithValue("@user_dob", value: userdob.Text.ToString());
                insertIntoUser.Parameters.AddWithValue("@user_email", value: useremail.Text.ToString());
                insertIntoUser.Parameters.AddWithValue("@user_type", value: typeOfUser.SelectedValue.ToString());


                insertIntoUser.ExecuteNonQuery();
                insertIntoUser.Dispose();



            }

            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }

            finally
            {
                mySqlConnection.Close();
                Response.Redirect(Request.Url.AbsoluteUri);

            }
        }
        protected void btn_logout(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}

      
