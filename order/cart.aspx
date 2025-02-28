<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="order.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /*Cart Container */
        .cart-container {
            width: 60%;
            margin: auto;
            padding: 20px;
            background: #111; /* Dark theme */
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(255, 165, 0, 0.3); /* Orange glow */
            text-align: center;
        }
        
        /* Title */
        h1 {
            color: #ff6600; /* Orange title */
            margin-bottom: 15px;
        }

        /* Table Styling */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            background: #222; 
            border-radius: 8px;
            overflow: hidden;
        }

            .cart-table th, .cart-table td {
                padding: 12px;
                border: 1px solid #444; 
                text-align: center;
            }

            .cart-table th {
                background: #ff6600; 
                color: white;
                font-size: 18px;
            }

            .cart-table td {
                font-size: 16px;
                color: #ddd;
            }

        
        .checkout-button {
            background: #ff6600;
            color: white;
            font-size: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
            margin-top: 15px;
        }

            .checkout-button:hover {
                background: #cc5500; /* Darker orange on hover */
            }

        
        .total-bill {
            font-size: 22px;
            font-weight: bold;
            color: #ffcc00;
            margin-top: 10px;
        }

        .address-section {
            margin: 20px 0;
            text-align: left;
        }

            .address-section h2 {
                color: #ff6600;
                font-size: 20px;
                margin-bottom: 10px;
            }

        .address-textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            background: #333;
            color: white;
            border: 1px solid #555;
            resize: vertical;
            font-family: Arial, sans-serif;
        }

        .validation-error {
            color: #ff3300;
            display: block;
            margin-top: 5px;
            font-size: 14px;
        }

        .error-message {
            color: #ff3300;
            display: block;
            margin-top: 10px;
            font-size: 16px;
        }
    </style>

    <div class="cart-container">
        <h1>Your Cart</h1>

        <asp:GridView ID="CartGridView" runat="server" CssClass="cart-table" AutoGenerateColumns="False" ShowHeader="true">
            <Columns>
                <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="Rs. {0}" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="Extras" HeaderText="Extras" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="Rs. {0}" />
            </Columns>
        </asp:GridView>

        <br />
        <asp:Label ID="lblTotalBill" runat="server" CssClass="total-bill" Text="Total Bill: Rs. 0"></asp:Label>
        <br />
        <br />

    
        <div class="address-section">
            <h2>Delivery Address</h2>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"
                Rows="4" CssClass="address-textarea" placeholder="Enter your complete delivery address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                ControlToValidate="txtAddress"
                ErrorMessage="Delivery address is required"
                Display="Dynamic"
                CssClass="validation-error"
                ForeColor="#FF3300">
        </asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="CheckoutButton" runat="server" Text="Place Order"
            CssClass="checkout-button" OnClick="Checkout_Click" />

        <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label>
    </div>
</asp:Content>
