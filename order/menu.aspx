<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="order.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menu-container">

        <!-- RAMEN -->
        <div class="menu-item">
            <h1>RAMEN</h1>
            <img src="/assets/Ramen.jpg" />
            <h2>Starting RS. 345</h2>
            <p>Savor the authentic taste of Japan with our rich, flavorful ramen! Made with handcrafted noodles, savory broth, and premium toppings. Every bowl is a masterpiece.</p>
            <div class="order-section">
                <asp:Button ID="Button1" runat="server" Text="ADD TO CART" OnClick="AddToCart_Click" CssClass="add_to_cart_btn" CommandArgument="Ramen|345" />
                <span>
                    <label>QUANTITY:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </div>
            <div class="extras-section">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Extra Cheese" CssClass="order-checkbox" />
                <asp:CheckBox ID="CheckBox2" runat="server" Text="Spicy Sauce" CssClass="order-checkbox" />
            </div>
        </div>

        <!-- BURGER -->
        <div class="menu-item">
            <h1>BURGER</h1>
            <img src="/assets/BUG.jpg" />
            <h2>Starting RS. 200</h2>
            <p>Indulge in the ultimate burger experience! Juicy, flame-grilled patties, fresh veggies, and melted cheese stacked between toasted buns.</p>
            <div class="order-section">
                <asp:Button ID="Button2" runat="server" Text="ADD TO CART" OnClick="AddToCart_Click" CssClass="add_to_cart_btn" CommandArgument="Burger|200" />
                <span>
                    <label>QUANTITY:</label>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </div>
            <div class="extras-section">
                <asp:CheckBox ID="CheckBox3" runat="server" Text="Extra Cheese" CssClass="order-checkbox" />
                <asp:CheckBox ID="CheckBox4" runat="server" Text="Spicy Sauce" CssClass="order-checkbox" />
            </div>
        </div>

        <!-- PIZZA -->
        <div class="menu-item">
            <h1>PIZZA</h1>
            <img src="/assets/piz.jpg" />
            <h2>Starting RS. 300</h2>
            <p>Freshly baked, loaded with gooey cheese, savory toppings, and a crispy crust—every slice is a flavor explosion.</p>
            <div class="order-section">
                <asp:Button ID="Button3" runat="server" Text="ADD TO CART" OnClick="AddToCart_Click" CssClass="add_to_cart_btn" CommandArgument="Pizza|300" />
                <span>
                    <label>QUANTITY:</label>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </div>
            <div class="extras-section">
                <asp:CheckBox ID="CheckBox5" runat="server" Text="Extra Cheese" CssClass="order-checkbox" />
                <asp:CheckBox ID="CheckBox6" runat="server" Text="Spicy Sauce" CssClass="order-checkbox" />
            </div>
        </div>

        <!-- CAKE -->
        <div class="menu-item">
            <h1>CAKE</h1>
            <img src="/assets/cake.jpg" />
            <h2>Starting RS. 400</h2>
            <p>Moist layers, rich frosting, and delightful flavors crafted to perfection—each slice is pure joy.</p>
            <div class="order-section">
                <asp:Button ID="Button4" runat="server" Text="ADD TO CART" OnClick="AddToCart_Click" CssClass="add_to_cart_btn" CommandArgument="Cake|400" />
                <span>
                    <label>QUANTITY:</label>
                    <asp:DropDownList ID="DropDownList4" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </div>
        </div>

        <!-- FRIES -->
        <div class="menu-item">
            <h1>FRIES</h1>
            <img src="/assets/fries.jpg" />
            <h2>Starting RS. 150</h2>
            <p>Craving something crispy? Dive into our golden, perfectly seasoned fries!</p>
            <div class="order-section">
                <asp:Button ID="Button5" runat="server" Text="ADD TO CART" OnClick="AddToCart_Click" CssClass="add_to_cart_btn" CommandArgument="Fries|150" />
                <span>
                    <label>QUANTITY:</label>
                    <asp:DropDownList ID="DropDownList5" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </div>
            <div class="extras-section">
                <asp:CheckBox ID="CheckBox9" runat="server" Text="Extra Cheese" CssClass="order-checkbox" />
                <asp:CheckBox ID="CheckBox10" runat="server" Text="Spicy Sauce" CssClass="order-checkbox" />
            </div>
        </div>

        <!-- ICE CREAM -->
        <div class="menu-item">
            <h1>ICE CREAM</h1>
            <img src="/assets/ice.jpg" />
            <h2>Starting RS. 100</h2>
            <p>Beat the heat with our creamy, dreamy ice cream! Made with rich, natural ingredients.</p>
            <div class="order-section">
                <asp:Button ID="Button6" runat="server" Text="ADD TO CART" OnClick="AddToCart_Click" CssClass="add_to_cart_btn" CommandArgument="Ice Cream|100" />
                <span>
                    <label>QUANTITY:</label>
                    <asp:DropDownList ID="DropDownList6" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </div>
        </div>

        <!-- JUICE -->
        <div class="menu-item">
            <h1>JUICE</h1>
            <img src="/assets/juice.jpg" />
            <h2>Starting RS. 100</h2>
            <p>Quench your thirst with our freshly squeezed, 100% natural juices!</p>
            <div class="order-section">
                <asp:Button ID="Button7" runat="server" Text="ADD TO CART" OnClick="AddToCart_Click" CssClass="add_to_cart_btn" CommandArgument="Juice|100" />
                <span>
                    <label>QUANTITY:</label>
                    <asp:DropDownList ID="DropDownList7" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </div>
        </div>
    </div>
</asp:Content>
