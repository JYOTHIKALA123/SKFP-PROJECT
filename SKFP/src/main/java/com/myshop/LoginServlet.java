package com.myshop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vjshop", "root", "JoThI@1");

            String query = "SELECT role FROM users WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");

                // After validating user credentials
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                if ("admin".equalsIgnoreCase(role)) {
                    // Redirect to admin order list page if the user is an admin
                    response.sendRedirect("Admin.jsp");
                } else {
                    // Redirect to products page if the user is a regular user
                    response.sendRedirect("Products.jsp");
                }
            } else {
                // Redirect back to login page with error message if login fails
                response.sendRedirect("Login.jsp?error=Invalid username or password");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

