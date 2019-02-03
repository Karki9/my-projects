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
    public partial class CustomerSearch : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                headerText.Text = Session["UserName"].ToString();
            }

            displayCustomer();
        }

        public void displayCustomer()
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select c.customer_name, s.billing_date from customer c inner join sales s on c.customer_id=s.customer_id and s.billing_date >= (DATEADD(DAY, -31, GETDATE()));", con);
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
                string customerName = dr["customer_name"].ToString();
                string salesDate = dr["billing_date"].ToString();


                htmlTable += "<tr><td>" + customerName + "</td><td>" + salesDate + "</td></tr>";
            }
            htmlTable += "</table>";
            tblCustomerSearch.Text = htmlTable;


        }
        protected void btn_logout(object sender, EventArgs e)
        {
            Session.RemoveAll();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            HttpContext.Current.Response.Cookies.Add(new HttpCookie(".ASPXAUTH", ""));

            Response.Redirect("Login.aspx");

        }

        protected void btn_Search(object sender, EventArgs e)
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select c.customer_name, s.billing_date from customer c inner join sales s on c.customer_id=s.customer_id and s.billing_date >= (DATEADD(DAY, -31, GETDATE())) where c.customer_name = '" + customerSearchTB.Text + "';", con);
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
                string customerName = dr["customer_name"].ToString();
                string salesDate = dr["billing_date"].ToString();


                htmlTable += "<tr><td>" + customerName + "</td><td>" + salesDate + "</td></tr>";
            }

            htmlTable += "</table>";
            tblCustomerSearch.Text = htmlTable;

        }
    }

}