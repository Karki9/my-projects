using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApplicationDevelopmentWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string id = login_username.Text;
            string password = login_password.Text;
            bool result = check(id, password);
            //bool result = true;

            if (result == true)
            {
                FormsAuthentication.RedirectFromLoginPage(id, true);
                Response.Write("<script>alert(id);</script>");
            }
            else
            {
                Response.Write("<script>alert('Sorry wrong Credentials');</script>");
                login_username.Text = "";
                login_password.Text = "";

            }
        }
        public bool check(string username, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            SqlDataSource select = new SqlDataSource();
            select.ConnectionString = connectionString;
            select.SelectCommand = "SELECT * FROM [User] WHERE ([user_username] = @Username) AND ([user_password] = @Password)";
            select.SelectParameters.Add("UserName", login_username.Text);
            select.SelectParameters.Add("Password", login_password.Text);

            DataView results = (DataView)select.Select(DataSourceSelectArguments.Empty);

            if (results.Count > 0)
            {

                SqlConnection mySqlConnection = new SqlConnection(connectionString);
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * FROM [User] WHERE [user_username] =\'" + login_username.Text + "\'", con);
                SqlDataAdapter dA = new SqlDataAdapter(cmd);
                System.Data.DataSet dS = new System.Data.DataSet();
                dA.Fill(dS, "tb");

                foreach (DataRow dr in dS.Tables["tb"].Rows)
                {
                    string uID = dr["user_id"].ToString();
                    string u_username = dr["user_username"].ToString();
                    string u_type = dr["user_type"].ToString();

                    Session["UserID"] = uID;
                    Session["UserName"] = u_username;
                    Session["UserType"] = u_type;
                     
                }     

                return true;
                // The user exists and the information matches! Create a cookie and do not let it persist by saying false at the end.
                
            }
            else
            {
                return false;
                //lblLogin.Text = "Please check your username and password and try again.";
                //Response.Write("<script>alert('Sorry wrong Credentials');</script>");
            }

            
        } 

        }
    }
