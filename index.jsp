<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mini Coffee Shop- check</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f7f1ea;
            color: #3b2f2f;
        }

        header {
            background: #5c3d2e;
            color: white;
            text-align: center;
            padding: 35px 20px;
        }

        header h1 {
            margin: 0;
            font-size: 38px;
        }

        header p {
            margin-top: 10px;
            font-size: 18px;
        }

        nav {
            background: #8b5e3c;
            text-align: center;
            padding: 12px;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 18px;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 30px auto;
        }

        .section-title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 25px;
        }

        /* Adjusted to show exactly 2 items per row */
        .products {
            display: grid;
            grid-template-columns: repeat(2, minmax(280px, 450px));
            gap: 30px;
            justify-content: center;
        }

        /* Responsive layout for mobile screens */
        @media (max-width: 768px) {
            .products {
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            }
        }

        .product-card {
            background: white;
            border-radius: 14px;
            padding: 22px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .product-card img {
            width: 100%;
            max-width: 360px;
            height: 240px;
            object-fit: cover;
            border-radius: 12px;
            margin: 0 auto;
        }

        .product-card h3 {
            margin: 14px 0 6px;
        }

        .price {
            font-weight: bold;
            color: #8b4513;
            font-size: 18px;
            margin-bottom: 12px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 5px;
        }

        .qty-btn {
            background: #8b5e3c;
            color: white;
            border: none;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
        }

        .qty-btn:hover {
            background: #5c3d2e;
        }

        .qty-val {
            font-size: 16px;
            font-weight: bold;
            min-width: 25px;
            text-align: center;
        }

        /* Style for the dynamic live receipt section */
        .receipt-box {
            background: white;
            margin-top: 35px;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
        }

        .receipt-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #5c3d2e;
        }

        .receipt-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .receipt-table th, .receipt-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e1d7cd;
        }

        .receipt-table th {
            font-weight: bold;
            color: #5c3d2e;
        }

        .total-row {
            font-size: 20px;
            font-weight: bold;
            color: #8b4513;
        }

        /* Input fields container inside checkout */
        .order-inputs {
            max-width: 500px;
            margin: 20px auto;
            text-align: left;
        }

        .order-inputs label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            color: #5c3d2e;
        }

        .order-inputs input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #c9b8a8;
            border-radius: 8px;
            font-size: 15px;
        }

        /* Required indicator style */
        .required-star {
            color: #c62828;
            margin-left: 3px;
        }

        .checkout-container {
            text-align: center;
            margin-top: 25px;
        }

        .btn-checkout {
            background: #5c3d2e;
            color: white;
            border: none;
            padding: 14px 40px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }

        .btn-checkout:hover {
            background: #3b2f2f;
        }

        /* Style for the success result message */
        .success-result {
            display: none;
            margin-top: 20px;
            padding: 15px;
            border-radius: 8px;
            font-weight: bold;
            background: #e8f5e9;
            color: #2e7d32;
            text-align: center;
            line-height: 1.6;
        }

        /* Style for validation error message */
        .error-result {
            display: none;
            margin-top: 20px;
            padding: 15px;
            border-radius: 8px;
            font-weight: bold;
            background: #ffebee;
            color: #c62828;
            text-align: center;
        }

        .empty-cart-msg {
            text-align: center;
            color: #7a6e67;
            font-style: italic;
        }

        .info-section {
            background: white;
            margin-top: 30px;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
        }

        .maps-link {
            display: inline-block;
            margin-top: 10px;
            color: #8b5e3c;
            text-decoration: none;
            font-weight: bold;
        }

        .maps-link:hover {
            text-decoration: underline;
            color: #5c3d2e;
        }

        footer {
            text-align: center;
            background: #5c3d2e;
            color: white;
            padding: 20px;
            margin-top: 35px;
        }
    </style>
</head>
<body>

<header>
    <h1 id="main-title">Mini Coffee Shop</h1>
    <p id="main-subtitle">Fresh coffee, simple ordering, and a cozy experience.</p>
</header>

<nav>
    <a id="menu-link" href="#menu">Menu</a>
    <a id="receipt-link" href="#receipt">Your Bill</a>
    <a id="about-link" href="#about">About</a>
    <a id="contact-link" href="#contact">Contact</a>
</nav>

