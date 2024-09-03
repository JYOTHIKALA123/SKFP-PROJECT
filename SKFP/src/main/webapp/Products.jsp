<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Display</title>
    <link rel="icon" href="images/icon.png">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Times New Roman', Times, serif;
            background: url('images/bg2.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            margin: 0;
            padding: 20px;
        }
        .hidden {
            display: none;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .product-item {
            border: 1px solid #1a1919;
            padding: 20px;
            text-align: center;
            width: 20%;
            background-color: rgba(245, 238, 238, 0.76);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .product-item img {
            max-width: 50%;
            height: auto;
        }

        button {
            margin: 5px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #333;
            color: #fff;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div>
        <button id="sweetBtn">Sweet</button>
        <button id="karamBtn">Karam</button>
        <button id="foodBtn">Food</button>
    </div>

    <div id="productGrid" class="product-grid hidden"></div>

    <script src="script.js"></script>
</body>
</html>
