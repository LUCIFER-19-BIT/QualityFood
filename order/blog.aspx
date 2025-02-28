<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="order.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="blog-container">
        <img src="/assets/logo.jpg" alt="Blog Image" class="blog-image" />
        <div class="blog-text">
            <h2>Quality Food</h2>
            <p>
                Authentic Culinary Experience:
Offers a diverse menu featuring authentic dishes, such as rich ramen.
Crafted with high-quality ingredients that celebrate traditional flavors
            </p>
            <p>
                Convenient Online Ordering:
Option to customize orders and add preferred items to the cart.
            </p>
            <p>
                Freshness and Quality Assurance:
Commitment to using fresh ingredients with every meal preparation.
Each dish is carefully prepared to ensure maximum flavor and satisfaction.
            </p>
            <p>
                Timely Delivery Service:
Efficient delivery service to bring meals directly to your doorstep.
Ensures that food arrives fresh, hot, and ready to enjoy.

            </p>
        </div>
    </div>
    <div class="blog-container">
        <!-- Text information on the left -->
        <div class="blog-text-left">
            <h2>Data Privacy</h2>
            <ul>
                <li><strong>Data Protection:</strong>We implement advanced security measures to protect your personal information from unauthorized access.</li>
                <li><strong>Minimal Data Collection:</strong> We only collect essential data necessary for processing your orders and enhancing your experience.</li>
                <li><strong>User Control:</strong>You have full control over your data. You can view, edit, or delete your information at any time.</li>
                <li><strong>No Third-Party Sharing:</strong> Your data will never be shared with third parties without your explicit consent, ensuring complete confidentiality.</li>
            </ul>
        </div>

        <!-- Image on the right -->
        <img src="/assets/privacy.jpg" alt="Collaborative Team" class="blog-image-right" />
    </div>

    <div class="blog-container">
        <img src="/assets/cop.jpg" alt="Blog Image" class="blog-image" />
        <div class="blog-text">
            <h2>Co-oprative</h2>
            <p>
                User-Centric Approach:
We prioritize your needs and preferences, ensuring our website evolves to 
               meet your expectations.
            </p>
            <p>
                Open to Feedback:
Your suggestions and feedback are invaluable to us, and we actively
                encourage you to share your thoughts.
            </p>
            <p>
                Continuous Improvement:
We are committed to making regular updates and improvements to enhance
                your experience on our platform.
            </p>
            <p>
                Collaborative Spirit:
Together, we can create a food website that truly reflects your tastes
                and desires—your input makes all the difference!

            </p>
        </div>
    </div>
    <div class="blog-container">
        <!-- Text information on the left -->
        <div class="blog-text-left">
            <h2>User Friendly Interface</h2>
            <ul>
                <li><strong>Intuitive Navigation:</strong>User-friendly layout allows easy access to all sections.</li>
                <li><strong>Easy Ordering Process:</strong>Minimal steps required to complete an order, enhancing the overall user experience.</li>
                <li><strong>Visually Appealing Design:</strong>High-quality images and engaging descriptions entice customers.</li>
                <li><strong>Dietary Options:</strong> Specify if the ramen is vegetarian, vegan, or gluten-free.</li>
            </ul>
        </div>

        <!-- Image on the right -->
        <img src="/assets/user.jpg" alt="Collaborative Team" class="blog-image-right" />
    </div>
</asp:Content>
