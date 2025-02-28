using System;
using System.Collections.Generic;
using System.Data; // Required for DataTable
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace order
{
    public partial class WebForm6 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //  chck user log 
                HttpCookie userIdCookie = Request.Cookies["UserId"];
                if (userIdCookie == null)
                {
                    Response.Redirect("~/login.aspx");
                    return;
                }

                LoadCart();
            }
        }

        private void LoadCart()
        {
            List<Dictionary<string, string>> cart = Session["Cart"] as List<Dictionary<string, string>>;

            if (cart != null && cart.Count > 0)
            {
                
                DataTable dt = new DataTable();
                dt.Columns.Add("ItemName", typeof(string));
                dt.Columns.Add("Price", typeof(int));
                dt.Columns.Add("Quantity", typeof(int));
                dt.Columns.Add("Extras", typeof(string));
                dt.Columns.Add("TotalPrice", typeof(int));

                int totalBill = 0;

                foreach (var item in cart)
                {
                    // Build extras string
                    List<string> extras = new List<string>();
                    if (item["ExtraCheese"] == "Yes")
                        extras.Add("Extra Cheese (+Rs. 50)");
                    if (item["SpicySauce"] == "Yes")
                        extras.Add("Spicy Sauce (+Rs. 30)");

                    string extrasString = extras.Count > 0 ? string.Join(", ", extras) : "No extras";

                    int totalPrice = int.Parse(item["TotalPrice"]);
                    dt.Rows.Add(
                        item["ItemName"],
                        int.Parse(item["Price"]),
                        int.Parse(item["Quantity"]),
                        extrasString,
                        totalPrice
                    );
                        
                    totalBill += totalPrice;
                }

                CartGridView.DataSource = dt;
                CartGridView.DataBind();

                lblTotalBill.Text = "Total Bill: Rs. " + totalBill;
            }
            else
            {
                lblTotalBill.Text = "Your cart is empty.";
            }
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            try
            {
                string address = txtAddress.Text.Trim();
                if (string.IsNullOrEmpty(address))
                {
                    lblError.Text = "Please enter delivery address";
                    lblError.Visible = true;
                    return;
                }

                HttpCookie userIdCookie = Request.Cookies["UserId"];
                if (userIdCookie == null)
                {
                    Response.Redirect("~/login.aspx");
                    return;
                }

                int userId = int.Parse(userIdCookie.Value);
                List<Dictionary<string, string>> cart = Session["Cart"] as List<Dictionary<string, string>>;

                if (cart == null || cart.Count == 0)
                {
                    lblError.Text = "Your cart is empty";
                    lblError.Visible = true;
                    return;
                }

                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            // Cal amt
                            decimal totalAmount = 0;
                            foreach (var item in cart)
                            {
                                totalAmount += decimal.Parse(item["TotalPrice"]);
                            }

                            // in ord
                            string orderQuery = @"INSERT INTO Orders (UserId, TotalAmount, DeliveryAddress) 
                                               OUTPUT INSERTED.OrderId 
                                               VALUES (@UserId, @TotalAmount, @Address)";

                            int orderId;

                            using (SqlCommand cmd = new SqlCommand(orderQuery, conn, transaction))
                            {
                                cmd.Parameters.AddWithValue("@UserId", userId);
                                cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                                cmd.Parameters.AddWithValue("@Address", address);
                                orderId = (int)cmd.ExecuteScalar();
                            }

                            // Insert order items
                            string itemQuery = @"INSERT INTO OrderItems (OrderId, ItemName, Quantity, Price, Extras) 
                                              VALUES (@OrderId, @ItemName, @Quantity, @Price, @Extras)";

                            foreach (var item in cart)
                            {
                                using (SqlCommand cmd = new SqlCommand(itemQuery, conn, transaction))
                                {
                                    cmd.Parameters.AddWithValue("@OrderId", orderId);
                                    cmd.Parameters.AddWithValue("@ItemName", item["ItemName"]);
                                    cmd.Parameters.AddWithValue("@Quantity", int.Parse(item["Quantity"]));
                                    cmd.Parameters.AddWithValue("@Price", decimal.Parse(item["TotalPrice"]));

                                    List<string> extras = new List<string>();
                                    if (item["ExtraCheese"] == "Yes") extras.Add("Extra Cheese");
                                    if (item["SpicySauce"] == "Yes") extras.Add("Spicy Sauce");
                                    string extrasString = string.Join(", ", extras);

                                    cmd.Parameters.AddWithValue("@Extras", extrasString);
                                    cmd.ExecuteNonQuery();
                                }
                            }

                            transaction.Commit();
                            Session["Cart"] = null;
                            ScriptManager.RegisterStartupScript(this, GetType(), "orderSuccess",
                                "alert('Order placed successfully!'); window.location='home.aspx';", true);
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            throw;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "An error occurred while processing your order. Please try again.";
                lblError.Visible = true;
            }
        }
    }
}