using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApplicationDevelopmentWebApp
{
    public partial class AddSales : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

        string username = HttpContext.Current.User.Identity.Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                headerText.Text = Session["UserName"].ToString();

                SqlConnection connection = new SqlConnection(connectionString);
                try
                {
                    connection.Open();
                    SqlCommand stockCmd = new SqlCommand("GetIdOfStock", connection);
                    SqlCommand productCmd = new SqlCommand("GetIdOfProduct", connection);
                    SqlCommand customerCmd = new SqlCommand("GetIdOfCustomer", connection);

                    stockCmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader stockReader = stockCmd.ExecuteReader();


                    if (stockReader.HasRows)
                    {
                        salesStockDropDown.DataSource = stockReader;
                        salesStockDropDown.DataTextField = "stock_name";
                        salesStockDropDown.DataValueField = "stock_id";
                        salesStockDropDown.DataBind();
                        salesStockDropDown.Items.Insert(0, "Select Stock");

                    }
                    stockReader.Close();

                    productCmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader productReader = productCmd.ExecuteReader();


                    if (productReader.HasRows)
                    {
                        salesProductDropDown.DataSource = productReader;
                        salesProductDropDown.DataTextField = "product_name";
                        salesProductDropDown.DataValueField = "product_id";
                        salesProductDropDown.DataBind();
                        salesProductDropDown.Items.Insert(0, "Select Product");

                    }
                    productReader.Close();

                    customerCmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader customerReader = customerCmd.ExecuteReader();

                    if (customerReader.HasRows)
                    {
                        salesCustomerDropDown.DataSource = customerReader;
                        salesCustomerDropDown.DataTextField = "customer_name";
                        salesCustomerDropDown.DataValueField = "customer_id";
                        salesCustomerDropDown.DataBind();
                        salesCustomerDropDown.Items.Insert(0, "Select Customer");
                    }
                    customerReader.Close();
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

                SqlCommand insertIntoSales = new SqlCommand("insertIntoSales", mySqlConnection);
                insertIntoSales.CommandType = CommandType.StoredProcedure;

                insertIntoSales.Parameters.AddWithValue("@sales_id", value: salesId.Text.ToString());
                insertIntoSales.Parameters.AddWithValue("@sales_amount", value: salesAmount.Text.ToString());
                insertIntoSales.Parameters.AddWithValue("@sales_qty", value: salesQty.Text.ToString());
                insertIntoSales.Parameters.AddWithValue("@billing_date", value: billingDate.Text.ToString());
                insertIntoSales.Parameters.AddWithValue("@customer_id", value: salesCustomerDropDown.SelectedValue.ToString());
                insertIntoSales.Parameters.AddWithValue("@product_id", value: salesProductDropDown.SelectedValue.ToString());
                insertIntoSales.Parameters.AddWithValue("@stock_id", value: salesStockDropDown.SelectedValue.ToString());
                insertIntoSales.Parameters.AddWithValue("@total_amount", value: totalAmount.Text.ToString());

                insertIntoSales.ExecuteNonQuery();
                insertIntoSales.Dispose();

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

        public class Bills1
        {
            public string DeptId3 { get; set; }
        }


        [WebMethod]
        public static List<Bills1> PopulateDropDownList4(string itemNamed)
        {
            DataTable dt = new DataTable();
            List<Bills1> objDept3 = new List<Bills1>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString))
            {
                string abc = "select product_rate from product where product_id = @product_id";
                using (SqlCommand cmd = new SqlCommand(abc, con))
                {
                    cmd.Parameters.AddWithValue("@product_id", value: itemNamed);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            objDept3.Add(new Bills1
                            {
                                DeptId3 = dt.Rows[i]["product_rate"].ToString()

                            });
                        }
                    }
                    else
                    {

                    }
                    con.Close();

                    return objDept3;
                }
            }
        }

    }
}
