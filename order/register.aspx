<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="order.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .register_body {
            height: 100vh;
            text-align: center;
            font-size: 2rem;
            background-image: url("/assets/food4.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register_form {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 30px;
            border: solid;
            padding: 30px;
            background: rgba(0,0,0,0.7);
            border-radius: 10px;
        }

        .btn-login {
            padding: 10px;
        }
    </style>

    <div class="register_body">
        <div class="register_form">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Email " ForeColor="Yellow"></asp:Label>
                <asp:TextBox ID="EmailInput" runat="server" BackColor="White"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" Text="*" Display="Dynamic" ErrorMessage="there must be a username" ControlToValidate="EmailInput"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter the proper email id" Display="Dynamic" ControlToValidate="EmailInput" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>

            <div>
                <asp:Label ID="Label2" runat="server" Text="Password" ForeColor="Yellow"></asp:Label>
                <asp:TextBox ID="PasswordInput" runat="server" TextMode="Password" BackColor="white"></asp:TextBox>&nbsp;
            </div>
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="HandleRegister" ForeColor="white" BackColor="red" />&nbsp;
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </div>
    </div>
</asp:Content>
