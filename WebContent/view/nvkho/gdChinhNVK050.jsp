<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.NhanVien050" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NVK</title>
</head>
<body>
<h1>GD chính NV Kho</h1>
<main>
	<%
		NhanVien050 nvk = (NhanVien050)session.getAttribute("NVK");
		if(nvk==null){
			response.sendRedirect("/bt_pttkht_de12/view/thanhvien/gdDangNhap050.jsp");
			return;
		}
	%>
    <h2>Xin chào, <%= nvk.getHovaten() != null ? nvk.getHovaten() : "khongxacdinh" %></h2>
</main>
</body>
</html>