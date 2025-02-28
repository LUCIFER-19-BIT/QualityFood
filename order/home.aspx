<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="order.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section class="hero-section text-center text-white py-5" style="background: url('/assets/foodie.jpg'); background-size: cover;">
        <h1 style="font-size: 4rem; font-weight: bold;">QUALITY <span style="color: orange;">FOODS</span></h1>
        <p>Healthy Food for Healthy Body</p>
    </section>

    <!-- Menu Section -->
    <div class="menu-section text-center py-5">
        <h2>Our Menu</h2>
        <div class="menu-section">

            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="menu-card">
                            <img src="/assets/Ramen.jpg" alt="Ramen">
                            <div class="menu-title">
                                <a href="menu.aspx" class="btn btn-primary">Order Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="menu-card">
                            <img src="/assets/burger.jpg" alt="Burgers">
                            <div class="menu-title">
                                <a href="menu.aspx" class="btn btn-primary">Order Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="menu-card">
                            <img src="/assets/pizz.jpg" alt="Pizzas">
                            <div class="menu-title">
                                <a href="menu.aspx" class="btn btn-primary">Order Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Brand Partners Section -->
        <div class="brand-partners-section text-center py-5" style="background-color: #444; border-radius: 8px; margin: 20px 0;">
            <h2>OUR BRAND PARTNERS</h2>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="brand-partner1">
                            <h3>SWIGGY</h3>
                            <p>BRAND</p>
                            <a href="https://www.swiggy.com" target="_blank">
                                <img src="/assets/SWIGGY.jpg" alt="SWIGGY">
                            </a>
                            <p style="color: orange;">Swiggy is a popular food delivery service in India, offering a wide variety of restaurant options and cuisines.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="brand-partner2">
                            <h3 style="color: rgb(0,255,33 );">UBER EATS</h3>
                            <p>BRAND</p>
                            <a href="https://www.ubereats.com/?ps=1" target="_blank">
                                <img src="/assets/UBER.jpg" alt="UBER">
                            </a>
                            <p style="color: rgb(0, 255, 33);">Uber Eats is a widely-used food delivery platform that brings meals from a diverse range of restaurants to your doorstep.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
