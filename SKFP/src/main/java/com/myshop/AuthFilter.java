package com.myshop;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/Product.jsp", "/Order.jsp", "/AdminServlet"})
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(jakarta.servlet.ServletRequest request, jakarta.servlet.ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);

        // Check if the user is logged in
        if (session == null || session.getAttribute("username") == null) {
            // If not logged in, redirect to the login page
            httpResponse.sendRedirect("Login.jsp");
        } else {
            // If logged in, proceed to the requested page
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
