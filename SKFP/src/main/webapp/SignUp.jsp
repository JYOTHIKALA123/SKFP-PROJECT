<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icon.png">
    <link rel="stylesheet" href="style.css">
    <title>Sign Up</title>
</head>
<body style="background: url('images/background1.avif') no-repeat center center fixed; background-size: cover;">
    <div class="Signup">
        <h1>SIGN UP</h1>
    </div>
    
    <!-- Success Message  -->
    <div id="message" style="color: green; font-size: 18px;">
        <% if (request.getAttribute("message") != null) { %>
            <%= request.getAttribute("message") %>
        <% } %>
    </div>


<form action="SignServlet" method="post"class="inputs" onsubmit="return validateForm();">

        <div class="inputs">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Example@gmail.com" autocomplete="email">

            <label for="username">UserName:</label>
            <input type="text" id="username" name="username" placeholder="Enter your name" autocomplete="username">
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Password" autocomplete="current-password">
            
            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" autocomplete="new-password">
        </div>
        <div class="button">
            <button type="submit" onclick="signup()">Create Account</button>
        </div>
    </form>
    <div class="footer">
        <h3>Already have an Account? <a href="Login.jsp">Login</a></h3>
    </div>
   <script src="signup.js"></script>
   <script>
       function signup() {
           alert("Sign up successfully!");
       }

       document.getElementById("submit").onclick = function() {
           window.location.href = "Login.jsp";
       };
   </script>
</body>
</html>