<div class="container">
    <section id="menu">
        <h2 id="menu-section-title" class="section-title">Our Coffee Menu</h2>

        <div class="products">
            <div class="product-card" id="americano-card">
                <img id="img-americano" src="https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=80" alt="Americano">
                <h3 id="title-americano">Americano</h3>
                <p id="price-americano" class="price">$5</p>
                <div class="quantity-controls">
                    <button id="minus-btn-americano" class="qty-btn" onclick="updateQty('Americano', 5, -1)">-</button>
                    <span class="qty-val" id="qty-Americano">0</span>
                    <button id="plus-btn-americano" class="qty-btn" onclick="updateQty('Americano', 5, 1)">+</button>
                </div>
            </div>

            <div class="product-card" id="cappuccino-card">
                <img id="img-cappuccino" src="https://images.unsplash.com/photo-1534778101976-62847782c213?auto=format&fit=crop&w=600&q=80" alt="Cappuccino">
                <h3 id="title-cappuccino">Cappuccino</h3>
                <p id="price-cappuccino" class="price">$4</p>
                <div class="quantity-controls">
                    <button id="minus-btn-cappuccino" class="qty-btn" onclick="updateQty('Cappuccino', 4, -1)">-</button>
                    <span class="qty-val" id="qty-Cappuccino">0</span>
                    <button id="plus-btn-cappuccino" class="qty-btn" onclick="updateQty('Cappuccino', 4, 1)">+</button>
                </div>
            </div>

            <div class="product-card" id="espresso-card">
                <img id="img-espresso" src="https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?auto=format&fit=crop&w=600&q=80" alt="Espresso">
                <h3 id="title-espresso">Espresso</h3>
                <p id="price-espresso" class="price">$3</p>
                <div class="quantity-controls">
                    <button id="minus-btn-espresso" class="qty-btn" onclick="updateQty('Espresso', 3, -1)">-</button>
                    <span class="qty-val" id="qty-Espresso">0</span>
                    <button id="plus-btn-espresso" class="qty-btn" onclick="updateQty('Espresso', 3, 1)">+</button>
                </div>
            </div>

            <div class="product-card" id="iced-coffee-card">
                <img id="img-iced-coffee" src="https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=600&q=80" alt="Iced Coffee">
                <h3 id="title-iced-coffee">Iced Coffee</h3>
                <p id="price-iced-coffee" class="price">$6</p>
                <div class="quantity-controls">
                    <button id="minus-btn-iced-coffee" class="qty-btn" onclick="updateQty('Iced-Coffee', 6, -1)">-</button>
                    <span class="qty-val" id="qty-Iced-Coffee">0</span>
                    <button id="plus-btn-iced-coffee" class="qty-btn" onclick="updateQty('Iced-Coffee', 6, 1)">+</button>
                </div>
            </div>
        </div>
    </section>

    <section id="receipt" class="receipt-box">
        <h2 id="receipt-title">Your Order Summary</h2>
        
        <div id="empty-cart" class="empty-cart-msg">
            Your cart is empty. Start adding some delicious coffee!
        </div>

        <div id="receipt-content" style="display: none;">
            <table id="receipt-table" class="receipt-table">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody id="receipt-items">
                    </tbody>
                <tfoot>
                    <tr class="total-row">
                        <td colspan="3" style="text-align: right; padding-right: 20px;">Total Amount:</td>
                        <td id="grand-total">$0</td>
                    </tr>
                </tfoot>
            </table>

            <div class="order-inputs">
                <label for="customer-name">Your Name:<span class="required-star">*</span></label>
                <input type="text" id="customer-name" placeholder="Enter your name (Required)">

                <label for="order-notes">Special Requests / Notes:</label>
                <input type="text" id="order-notes" placeholder="e.g., Extra hot, Soy milk, No sugar...">
            </div>

            <div class="checkout-container">
                <button id="checkout-button" class="btn-checkout" onclick="processCheckout()">Checkout Now</button>
            </div>

            <div id="result-message" class="success-result"></div>
            <div id="error-message" class="error-result"></div>
        </div>
    </section>

    <section id="about" class="info-section">
        <h2 id="about-title">About This App</h2>
        <p id="about-text">This Mini Coffee Shop was created as a simple JSP web application for a DevOps final project.</p>
    </section>

    <section id="contact" class="info-section">
        <h2 id="contact-title">Contact Us</h2>
        <p id="contact-email">Email: coffee-shop@example.com</p>
        <p id="contact-hours">Opening hours: Sunday - Thursday, 08:00 - 18:00</p>
        <p>
            <a id="google-maps-link" class="maps-link" href="https://maps.app.goo.gl/8pNYhYzAamXAA8LC9" target="_blank">📍 Find us on Google Maps</a>
        </p>
    </section>
</div>

<footer>
    <p id="footer-text">Mini Coffee Shop App | JSP + Tomcat</p>
</footer>

