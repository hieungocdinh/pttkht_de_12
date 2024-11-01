<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>

<%@ page import="dao.ThanhVienDAO050" %>
<%@ page import="model.ThanhVien050" %>

<%
    // Khai báo các biến
    String tentaikhoan = request.getParameter("tentaikhoan");
    String matkhau = request.getParameter("matkhau");
    String hovaten = request.getParameter("hovaten");
    String ngaysinhStr = request.getParameter("ngaysinh");
    String email = request.getParameter("email");
    String sodienthoai = request.getParameter("sodienthoai");
    String diachi = request.getParameter("diachi");
    if (diachi == null || diachi.trim().isEmpty()) {
        diachi = null;
    }
    
	 // Định dạng ngày "dd/MM/yyyy"
    Date ngaysinhDate = Date.valueOf(ngaysinhStr);

    ThanhVienDAO050 thanhvienDao = new ThanhVienDAO050();
    
    // Tạo đối tượng ThanhVien050 và gán giá trị
    ThanhVien050 khachhang = new ThanhVien050(tentaikhoan, matkhau, hovaten, ngaysinhDate, email, sodienthoai, diachi);
    
    try {
        // Gọi phương thức để thêm thành viên vào cơ sở dữ liệu
        boolean success = thanhvienDao.luuDangKi(khachhang);
        if (success) {
        	// Sau khi đăng ký thành công
            request.getSession().setAttribute("message", "Đăng ký thành công!");
            response.sendRedirect("gdChinhKH050.jsp");
        } else {
            // Đăng ký thất bại
            request.getSession().setAttribute("message", "Đăng ký thất bại. Vui lòng thử lại.");
            response.sendRedirect("gdDangKiThanhVien050.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.getSession().setAttribute("message", "Đăng ký thất bại do lỗi hệ thống.");
        response.sendRedirect("gdDangKiThanhVien050.jsp");
    }
%>
