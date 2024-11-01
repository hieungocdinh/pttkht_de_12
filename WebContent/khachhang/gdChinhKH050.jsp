<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.ThanhVien050" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giao diện chính khách hàng</title>
<style>
    /* Định dạng body */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        color: #333;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }

    /* Định dạng tiêu đề */
    h1 {
        color: #4CAF50;
        text-align: center;
        margin: 20px 0;
    }

    p {
        color: #555;
        font-size: 18px;
        text-align: center;
        max-width: 500px;
        line-height: 1.6;
    }

    /* Định dạng form và nút */
    form {
        margin-top: 20px;
    }

    button[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        font-size: 18px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button[type="submit"]:hover {
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
<%
    // Lấy thông tin khách hàng từ session
    ThanhVien050 kh = (ThanhVien050) session.getAttribute("KH");

    // Kiểm tra xem khách hàng có session hay không
    if (kh == null) {
%>
        <h1>Chào mừng bạn đến với Giao diện chính khách hàng</h1>
        <p>Vui lòng đăng ký thành viên để nhận được các ưu đãi và dịch vụ tốt nhất!</p>

        <!-- Nút Đăng ký thành viên -->
        <form action="gdDangKiThanhVien050.jsp" method="get">
            <button type="submit">Đăng ký thành viên</button>
        </form>
<%
    } else {
%>
        <h1>Chào mừng, <%= kh.getHovaten() %>!</h1>
        <p>Rất vui được phục vụ bạn!</p>
<%
    }
%>
</body>

</html>