<script>
    // Object to maintain the current cart state
    var cart = {
        'Americano': { price: 5, qty: 0 },
        'Cappuccino': { price: 4, qty: 0 },
        'Espresso': { price: 3, qty: 0 },
        'Iced-Coffee': { price: 6, qty: 0 }
    };

    var currentGrandTotal = 0;

    function updateQty(productName, price, change) {
        var qtyElement = document.getElementById('qty-' + productName);
        var currentQty = cart[productName].qty;
        var newQty = currentQty + change;

        if (newQty >= 0) {
            // Update the object and the text inside the product card
            cart[productName].qty = newQty;
            qtyElement.innerText = newQty;
            
            // Hide previous messages on cart change
            document.getElementById('result-message').style.display = 'none';
            document.getElementById('error-message').style.display = 'none';

            // Re-render the receipt table
            renderReceipt();
        }
    }

    function renderReceipt() {
        var tbody = document.getElementById('receipt-items');
        var emptyCartMsg = document.getElementById('empty-cart');
        var receiptContent = document.getElementById('receipt-content');
        var grandTotalElement = document.getElementById('grand-total');
        
        tbody.innerHTML = ''; // Clear previous table rows
        currentGrandTotal = 0;
        var hasItems = false;

        // Loop through all items in the cart
        for (var item in cart) {
            if (cart[item].qty > 0) {
                hasItems = true;
                var itemTotal = cart[item].qty * cart[item].price;
                currentGrandTotal += itemTotal;

                // Create a new row for the active item
                var row = document.createElement('tr');
                // Added direct IDs to row components to allow targetted testing if needed
                row.innerHTML = '<td>' + item.replace('-', ' ') + '</td>' +
                                '<td>$' + cart[item].price + '</td>' +
                                '<td>' + cart[item].qty + '</td>' +
                                '<td>$' + itemTotal + '</td>';
                tbody.appendChild(row);
            }
        }

        // Toggle visibility based on cart status
        if (hasItems) {
            emptyCartMsg.style.display = 'none';
            receiptContent.style.display = 'block';
            grandTotalElement.innerText = '$' + currentGrandTotal;
        } else {
            emptyCartMsg.style.display = 'none'; // Keep hidden if we are displaying a success result
            receiptContent.style.display = 'none';
            grandTotalElement.innerText = '$0';
        }
    }

    // Function to handle the checkout and clear screen
    function processCheckout() {
        var nameInput = document.getElementById('customer-name');
        var notesInput = document.getElementById('order-notes');
        var name = nameInput.value.trim();
        var notes = notesInput.value.trim();
        
        var resultBox = document.getElementById('result-message');
        var errorBox = document.getElementById('error-message');

        // Reset previous message states
        resultBox.style.display = 'none';
        errorBox.style.display = 'none';

        // 1. Validation check: Name is required
        if (!name) {
            errorBox.innerText = "❌ Name is required! Please enter your name to complete the order.";
            errorBox.style.display = 'block';
            return; // Stops execution
        }

        // 2. Successful order logic
        var message = "🎉 Thank you, " + name + "! Your order has been placed successfully.<br>";
        message += "Total Amount Paid: $" + currentGrandTotal;

        if (notes) {
            message += "<br>📝 Special Notes: \"" + notes + "\"";
        }

        // Display the success result message
        resultBox.innerHTML = message;
        resultBox.style.display = 'block';

        // --- DEV OPS UPDATE: Background Server Transaction ---
        // Fired after validations pass, capturing name, total, and special notes for Gatling to track.
        fetch('index.jsp', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'customerName=' + encodeURIComponent(name) + 
                  '&total=' + currentGrandTotal + 
                  '&notes=' + encodeURIComponent(notes)
        })
        .then(function(response) {
            console.log("Server transaction successfully recorded.");
        })
        .catch(function(error) {
            console.error("Error dispatching transaction to server:", error);
        });
        // ------------------------------------------------------

        // 3. Clear Screen logic: Reset inputs and cart object after checkout
        nameInput.value = '';
        notesInput.value = '';

        for (var item in cart) {
            cart[item].qty = 0;
            // Update the product card counter UI text to 0
            document.getElementById('qty-' + item).innerText = '0';
        }

        // Re-render receipt (which will now hide the table and show the empty cart message)
        var tbody = document.getElementById('receipt-items');
        tbody.innerHTML = '';
        document.getElementById('grand-total').innerText = '$0';
        document.getElementById('receipt-content').style.display = 'none';
        document.getElementById('empty-cart').style.display = 'block';
        
        // Re-append the result box outside the hidden container so it stays visible
        document.getElementById('receipt').appendChild(resultBox);
    }
</script>

</body>
</html>