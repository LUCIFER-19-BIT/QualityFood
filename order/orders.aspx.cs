using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace order
{
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in
                HttpCookie userIdCookie = Request.Cookies["UserId"];
                if (userIdCookie == null)
                {
                    Response.Redirect("~/login.aspx");
                    return;
                }

                LoadOrders(int.Parse(userIdCookie.Value));
            }
        }

        private void LoadOrders(int userId)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Get all orders for the user
                string orderQuery = @"SELECT OrderId, TotalAmount, DeliveryAddress, OrderDate 
                                    FROM Orders 
                                    WHERE UserId = @UserId 
                                    ORDER BY OrderDate DESC";

                using (SqlCommand cmd = new SqlCommand(orderQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dtOrders = new DataTable();
                        da.Fill(dtOrders);

                        if (dtOrders.Rows.Count > 0)
                        {
                            OrdersRepeater.DataSource = dtOrders;
                            OrdersRepeater.DataBind();
                        }
                        else
                        {
                            lblNoOrders.Visible = true;
                        }
                    }
                }
            }
        }

        protected void OrdersRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                int orderId = Convert.ToInt32(row["OrderId"]);
                GridView itemsGrid = (GridView)e.Item.FindControl("OrderItemsGrid");

                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string itemsQuery = @"SELECT ItemName, Quantity, Price, Extras 
                                        FROM OrderItems 
                                        WHERE OrderId = @OrderId";

                    using (SqlCommand cmd = new SqlCommand(itemsQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@OrderId", orderId);

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dtItems = new DataTable();
                            da.Fill(dtItems);
                            itemsGrid.DataSource = dtItems;
                            itemsGrid.DataBind();
                        }
                    }
                }
            }
        }

        protected void OrdersRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}
