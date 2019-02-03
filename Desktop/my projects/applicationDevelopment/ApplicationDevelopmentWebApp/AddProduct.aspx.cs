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
    public partial class WebForm : System.Web.UI.Page
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

            displayProduct();
            if (!IsPostBack)
            {
                headerText.Text = Session["UserName"].ToString();

                SqlConnection connection = new SqlConnection(connectionString);
                try
                {
                    connection.Open();
                    SqlCommand categoryCmd = new SqlCommand("GetIdOfCategory", connection);
                    SqlCommand stockCmd = new SqlCommand("GetIdOfStock", connection);

                    
                    categoryCmd.CommandType = CommandType.StoredProcedure;
                    stockCmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader categoryReader = categoryCmd.ExecuteReader();

                    if (categoryReader.HasRows)
                    {
                        productCategoryDropDown.DataSource = categoryReader;
                        productCategoryDropDown.DataTextField = "category_name";
                        productCategoryDropDown.DataValueField = "category_id";
                        productCategoryDropDown.DataBind();
                    }
                    categoryReader.Close();

                    SqlDataReader stockReader = stockCmd.ExecuteReader();

                    if (stockReader.HasRows)
                    {
                        productStockDropDown.DataSource = stockReader;
                        productStockDropDown.DataTextField = "stock_name";
                        productStockDropDown.DataValueField = "stock_id";
                        productStockDropDown.DataBind();
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

 

        protected void Button1_Click1(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            try
            {
                
                mySqlConnection.Open();
                SqlCommand insertIntoProduct = new SqlCommand("insertIntoProduct",mySqlConnection);
                 
                insertIntoProduct.CommandType = CommandType.StoredProcedure;

                
                insertIntoProduct.Parameters.AddWithValue("@product_id", value: productId.Text.ToString());
                insertIntoProduct.Parameters.AddWithValue("@product_name", value: productName.Text.ToString());
                insertIntoProduct.Parameters.AddWithValue("@product_rate", productRate.Text);
                insertIntoProduct.Parameters.AddWithValue("@user_id", value: Session["UserID"].ToString());
                insertIntoProduct.Parameters.AddWithValue("@category_id", value: productCategoryDropDown.SelectedValue.ToString());
                
                


                

                insertIntoProduct.ExecuteNonQuery();
                insertIntoProduct.Dispose();
;
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

        private void displayProduct()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Product", con);

            SqlDataAdapter dA = new SqlDataAdapter(cmd);
            System.Data.DataSet dS = new System.Data.DataSet();
            dA.Fill(dS, "tb");

            string htmlTable = "<table class='highlight' border='1' cellpadding='0' cellspacing='0'><tr>";
            foreach (DataColumn column in dS.Tables["tb"].Columns)
            {
                htmlTable += "<th>" + column.ColumnName + "</th>";
            }
            htmlTable += "</tr>";
            foreach (DataRow dr in dS.Tables["tb"].Rows)
            {
                string productId = dr["product_id"].ToString();
                string productName = dr["product_name"].ToString();
                string productRate = dr["product_rate"].ToString();
                string userId = dr["user_id"].ToString();
                string categoryId = dr["category_id"].ToString();

                htmlTable += "<tr><td>" + productId + "</td><td>" + productName+ "</td><td>" + productRate + "</td><td>" + userId + "</td><td>" + categoryId + "</td></tr>";
            }
            htmlTable += "</table>";
            lblTable.Text = htmlTable;

        }

        protected void viewAll_Click(object sender, EventArgs e)
        {
            displayProduct();
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (inputFld.Text.Length == 0)
            {
                displayProduct();
            }

            else
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("Select p.product_id, p.product_name, p.product_rate from product p where p.product_name = '" + inputFld.Text + "';", con);
                SqlDataAdapter dA = new SqlDataAdapter(cmd);
                System.Data.DataSet dS = new System.Data.DataSet();
                dA.Fill(dS, "tb");

                string htmlTable = "<table class='highlight' border='1' cellpadding='0' cellspacing='0'><tr>";
                foreach (DataColumn column in dS.Tables["tb"].Columns)
                {
                    htmlTable += "<th>" + column.ColumnName + "</th>";
                }
                htmlTable += "</tr>";
                foreach (DataRow dr in dS.Tables["tb"].Rows)
                {
                    string pId = dr["product_id"].ToString();
                    string pName = dr["product_name"].ToString();
                    string pRate = dr["product_rate"].ToString();
                    htmlTable += "<tr><td>" + pId + "</td><td>" + pName + "</td><td>" + pRate + "</td></tr>";
                }
                htmlTable += "</table>";
                dbLabel.Text = htmlTable;

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