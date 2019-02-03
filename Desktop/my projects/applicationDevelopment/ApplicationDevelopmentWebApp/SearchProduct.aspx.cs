using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Principal;

namespace ApplicationDevelopmentWebApp
{
    public partial class SearchProduct : System.Web.UI.Page
    {        

        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e) 
        {
            if (!IsPostBack)
            {
                headerText.Text = Session["UserName"].ToString();
            }
            
        }

        public void displayProducts()
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select p.product_id, p.product_name, p.product_rate, c.category_name, s.stock_qty from product p INNER JOIN stockproduct sp ON p.product_id = sp.product_id INNER JOIN stock s ON sp.stock_id = s.stock_id INNER JOIN category c ON p.category_id = c.category_id;", con);
            SqlDataAdapter dA = new SqlDataAdapter(cmd);
            System.Data.DataSet dS = new System.Data.DataSet();
            dA.Fill(dS, "tb");

            string htmlTable = "<table border='1' cellpadding='0' cellspacing='0'><tr>";
            foreach (DataColumn column in dS.Tables["tb"].Columns)
            {
                htmlTable += "<th>" + column.ColumnName + "</th>";
            }
            htmlTable += "</tr>";
            foreach (DataRow dr in dS.Tables["tb"].Rows)
            {
                string pId = dr["product_id"].ToString();
                string pName = dr["product_name"].ToString();
                string pCat = dr["category_name"].ToString();
                string pRate = dr["product_rate"].ToString();
                string pStockQty = dr["stock_qty"].ToString();


                htmlTable += "<tr><td>" + pId + "</td><td>" + pName + "</td><td>" + pCat + "</td><td>" + pRate + "</td><td>" + pStockQty + "</td></tr>";
            }
            htmlTable += "</table>";
            inputLabel.Text = htmlTable;

            
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select p.product_id, p.product_name, p.product_rate, c.category_name, s.stock_qty from product p INNER JOIN stockproduct sp ON p.product_id = sp.product_id INNER JOIN stock s ON sp.stock_id = s.stock_id INNER JOIN category c ON p.category_id = c.category_id where p.product_name = '" + inputField.Text + "';", con);
            SqlDataAdapter dA = new SqlDataAdapter(cmd);
            System.Data.DataSet dS = new System.Data.DataSet();
            dA.Fill(dS, "tb");

            string htmlTable = "<table border='1' cellpadding='0' cellspacing='0'><tr>";
            foreach (DataColumn column in dS.Tables["tb"].Columns)
            {
                htmlTable += "<th>" + column.ColumnName + "</th>";
            }
            htmlTable += "</tr>";
            foreach (DataRow dr in dS.Tables["tb"].Rows)
            {
                string pId = dr["product_id"].ToString();
                string pName = dr["product_name"].ToString();
                string pCat = dr["category_name"].ToString();
                string pRate = dr["product_rate"].ToString();
                string pStockQty = dr["stock_qty"].ToString();
                

                htmlTable += "<tr><td>" + pId + "</td><td>" + pName + "</td><td>" + pCat + "</td><td>" + pRate + "</td><td>" + pStockQty + "</td></tr>";
            }
            htmlTable += "</table>";
            inputLabel.Text = htmlTable;

        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            displayProducts();
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