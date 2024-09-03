<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/icon.png">
    <title>Admin Order List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Order List</h2>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Username</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Product</th>
                <th>Quantity</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vjshop", "root", "JoThI@1");
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM orders";
                    rs = stmt.executeQuery(sql);

                    while(rs.next()){
                        int orderId = rs.getInt("order_id");
                        String username = rs.getString("username");
                        String phone = rs.getString("phone");
                        String address = rs.getString("address");
                        String product = rs.getString("product");
                        int quantity = rs.getInt("quantity");

                        out.println("<tr>");
                        out.println("<td>" + orderId + "</td>");
                        out.println("<td>" + username + "</td>");
                        out.println("<td>" + phone + "</td>");
                        out.println("<td>" + address + "</td>");
                        out.println("<td>" + product + "</td>");
                        out.println("<td>" + quantity + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
