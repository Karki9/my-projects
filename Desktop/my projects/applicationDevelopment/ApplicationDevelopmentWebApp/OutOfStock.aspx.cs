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
    public partial class OutOfStock : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayOutOfStock();
        }

        public void displayOutOfStock()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT p.product_id as [Product ID], p.product_name as [Product Name] ,(s.quantity-sl.finalquantity) as [Remaining Stock] FROM product AS p JOIN (SELECT product_id, SUM(stock_qty) AS quantity FROM stockproduct GROUP BY product_id) AS s ON p.product_id = s.product_id join(SELECT product_id, SUM(sales_qty) AS finalquantity FROM sales GROUP BY product_id) AS sl on p.product_id=sl.product_id where (s.quantity-sl.finalquantity)=0", con);

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
                string productId = dr["Product ID"].ToString();
                string productName = dr["Product Name"].ToString();
                string finalStock = dr["Remaining Stock"].ToString();

                htmlTable += "<tr><td>" + productId + "</td><td>" + productName + "</td><td>" + finalStock + "</td></tr>";
            }
            htmlTable += "</table>";
            lblOutOfStock.Text = htmlTable;
        }

        protected void btn_OutOfStock(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT p.product_id as [Product ID], p.product_name as [Product Name] ,(s.quantity-sl.finalquantity) as [Remaining Stock] FROM product AS p JOIN (SELECT product_id, SUM(stock_qty) AS quantity FROM stockproduct GROUP BY product_id) AS s ON p.product_id = s.product_id join(SELECT product_id, SUM(sales_qty) AS finalquantity FROM sales GROUP BY product_id) AS sl on p.product_id=sl.product_id where (s.quantity-sl.finalquantity)=0 AND p.product_name = '" + searchTxtBox.Text + "';", con);

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
                string productId = dr["Product ID"].ToString();
                string productName = dr["Product Name"].ToString();
                string finalStock = dr["Remaining Stock"].ToString();

                htmlTable += "<tr><td>" + productId + "</td><td>" + productName + "</td><td>" + finalStock + "</td></tr>";
            }
            htmlTable += "</table>";
            lblOutOfStock.Text = htmlTable;


        }

        protected void btn_ClearStock(object sender, EventArgs e)
        {
            searchTxtBox.Text = "";
            displayOutOfStock();
        }
    }
}