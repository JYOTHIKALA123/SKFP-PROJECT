<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icon.png">
    <title>Product Order Form</title>
    <style>
        body {
            font-family: 'Times New Roman', Times, serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: rgba(206, 65, 119, 0.1);
        }
        .order-form {
            background: #ffffffc0;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(204, 68, 68, 0.1);
            max-width: 400px;
            width: 100%;
        }
        .order-form h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .order-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .order-form input[type="text"], 
        .order-form input[type="tel"], 
        .order-form input[type="number"],
        .order-form textarea {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .order-form textarea {
            resize: vertical;
        }
        .order-form button {
            background: #0d0e0d;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .order-form button:hover {
            background: #218838;
        }
    </style>
</head>
<body>
    <div class="order-form">
        <h1>Product Order Form</h1>
        <form action="OrderServlet" method="post">
            <label for="username">UserName:</label>
            <input type="text" id="username" name="username" required>

            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="address">Shipping/Delivery Address:</label>
            <textarea id="address" name="address" rows="4" required></textarea>

            <label for="product">Product Name:</label>
            <input type="text" id="product" name="product" required>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>

           

            <button type="submit">Place Order</button>
        </form>
    </div>
</body>
</html>
