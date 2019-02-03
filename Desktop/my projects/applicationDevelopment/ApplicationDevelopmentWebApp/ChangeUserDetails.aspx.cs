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
    public partial class ChangePassword : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataReader reader;
                if (Session["UserType"].Equals("Moderator"))
                {
                    userDD.Attributes.Add("style", "display:none");

                    SqlConnection con = new SqlConnection(connectionString);
            con.Open();



            SqlCommand cmd = new SqlCommand("select user_username, user_password, user_address, user_email from [user] where user_id = '" + Session["UserID"].ToString() + "';", con);

                
            reader = cmd.ExecuteReader();

            if (reader.Read())
            {

                userName.Text = reader["user_username"].ToString();
                userPassword.Text = reader["user_password"].ToString();
                userAddress.Text = reader["user_address"].ToString();
                userEmail.Text = reader["user_email"].ToString();

            }
                }
                SqlConnection connection = new SqlConnection(connectionString);
                try
                {
                    connection.Open();
                    SqlCommand userCmd = new SqlCommand("GetIdOfUsers", connection);



                    userCmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader productReader = userCmd.ExecuteReader();

                    if (productReader.HasRows)
                    {
                        userDD.DataSource = productReader;
                        userDD.DataTextField = "Full Name";
                        userDD.DataValueField = "user_id";
                        userDD.DataBind();
                        userDD.Items.Insert(0, "Select User");
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


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["UserType"].Equals("Admin"))
            {
                SqlConnection mySqlConnection = new SqlConnection(connectionString);

                try
                {
                    mySqlConnection.Open();

                    SqlCommand updateUser = new SqlCommand("update [user] set user_username=@user_username,user_password=@user_password,user_address=@user_address,user_email=@user_email where user_id = @user_id;", mySqlConnection);

                    updateUser.Parameters.AddWithValue("@user_username", value: userName.Text.ToString());
                    updateUser.Parameters.AddWithValue("@user_password", value: userPassword.Text.ToString());
                    updateUser.Parameters.AddWithValue("@user_address", value: userAddress.Text.ToString());
                    updateUser.Parameters.AddWithValue("@user_email", value: userName.Text.ToString());
                    updateUser.Parameters.AddWithValue("@user_id", value: userDD.SelectedValue.ToString());

                    updateUser.ExecuteNonQuery();
                    updateUser.Dispose();

                }
                catch (SqlException ex)
                {
                    throw ex;
                }
                finally
                {
                    mySqlConnection.Close();
                    mySqlConnection.Dispose();

                    Session.RemoveAll();
                    HttpContext.Current.Session.Abandon();
                    HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                    HttpContext.Current.Response.Cookies.Add(new HttpCookie(".ASPXAUTH", ""));

                    Response.Redirect("Login.aspx");
                }
            }

            else
            {
                SqlConnection mySqlConnection = new SqlConnection(connectionString);

                try
                {
                    mySqlConnection.Open();

                    SqlCommand updateUser = new SqlCommand("update [user] set user_username=@user_username,user_password=@user_password,user_address=@user_address,user_email=@user_email where user_id = @user_id;", mySqlConnection);

                    updateUser.Parameters.AddWithValue("@user_username", value: userName.Text.ToString());
                    updateUser.Parameters.AddWithValue("@user_password", value: userPassword.Text.ToString());
                    updateUser.Parameters.AddWithValue("@user_address", value: userAddress.Text.ToString());
                    updateUser.Parameters.AddWithValue("@user_email", value: userName.Text.ToString());
                    updateUser.Parameters.AddWithValue("@user_id", value: Session["UserID"].ToString());

                    updateUser.ExecuteNonQuery();
                    updateUser.Dispose();

                }
                catch (SqlException ex)
                {
                    throw ex;
                }
                finally
                {
                    mySqlConnection.Close();
                    mySqlConnection.Dispose();

                    Session.RemoveAll();
                    HttpContext.Current.Session.Abandon();
                    HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                    HttpContext.Current.Response.Cookies.Add(new HttpCookie(".ASPXAUTH", ""));

                    Response.Redirect("Login.aspx");


                }
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
            public string usrName { get; set; }
            public string usrPwd { get; set; }
            public string usrAddr { get; set; }

            public string usrEml { get; set; }

        }


        [WebMethod]
        public static List<Bills1> PopulateDropDownList4(string itemNamed)
        {
            DataTable dt = new DataTable();
            List<Bills1> objDept3 = new List<Bills1>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString))
            {
                string abc = "select user_username, user_password, user_address, user_email from [user] where user_id= @user_id";
                using (SqlCommand cmd = new SqlCommand(abc, con))
                {
                    cmd.Parameters.AddWithValue("@user_id", value: itemNamed);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            objDept3.Add(new Bills1
                            {
                                usrName = dt.Rows[i]["user_username"].ToString(),
                                usrPwd = dt.Rows[i]["user_password"].ToString(),
                                usrAddr = dt.Rows[i]["user_address"].ToString(),
                                usrEml = dt.Rows[i]["user_email"].ToString()

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
