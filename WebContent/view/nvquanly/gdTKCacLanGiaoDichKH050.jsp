<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat" %>

<%@ page import="model.NhanVien050"%>
<%@ page import="dao.KhachHangDAO050"%>
<%@ page import="model.KhachHang050"%>
<%@ page import="dao.DonDatHangDAO050"%>
<%@ page import="model.DonDatHang050"%>     
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Thống kê các lần giao dịch của khách hàng</title>
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
	    
	    .main{
	    	width:1024px;
	    	margin: 0 auto;
	    }
	    
        h1 {
            text-align: center;
        }
        .form-container {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="date"] {
       		width: 160px;
            padding: 12px;
            margin: 0 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049; /* Hiệu ứng khi hover */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: right;
        }
        th {
            background-color: #4CAF50;
            color: white;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
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
</head>
<body>
	<%
		NhanVien050 nvql = (NhanVien050)session.getAttribute("NVQL");
		if(nvql==null){
			response.sendRedirect("/bt_pttkht_de12/view/thanhvien/gdDangNhap050.jsp");
			return;
		}
		
		Integer khachhangId = Integer.parseInt(request.getParameter("khachhangId"));
		String ngayBD = request.getParameter("ngayBD");
	    String ngayKT = request.getParameter("ngayKT");
	    
	    KhachHang050 kh = null;
	    List<DonDatHang050> results = null;
	    
	    if (khachhangId != null ){
	    	KhachHangDAO050 khachhangDao = new KhachHangDAO050();
	    	kh = khachhangDao.findById(khachhangId);
	    	
	    }
	    if (ngayBD != null && ngayKT != null) {
	    	DonDatHangDAO050 dondathangDao = new DonDatHangDAO050();
	    	results = dondathangDao.getCacLanGiaoDichKH(ngayBD,ngayKT,khachhangId);
	    }
	%>
	
	<nav>
	    <a href="gdChonTK050.jsp">Xem Thống Kê</a>
	    <a href="#">Quản Lý Nhân Viên</a>
	    <a href="#">Lập Báo Cáo</a>
	    <a href="#">Cài Đặt</a>
	    <a href="#">Đăng Xuất</a>
	</nav>
	<div class="main">
		<button class="back-button" onclick="window.history.back()">
		    Quay lại
		</button>
		<h1>Thống kê các lần giao dịch của khách hàng</h1>
	    <div class="info-container">
	        <p><strong>Ngày bắt đầu:</strong> <span id="ngayBDDisplay"><%= request.getParameter("ngayBD") %></span></p>
	        <p><strong>Ngày kết thúc:</strong> <span id="ngayKTDisplay"><%= request.getParameter("ngayKT") %></span></p>
	        <p><strong>Mã khách hàng:</strong> <span id="maKHDisplay"><%= kh != null ? kh.getMaKH() : "Không có thông tin" %></span></p>
	        <p><strong>Tên khách hàng:</strong> <span id="tenKHDisplay"><%= kh != null ? kh.getHovaten() : "Không có thông tin" %></span></p>
    	</div>
	    
	    <table id="resultsTable">
		    <thead>
		        <tr>
		            <th>STT</th>
		            <th>Mã HĐ</th>
		            <th>Thời gian</th>
		            <th>Loại đơn hàng</th>
		            <th>Tổng tiền</th>
		        </tr>
		    </thead>
		    <tbody>
		        <%
		            if (results != null && !results.isEmpty()) {
		                int stt = 1;
		                double tongTien = 0; // Biến để lưu tổng tiền
		
		                for (DonDatHang050 ddh : results) {
		        %>
		                    <tr>
		                        <td><%= stt++ %></td>
		                        <td><%= ddh.getMa() %></td>
		                        <td><%= ddh.getThoigiandathang() %></td>
		                        <td><%= ddh.getLoaiDonHang() %></td>
		                        <td><%= ddh.getTongtienFormatted() %> VNĐ</td>
		                    </tr>
		        <%
		                    tongTien += ddh.getTongtien();
		                }
		        %>
		                <tr>
		                    <td colspan="4" style="text-align: right;"><strong>Tổng cộng:</strong></td>
		                    <td><strong><%= new DecimalFormat("#,##0.00").format(tongTien) %> VNĐ</strong></td> 
		                </tr>
		        <%
		            } else {
		        %>
		                <tr>
		                    <td colspan="4" style="text-align: center;">Không có dữ liệu.</td>
		                </tr>
		        <%
		            }
		        %>
		    </tbody>
		</table>
    </div>
</body>
</html>