using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace order
{
    public partial class WebForm2 : Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowAlert("Email and Password are required!");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                   
                    string query = "SELECT UserId, Email FROM Users WHERE Email = @Email AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                int userId = reader.GetInt32(0);
                                string userEmail = reader.GetString(1);

                                
                                HttpCookie userIdCookie = new HttpCookie("UserId", userId.ToString())
                                {
                                    Expires = DateTime.Now.AddYears(1),
                                    Secure = true,
                                    HttpOnly = true
                                };

                                HttpCookie emailCookie = new HttpCookie("UserEmail", HttpUtility.UrlEncode(userEmail))
                                {
                                    Expires = DateTime.Now.AddYears(1),
                                    Secure = true,
                                    HttpOnly = true
                                };

                              
                                Response.Cookies.Add(userIdCookie);
                                Response.Cookies.Add(emailCookie);

                                // Redirect to home page
                                Response.Redirect("~/home.aspx");
                            }
                            else
                            {
                                ShowAlert("Invalid email or password!");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("An error occurred: " + ex.Message);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Clear form
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        private void ShowAlert(string message)
        {
            string script = $"alert('{message}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", script, true);
        }
    }
}
