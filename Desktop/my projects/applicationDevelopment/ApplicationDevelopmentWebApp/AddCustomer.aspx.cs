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
    public partial class AddCustomer : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["UserType"].Equals("Admin")))
            {
                Session.RemoveAll();
                HttpContext.Current.Session.Abandon();
                HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                HttpContext.Current.Response.Cookies.Add(new HttpCookie(".ASPXAUTH", ""));

                Response.Redirect("Login.aspx");

            }
            if (!IsPostBack)
            {
                headerText.Text = Session["UserName"].ToString();
            }


        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            try
            {
                string UID = (string)(Session["UserID"].ToString());
                mySqlConnection.Open();
                SqlCommand insertIntoCustomer = new SqlCommand("insertIntoCustomer", mySqlConnection);
                insertIntoCustomer.CommandType = CommandType.StoredProcedure;

                insertIntoCustomer.Parameters.AddWithValue("@customer_id", value: customerID.Text.ToString());
                insertIntoCustomer.Parameters.AddWithValue("@customer_name", value: customerName.Text.ToString());
                insertIntoCustomer.Parameters.AddWithValue("@customer_gender", value: customerGenderRB.SelectedValue.ToString());
                insertIntoCustomer.Parameters.AddWithValue("@user_id", value: UID);

                insertIntoCustomer.ExecuteNonQuery();
                insertIntoCustomer.Dispose();

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                mySqlConnection.Close();
                mySqlConnection.Dispose();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
        protected void btn_logout(object sender, EventArgs e)
        {
            Session.RemoveAll();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            HttpContext.Current.Response.Cookies.Add(new HttpCookie(".ASPXAUTH", ""));

            Response.Redirect("Login.aspx");
        }
    }
}