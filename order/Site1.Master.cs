using System;
using System.Web;
using System.Web.UI;

namespace order
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateLoginLogoutButton();
            }
        }

        private void UpdateLoginLogoutButton()
        {
            HttpCookie emailCookie = Request.Cookies["UserEmail"];

            if (emailCookie != null)
            {
                // User is logged in - show logout button with email
                string userEmail = HttpUtility.UrlDecode(emailCookie.Value);
                lnkLogin.Text = $"Logout ({userEmail})";
            }
            else
            {
                // User is not logged in - show login text
                lnkLogin.Text = "Login";
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            HttpCookie emailCookie = Request.Cookies["UserEmail"];

            if (emailCookie != null)
            {
                // User is logged in - perform logout

                // Clear userId cookie
                HttpCookie userIdCookie = new HttpCookie("UserId")
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(userIdCookie);

                // Clear email cookie
                HttpCookie clearEmailCookie = new HttpCookie("UserEmail")
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(clearEmailCookie);

                // Redirect to home page
                Response.Redirect("~/home.aspx");
            }
            else
            {
                // User is not logged in - redirect to login page
                Response.Redirect("~/login.aspx");
            }
        }
    }
}
