<%@ Page Title="My Orders" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="order.orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="orders-container">
        <h1>My Orders</h1>

        <asp:Repeater ID="OrdersRepeater" runat="server" OnItemDataBound="OrdersRepeater_ItemDataBound" OnItemCommand="OrdersRepeater_ItemCommand">
            <ItemTemplate>
                <div class="order-card">
                    <div class="order-header">
                        <div class="order-info">
                            <span class="order-id">Order #<%# Eval("OrderId") %></span>
                            <span class="order-date"><%# Convert.ToDateTime(Eval("OrderDate")).ToString("MMM dd, yyyy HH:mm") %></span>
                        </div>
                        <div class="order-total">Total: Rs. <%# Eval("TotalAmount") %></div>
                    </div>

                    <div class="order-address">
                        <strong>Delivery Address:</strong><br />
                        <%# Eval("DeliveryAddress") %>
                    </div>

                    <asp:GridView ID="OrderItemsGrid" runat="server" AutoGenerateColumns="False"
                        CssClass="items-table" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="ItemName" HeaderText="Item" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="Rs. {0}" />
                            <asp:BoundField DataField="Extras" HeaderText="Extras" />
                        </Columns>
                    </asp:GridView>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Label ID="lblNoOrders" runat="server" Text="No orders found." Visible="false" CssClass="no-orders"></asp:Label>
    </div>

    <style>
        .orders-container {
            width: 80%;
            margin: 30px auto;
            padding: 20px;
        }

        h1 {
            color: #ff6600;
            margin-bottom: 30px;
            text-align: center;
        }

        .order-card {
            background: #222;
            border-radius: 10px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(255, 165, 0, 0.2);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #444;
        }

        .order-info {
            display: flex;
            gap: 20px;
        }

        .order-id {
            color: #ff6600;
            font-weight: bold;
        }

        .order-date {
            color: #888;
        }

        .order-status {
            color: #00ff00;
        }

        .order-total {
            color: #ffcc00;
            font-size: 1.2em;
            font-weight: bold;
        }

        .order-address {
            margin: 15px 0;
            padding: 10px;
            background: #333;
            border-radius: 5px;
            color: #ddd;
        }

        .items-table {
            width: 100%;
            margin-top: 15px;
            border-collapse: collapse;
        }

            .items-table th {
                background: #444;
                color: white;
                padding: 10px;
                text-align: left;
            }

            .items-table td {
                padding: 10px;
                color: #ddd;
                border-bottom: 1px solid #444;
            }

        .no-orders {
            display: block;
            text-align: center;
            color: #888;
            font-size: 1.2em;
            margin-top: 30px;
        }
    </style>
</asp:Content>
