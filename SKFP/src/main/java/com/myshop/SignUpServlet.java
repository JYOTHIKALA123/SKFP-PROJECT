package com.myshop;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/SignServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail=request.getParameter("email");
		String uname=request.getParameter("username");
		String upwd=request.getParameter("password");
		RequestDispatcher dispatcher=null; 
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vjshop","root","JoThI@1");
			PreparedStatement pst=con.prepareStatement("insert into users(email,username,password) values(?,?,?)");
			pst.setString(1,uemail);
			pst.setString(2,uname);
			pst.setString(3,upwd);
			
			int rowCount=pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("Login.jsp");
			if (rowCount >0) {
				request.setAttribute("message", "You have successfully created an account!");
				request.setAttribute("status","success");
				 
			}else {
				request.setAttribute("message", "Account creation failed. Please try again.");
				request.setAttribute("status","faild");
				
			}
			
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
	}finally {
		try{
			con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
	
}

