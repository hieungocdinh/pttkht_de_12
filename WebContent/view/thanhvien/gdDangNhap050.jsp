<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .login-container {
        width: 300px;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .login-container h2 {
        text-align: center;
        margin-bottom: 20px;
    }
    .login-container input[type="text"], 
    .login-container input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        box-sizing: border-box;
    }
    .login-container button {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
    .login-container button:hover {
        background-color: #45a049;
    }
</style>
<script>
	window.onload = function() {
	    var message = '<%= session.getAttribute("message") != null ? session.getAttribute("message") : "" %>';
	    if (message) {
	        alert(message);
	        <% session.removeAttribute("message"); %>  
	    }
	};
</script>
</head>
<body>

<div class="login-container">
    <h2>Đăng Nhập</h2>
    <form action="doDangNhap050.jsp" method="post">
        <label for="tentaikhoan">Tên đăng nhập:</label>
        <input type="text" id="tentaikhoan" name="tentaikhoan" required>

        <label for="matkhau">Mật khẩu:</label>
        <input type="password" id="matkhau" name=matkhau required>

        <button type="submit">Đăng nhập</button>
    </form>
</div>

</body>
</html>
