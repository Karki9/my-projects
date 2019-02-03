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
    public partial class StockedForLong : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection mySqlConnection = new SqlConnection(connectionString);
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("NotForLong", con);
            cmd.CommandType = CommandType.StoredProcedure;
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
                string stockId = dr["stock_id"].ToString();
                string stockName = dr["stock_name"].ToString();
                string stockDate = dr["stock_date"].ToString();
                string stockQty = dr["stock_qty"].ToString();
                string productId = dr["product_id"].ToString();
                string productName = dr["product_name"].ToString();


                htmlTable += "<tr><td>" + stockId + "</td><td>" + stockName + "</td><td>" + stockDate + "</td><td>" + stockQty  +"</td><td>" + productId + "</td><td>" + productName + "</td></tr>";
            }
            htmlTable += "</table>";
            txtLabel.Text = htmlTable;


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