<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icon.png">
    <link rel="stylesheet" href="style.css">
    <title>Login</title>
    <style> h1, p, ul, li, a, input, button {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Times New Roman', Times, serif;
        color: #333;
        background: url('images/bg2.jpg') no-repeat center center fixed;
        background-size: cover;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    
    form {
        background-color: rgba(255, 255, 255, 0.514);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        max-width: 400px;
        width: 100%;
        text-align: center;
    }</style>
</head>

<body style="background: url('images/bg2.jpg') no-repeat center center fixed; background-size: cover;">
   
    <form action="Login" method="post" >
        <div class="Login">
       <h1>Login</h1>
        </div>  

    <div class="input-box">
        <label>User Name:</label>
        <input type="text" name="username" placeholder="Enter User Name" autocomplete="username">

        <label>Password:</label>
        <input type="Password" name="password" placeholder="Password"autocomplete="current-password">
    </div>

    <div class="login__check">
        <div class="login__check-box">
            <input type="checkbox" >
            <label>Remember me</label>
        </div>
        <a href="#">Forgot Password</a>
    </div>

    <div class="btn">
         <button>Login</button>
     </div>

    <div class="Sign">
        <p>Don't have an account? <a href="SignUp.jsp">Sign Up</a></p>
    </div>
 <script>
        <% if (request.getParameter("error") != null) { %>
            alert("<%= request.getParameter("error") %>");
        <% } %>
        
      
    </script>
    </form>
</body>
</html>