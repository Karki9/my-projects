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
    public partial class AddCategory : System.Web.UI.Page
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

        protected void btn_Category_Click(object sender, EventArgs e)
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            SqlCommand insertIntoCategory = new SqlCommand("insertIntoCategory", mySqlConnection);
            insertIntoCategory.CommandType = CommandType.StoredProcedure;
            
            insertIntoCategory.Parameters.AddWithValue("@category_id", value:categoryId.Text.ToString());
            insertIntoCategory.Parameters.AddWithValue("@category_name", value: categoryName.Text.ToString());
            try
            {
                mySqlConnection.Open();
                insertIntoCategory.ExecuteNonQuery();

            }
            catch (Exception ex)
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