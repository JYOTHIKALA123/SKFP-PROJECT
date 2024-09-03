package com.myshop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String product = request.getParameter("product");
        String quantity = request.getParameter("quantity");
     

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vjshop", "root", "JoThI@1");

            String sql = "INSERT INTO orders (username, phone, address, product, quantity) VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, phone);
            statement.setString(3, address);
            statement.setString(4, product);
            statement.setString(5, quantity);
            

            int rows = statement.executeUpdate();
            if (rows > 0) {
                response.getWriter().println("Order placed successfully!");
            } else {
                response.getWriter().println("Failed to place order.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
