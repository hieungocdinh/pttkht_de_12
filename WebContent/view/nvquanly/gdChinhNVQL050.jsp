<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.NhanVien050" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NVQL</title>
<style>
    /* CSS cho bố cục */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
    }
    nav {
        display: flex;
        justify-content: center;
        background-color: #444;
    }
    nav a {
        color: #fff;
        padding: 1em;
        text-decoration: none;
        text-align: center;
    }
    nav a:hover {
        background-color: #555;
    }
    main {
        padding: 20px;
        max-width: 1000px;
        margin: auto;
    }
</style>
</head>
<body>
<%
	NhanVien050 nvql = (NhanVien050)session.getAttribute("NVQL");
	if(nvql==null){
		response.sendRedirect("/bt_pttkht_de12/view/thanhvien/gdDangNhap050.jsp");
		return;
	}
%>

<nav>
    <a href="gdChonTK050.jsp">Xem Thống Kê</a>
    <a href="#">Quản Lý Nhân Viên</a>
    <a href="#">Lập Báo Cáo</a>
    <a href="#">Cài Đặt</a>
    <a href="#">Đăng Xuất</a>
</nav>

<main>
    <h2>Xin chào, <%= nvql.getHovaten() != null ? nvql.getHovaten() : "khongxacdinh" %></h2>
    <p>Chọn chức năng từ thanh điều hướng để tiếp tục.</p>
</main>
</body>
</html>
