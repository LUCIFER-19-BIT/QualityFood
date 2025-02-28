using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace order
{
    public partial class WebForm4 : Page
    {
        protected void HandleRegister(object sender, EventArgs e)
        {
            string email = EmailInput.Text.Trim();
            string password = PasswordInput.Text.Trim();

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

                    // Check if email already exists
                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int userCount = (int)checkCmd.ExecuteScalar();

                        if (userCount > 0)
                        {
                            ShowAlert("Email already registered!");
                            return;
                        }
                    }

                    // Insert new user
                    string insertQuery = "INSERT INTO Users (Email, Password) VALUES (@Email, @Password); SELECT SCOPE_IDENTITY();";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password); 

                        int userId = Convert.ToInt32(cmd.ExecuteScalar());

                        if (userId > 0)
                        {
                            HttpCookie userIdCookie = new HttpCookie("UserId", userId.ToString())
                            {
                                Expires = DateTime.Now.AddYears(1),
                            };

                            HttpCookie emailCookie = new HttpCookie("UserEmail", HttpUtility.UrlEncode(email))
                            {
                                Expires = DateTime.Now.AddYears(1),
                            };

                            Response.Cookies.Add(userIdCookie);
                            Response.Cookies.Add(emailCookie);

                            Response.Redirect("~/home.aspx");
                        }
                        else
                        {
                            ShowAlert("Registration failed! Please try again.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("An error occurred: " + ex.Message);
            }
        }

        private void ShowAlert(string message)
        {
            string script = $"alert('{message}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", script, true);
        }
    }
}
