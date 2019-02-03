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
    public partial class AddSupplierProduct : System.Web.UI.Page
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
                    SqlCommand supplierCmd = new SqlCommand("GetIdOfSupplier", connection);
                    SqlCommand productCmd = new SqlCommand("GetIdOfProduct", connection);

                    supplierCmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader supplierReader = supplierCmd.ExecuteReader();

                    if (supplierReader.HasRows)
                    {
                        supplierproductSupplierDropDown.DataSource = supplierReader;
                        supplierproductSupplierDropDown.DataTextField = "supplier_name";
                        supplierproductSupplierDropDown.DataValueField = "supplier_id";
                        supplierproductSupplierDropDown.DataBind();

                    }
                    supplierReader.Close();

                    productCmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader productReader = productCmd.ExecuteReader();

                    if (productReader.HasRows)
                    {
                        supplierproductProductDropDown.DataSource = productReader;
                        supplierproductProductDropDown.DataTextField = "product_name";
                        supplierproductProductDropDown.DataValueField = "product_id";
                        supplierproductProductDropDown.DataBind();
                    }
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
            SqlCommand insertIntoSupplierProduct = new SqlCommand("insertIntoSupplierProduct", mySqlConnection);
            insertIntoSupplierProduct.CommandType = CommandType.StoredProcedure;
            insertIntoSupplierProduct.Parameters.Add("@supplier_id", SqlDbType.Int).Value = supplierproductSupplierDropDown.SelectedValue;
            insertIntoSupplierProduct.Parameters.Add("@product_id", SqlDbType.Int).Value = supplierproductProductDropDown.SelectedValue;
        }
    }
}