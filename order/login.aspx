<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="order.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .login_body {
            height: 70vh;
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

        .login_form {
            display: flex;
            flex-direction: column;
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
    <div class="login_body">
        <div class="login_form">

            <div>
                <asp:Label ID="Label1" runat="server" Text="LOGIN FORM" ForeColor="Yellow"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Height="35px"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
            </div>
            <div style="display: flex; justify-content: center; align-items: center; font-size: 1.2rem; gap: 30px;">
                <asp:Button CssClass="btn btn-login" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" ForeColor="White" BackColor="Red" BorderColor="#336600" />
                <asp:Button ID="Button2" CssClass="btn btn-login" runat="server" Text="Cancel" ForeColor="White" BackColor="#0000CC" OnClick="Button2_Click" />
                <asp:Button ID="Button3" CssClass="btn btn-login" runat="server" Text="Register" ForeColor="White" BackColor="Green" OnClick="Button3_Click" />
            </div>


        </div>
    </div>
</asp:Content>
