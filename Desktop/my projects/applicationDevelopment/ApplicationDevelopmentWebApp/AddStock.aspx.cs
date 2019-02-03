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
    public partial class AddStock : System.Web.UI.Page
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

                SqlConnection connection = new SqlConnection(connectionString);
                try
                {
                    connection.Open();
                    SqlCommand productCmd = new SqlCommand("GetIdOfProduct", connection);

                    productCmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader productReader = productCmd.ExecuteReader();


                    if (productReader.HasRows)
                    {
                        productDD.DataSource = productReader;
                        productDD.DataTextField = "product_name";
                        productDD.DataValueField = "product_id";
                        productDD.DataBind();
                        productDD.Items.Insert(0, "Select Product");

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

            if (!(Session["UserType"].Equals("Admin")))
            {
                Response.Redirect("Login.aspx");

            }

            getStockData();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);

            try
            {
                mySqlConnection.Open();
                SqlCommand insertIntoStock = new SqlCommand("insertIntoStock", mySqlConnection);
                SqlCommand insertIntoUserManage = new SqlCommand("insertIntoUserManage", mySqlConnection);
                SqlCommand insertIntoStockProduct = new SqlCommand("insertIntoStockProduct", mySqlConnection);
                insertIntoStock.CommandType = CommandType.StoredProcedure;
                insertIntoUserManage.CommandType = CommandType.StoredProcedure;


                insertIntoStock.Parameters.AddWithValue("@stock_id", value: stockId.Text.ToString());
                insertIntoStock.Parameters.AddWithValue("@stock_name", value: stockName.Text.ToString());
                insertIntoStock.Parameters.AddWithValue("@stock_qty", value: stockQty.Text.ToString());
                insertIntoStock.Parameters.AddWithValue("@stock_price", value: stockPrice.Text.ToString());
                insertIntoStock.Parameters.AddWithValue("@stock_date", value: stockDate.Text.ToString());



                insertIntoUserManage.Parameters.AddWithValue("@stock_id", value: stockId.Text.ToString());
                insertIntoUserManage.Parameters.AddWithValue("@user_id", Session["UserID"].ToString());

                insertIntoStockProduct.Parameters.AddWithValue("@product_id", value: productDD.SelectedValue.ToString());
                insertIntoStockProduct.Parameters.AddWithValue("@stock_id", value: stockId.Text.ToString());
                insertIntoStockProduct.Parameters.AddWithValue("@stock_qty", value: stockQty.Text);


                insertIntoStock.ExecuteNonQuery();
                insertIntoStock.Dispose();


                insertIntoUserManage.ExecuteNonQuery();
                insertIntoUserManage.Dispose();

                insertIntoStockProduct.ExecuteNonQuery();
                insertIntoStockProduct.Dispose();





                getStockData();



            }

            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                mySqlConnection.Close();
                mySqlConnection.Dispose();
                Response.Redirect(Request.Url.AbsoluteUri);
            }

        }


        public void getStockData()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand getStockDetails = new SqlCommand("select * from stock;", connection);

            SqlDataAdapter stockDataAdapter = new SqlDataAdapter(getStockDetails);
            System.Data.DataSet stockDataSet = new System.Data.DataSet();
            stockDataAdapter.Fill(stockDataSet, "StockTable");

            string htmlTable = "<table class='highlight' border='1' cellpadding='0' cellspacing='0'><tr>";
            foreach (DataColumn column in stockDataSet.Tables["StockTable"].Columns)
            {
                htmlTable += "<th class = 'centered'>" + column.ColumnName + "</th>";
            }
            htmlTable += "</tr>";
            foreach (DataRow dr in stockDataSet.Tables["StockTable"].Rows)
            {
                string stockId = dr["stock_id"].ToString();
                string stockName = dr["stock_name"].ToString();
                string stockQty = dr["stock_qty"].ToString();
                string stockPrice = dr["stock_price"].ToString();
                string stockDate = dr["stock_date"].ToString();

                htmlTable += "<tr><td>" + stockId + "</td><td>" + stockName + "</td><td>" + stockQty + "</td><td>" + stockPrice + "</td><td>" + stockDate + "</td></tr>";
            }
            htmlTable += "</table>";
            lblTable.Text = htmlTable;


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
    


    
