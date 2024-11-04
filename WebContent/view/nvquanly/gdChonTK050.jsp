<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.NhanVien050"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chọn thống kê</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
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
        h1 {
            text-align: center;
        }
        .list {
            list-style-type: none; /* Bỏ dấu đầu dòng */
            padding: 0;
            text-align: center;
        }
        .list li {
            margin: 15px 0; /* Tăng khoảng cách giữa các mục */
        }
        .list a {
            text-decoration: none;
            min-width:300px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
            display: inline-block; /* Để khoảng cách padding hoạt động tốt hơn */
        }
        .list a:hover {
            background-color: #45a049; /* Hiệu ứng khi hover */
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
	    <a href="/bt_pttkht_de12/view/nvquanly/gdChinhNVQL050.jsp">Trang chủ</a>
    	<a href="/bt_pttkht_de12/view/nvquanly/gdChonTK050.jsp">Xem Thống Kê</a>
	    <a href="#">Quản Lý Nhân Viên</a>
	    <a href="#">Lập Báo Cáo</a>
	    <a href="#">Cài Đặt</a>
	    <a href="#">Đăng Xuất</a>
	</nav>
    <h1>Danh Sách Thống Kê</h1>
    <ul class="list">
        <li><a href="gdTKKhachHangTheoDoanhThu050.jsp">Thống kê khách hàng theo doanh thu</a></li>
        <li><a href="#">Thống kê doanh thu</a></li>
        <li><a href="#">Thống kê mặt hàng</a></li>
        <li><a href="#">Thống kê nhà cung cấp</a></li>
    </ul>
</body>
</html>
