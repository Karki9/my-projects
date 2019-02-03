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
    public partial class AddUserManage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection(connectionString);
                try
                {
                    connection.Open();
                    SqlCommand userCmd = new SqlCommand("GetIdOfProduct", connection);
                    SqlCommand stockCmd = new SqlCommand("GetIdOfStock", connection);

                    userCmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader userReader = userCmd.ExecuteReader();


                    if (userReader.HasRows)
                    {
                        usermanageUserDropDown.DataSource = userReader;
                        usermanageUserDropDown.DataTextField = "user_name";
                        usermanageUserDropDown.DataValueField = "user_id";
                        usermanageUserDropDown.DataBind();

                    }
                    userReader.Close();

                    stockCmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader stockReader = stockCmd.ExecuteReader();


                    if (stockReader.HasRows)
                    {
                        usermanageStockDropDown.DataSource = stockReader;
                        usermanageStockDropDown.DataTextField = "stock_name";
                        usermanageStockDropDown.DataValueField = "stock_id";
                        usermanageStockDropDown.DataBind();

                    }
                    stockReader.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            SqlCommand insertIntoProduct = new SqlCommand("insertIntoProduct", mySqlConnection);
            insertIntoProduct.CommandType = CommandType.StoredProcedure;
            insertIntoProduct.Parameters.Add("@user_id", SqlDbType.Int).Value = usermanageUserDropDown.SelectedValue;
            insertIntoProduct.Parameters.Add("@stock_id", SqlDbType.Int).Value = usermanageStockDropDown.SelectedValue;
            try
            {
                mySqlConnection.Open();
                insertIntoProduct.ExecuteNonQuery();

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
    }
}