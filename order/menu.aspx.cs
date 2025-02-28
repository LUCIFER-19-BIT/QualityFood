namespace order
{
    using System;
    using System.Collections.Generic;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class WebForm5 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<Dictionary<string, string>>();
                }
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            // Check if user is logged in
            HttpCookie userIdCookie = Request.Cookies["UserId"];
            if (userIdCookie == null)
            {
                Response.Redirect("~/login.aspx");
                return;
            }

            Button btn = (Button)sender;
            string[] itemDetails = btn.CommandArgument.Split('|');
            string itemName = itemDetails[0];
            int itemPrice = int.Parse(itemDetails[1]);

            // Find quantity dropdown
            DropDownList quantityDropdown = (DropDownList)btn.Parent.FindControl("DropDownList" + btn.ID.Substring(btn.ID.Length - 1));
            int quantity = int.Parse(quantityDropdown.SelectedValue);

            int extraCheesePrice = 0;
            int spicySaucePrice = 0;
            bool hasExtraCheese = false;
            bool hasSpicySauce = false;

            // Try to find extras if they exist
            try
            {
                CheckBox extraCheese = (CheckBox)btn.Parent.FindControl("CheckBox" + ((int.Parse(btn.ID.Substring(btn.ID.Length - 1)) * 2) - 1));
                CheckBox spicySauce = (CheckBox)btn.Parent.FindControl("CheckBox" + ((int.Parse(btn.ID.Substring(btn.ID.Length - 1)) * 2)));

                if (extraCheese != null)
                {
                    extraCheesePrice = extraCheese.Checked ? 50 : 0;
                    hasExtraCheese = extraCheese.Checked;
                }

                if (spicySauce != null)
                {
                    spicySaucePrice = spicySauce.Checked ? 30 : 0;
                    hasSpicySauce = spicySauce.Checked;
                }
            }
            catch
            {
                // Ignore errors if extras controls don't exist
                extraCheesePrice = 0;
                spicySaucePrice = 0;
            }

            // Calculate total price
            int totalItemPrice = (itemPrice + extraCheesePrice + spicySaucePrice) * quantity;

            // Get cart from session
            List<Dictionary<string, string>> cart = (List<Dictionary<string, string>>)Session["Cart"];

            // Check if item exists
            bool itemExists = false;
            foreach (var item in cart)
            {
                if (item["ItemName"] == itemName)
                {
                    int existingQuantity = int.Parse(item["Quantity"]);
                    item["Quantity"] = (existingQuantity + quantity).ToString();
                    int existingTotal = int.Parse(item["TotalPrice"]);
                    item["TotalPrice"] = (existingTotal + totalItemPrice).ToString();
                    itemExists = true;
                    break;
                }
            }

            // Add new item
            if (!itemExists)
            {
                var newItem = new Dictionary<string, string>
                {
                    { "ItemName", itemName },
                    { "Price", itemPrice.ToString() },
                    { "Quantity", quantity.ToString() },
                    { "TotalPrice", totalItemPrice.ToString() }
                };

                // Only add extras information if the item has extras options
                if (btn.Parent.FindControl("CheckBox" + ((int.Parse(btn.ID.Substring(btn.ID.Length - 1)) * 2) - 1)) != null)
                {
                    newItem.Add("ExtraCheese", hasExtraCheese ? "Yes" : "No");
                    newItem.Add("SpicySauce", hasSpicySauce ? "Yes" : "No");
                }
                else
                {
                    newItem.Add("ExtraCheese", "N/A");
                    newItem.Add("SpicySauce", "N/A");
                }

                cart.Add(newItem);
            }

            // Update session and total
            Session["Cart"] = cart;
            UpdateCartTotal();

            // Show confirmation message
            ScriptManager.RegisterStartupScript(this, GetType(), "addedToCart",
                $"alert('{itemName} added to cart!');", true);
        }

        private void UpdateCartTotal()
        {
            List<Dictionary<string, string>> cart = (List<Dictionary<string, string>>)Session["Cart"];
            int totalBill = 0;

            foreach (var item in cart)
            {
                totalBill += int.Parse(item["TotalPrice"]);
            }

            Session["TotalBill"] = totalBill;
        }
    }
}
