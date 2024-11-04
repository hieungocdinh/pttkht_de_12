<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.NhanVien050" %>
<%@ page import="dao.TKKhachHangTheoDoanhThuDAO050"%>
<%@ page import="model.TKKhachHangTheoDoanhThu050"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.Date" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống kê khách hàng theo doanh thu</title>
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
		
		 	String ngayBD = request.getParameter("ngayBD");
		    String ngayKT = request.getParameter("ngayKT");
		    List<TKKhachHangTheoDoanhThu050> results = null;

		    if (ngayBD != null && ngayKT != null) {
		    	TKKhachHangTheoDoanhThuDAO050 tkkhachhangtheodoanhthuDao = new TKKhachHangTheoDoanhThuDAO050();
		        results = tkkhachhangtheodoanhthuDao.getTKKhachHangTheoDoanhThu(ngayBD, ngayKT);
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
    <div class="main">
		<button class="back-button" onclick="window.history.back()">
		    Quay lại
		</button>
	    <h1>Thống kê khách hàng theo doanh thu</h1>
	    <div class="form-container">
	        <form id="dateForm" method="get">
		        <input type="date" id="ngayBD" name="ngayBD" value="<%= ngayBD != null ? ngayBD : "" %>" required>
		        <input type="date" id="ngayKT" name="ngayKT" value="<%= ngayKT != null ? ngayKT : "" %>" required>
		        <button type="button" onclick="generateReport()">Thống Kê</button>
		    </form>
	    </div>
	    
	    <table id="resultsTable">
	        <thead>
	            <tr>
	                <th>STT</th>
	                <th>Mã KH</th>
	                <th>Tên khách hàng</th>
	                <th>Tổng doanh thu</th>
	                <th>Xem chi tiết</th>
	            </tr>
	        </thead>
	        <tbody>
	         	<%
				    if (results != null && !results.isEmpty()) {
				    	int stt = 1;
				        for (TKKhachHangTheoDoanhThu050 tk : results) {
				%>
				            <tr>
				                <td><%= stt++ %></td>
				                <td><%= tk.getMaKH() %></td>
				                <td><%= tk.getHovaten() %></td>
				                <td><%= tk.getTongDoanhThuFormatted() %> VNĐ</td>
				                <td>
					                <a href="gdTKCacLanGiaoDichKH050.jsp?khachhangId=<%= tk.getId() %>&ngayBD=<%= request.getParameter("ngayBD") %>&ngayKT=<%= request.getParameter("ngayKT") %>">Xem chi tiết</a>
				                </td>
				            </tr>
				<%
				        }
				    } else {
				%>
				    <tr>
				        <td colspan="5" style="text-align:center">Không có dữ liệu thống kê</td>
				    </tr>
				<%
				    }
				%>
	        </tbody>
	    </table>
    </div>

   <script>
        function generateReport() {
            const startDate = document.getElementById("ngayBD").value;
            const endDate = document.getElementById("ngayKT").value;

            if (!startDate || !endDate) {
                alert("Vui lòng nhập ngày bắt đầu và ngày kết thúc.");
                return;
            }
            
	         // Chuyển đổi ngày thành đối tượng Date để so sánh
	            const start = new Date(startDate);
	            const end = new Date(endDate);

            // Kiểm tra nếu ngày bắt đầu lớn hơn hoặc bằng ngày kết thúc
            if (start >= end) {
                alert("Ngày bắt đầu phải nhỏ hơn ngày kết thúc.");
                return;
            }

            // Tạo một form ẩn để gửi dữ liệu đến server
            document.getElementById("dateForm").submit();
        }
    </script>
</body>
</html>
