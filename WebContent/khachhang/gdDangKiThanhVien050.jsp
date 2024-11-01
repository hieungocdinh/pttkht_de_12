<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký thành viên</title>
<style>
    /* Định dạng body */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }

    /* Container form */
    form {
        background-color: #fff;
        padding: 20px 40px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        max-width: 400px;
        width: 100%;
    }

    h1 {
        color: #333;
        text-align: center;
    }

    label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
        color: #555;
    }

    input[type="text"], input[type="password"], input[type="date"], input[type="email"], input[type="tel"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 16px;
    }

    button[type="submit"], button[type="button"] {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        font-weight: bold;
        margin-top: 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button[type="submit"] {
        background-color: #4CAF50;
        color: white;
    }

    button[type="submit"]:hover {
        background-color: #45a049;
    }

    button[type="button"] {
        background-color: #f44336;
        color: white;
    }

    button[type="button"]:hover {
        background-color: #e53935;
    }
    .back-button {
		    position: absolute;
		    top: 72px;
		    left: 120px;
		    padding: 10px;
		    background-color: #4CAF50;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		}
		
		.back-button:hover {
		    background-color: #45a049; /* Hiệu ứng khi hover */
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

<h1>Đăng ký thành viên</h1>
<button class="back-button" onclick="window.history.back()">
	Quay lại
</button>
<form action="doLuuDK050.jsp" method="post">
    <label for="tentaikhoan">Tên tài khoản:(*)</label>
    <input type="text" id="tentaikhoan" name="tentaikhoan" required><br><br>
    
    <label for="matkhau">Mật khẩu:(*)</label>
    <input type="password" id="matkhau" name="matkhau" required><br><br>
    
    <label for="hovaten">Họ và tên:(*)</label>
    <input type="text" id="hovaten" name="hovaten" required><br><br>
    
    <label for="ngaysinh">Ngày sinh:(*)</label>
    <input type="date" id="ngaysinh" name="ngaysinh" required><br><br>
    
    <label for="email">Email:(*)</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="sodienthoai">Số điện thoại:(*)</label>
    <input type="tel" id="sodienthoai" name="sodienthoai" required><br><br>
    
    <label for="diachi">Địa chỉ:</label>
    <input type="text" id="diachi" name="diachi"><br><br>
    
    <!-- Nút Đăng ký -->
    <button type="submit">Đăng ký</button>
</form>

</body>
</html>
