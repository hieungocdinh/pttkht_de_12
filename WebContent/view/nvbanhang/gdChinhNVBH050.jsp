<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.NhanVien050" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NVBH</title>
</head>
<body>
	<h1>GD chính NV Bán Hàng</h1>
	<%
		NhanVien050 nvbh = (NhanVien050)session.getAttribute("NVBH");
		if(nvbh==null){
			response.sendRedirect("/bt_pttkht_de12/view/thanhvien/gdDangNhap050.jsp");
			return;
		}
	%>
    <h2>Xin chào, <%= nvbh.getHovaten() != null ? nvbh.getHovaten() : "khongxacdinh" %></h2>
</body>
</html>