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
    public partial class AddSupplier : System.Web.UI.Page
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

                SqlConnection connection = new  SqlConnection(connectionString);
                try
                {
                    connection.Open();

                    SqlCommand productCmd = new SqlCommand("GetIdOfProduct", connection);

                    productCmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader productReader = productCmd.ExecuteReader();

                    if (productReader.HasRows)
                    {
                        supplierProductDropDown.DataSource = productReader;
                        supplierProductDropDown.DataTextField = "product_name";
                        supplierProductDropDown.DataValueField = "product_id";
                        supplierProductDropDown.DataBind();
                    }

                    productReader.Close();


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

            try
            {

                mySqlConnection.Open();
                SqlCommand insertIntoSupplier = new SqlCommand("insertIntoSupplier", mySqlConnection);
                SqlCommand insertIntoSupplierProduct = new SqlCommand("insertIntoSupplierProduct", mySqlConnection);

                insertIntoSupplier.CommandType = CommandType.StoredProcedure;
                insertIntoSupplierProduct.CommandType = CommandType.StoredProcedure;

                insertIntoSupplier.Parameters.AddWithValue("@supplier_id", value: supplierId.Text.ToString());
                insertIntoSupplier.Parameters.AddWithValue("@supplier_firstname", value: supplierFirstName.Text.ToString());
                insertIntoSupplier.Parameters.AddWithValue("@supplier_lastname", value: supplierLastName.Text.ToString());
                insertIntoSupplier.Parameters.AddWithValue("@supplier_address", value: supplierAddress.Text.ToString());
                insertIntoSupplier.Parameters.AddWithValue("@supplier_gender", value: supplierGenderRB.SelectedValue.ToString());
                insertIntoSupplier.Parameters.AddWithValue("@user_id", value: Session["UserID"].ToString());


                insertIntoSupplierProduct.Parameters.AddWithValue("@supplier_id", value: supplierId.Text.ToString());
                insertIntoSupplierProduct.Parameters.AddWithValue("@product_id", value: supplierProductDropDown.SelectedValue.ToString());

                insertIntoSupplier.ExecuteNonQuery();
                insertIntoSupplierProduct.ExecuteNonQuery();

                insertIntoSupplier.Dispose();
                insertIntoSupplierProduct.Dispose();


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
