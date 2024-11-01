<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.ThanhVienDAO050" %>
<%@ page import="dao.KhachHangDAO050" %>
<%@ page import="dao.NhanVienDAO050" %>
<%@ page import="model.ThanhVien050" %>
<%@ page import="model.KhachHang050" %>
<%@ page import="model.NhanVien050" %>

<%
    // Khai báo các biến
    String tentaikhoan = request.getParameter("tentaikhoan");
    String matkhau = request.getParameter("matkhau");
    
    ThanhVienDAO050 thanhvienDao = new ThanhVienDAO050();
    KhachHangDAO050 khachhangDao = new KhachHangDAO050();
    NhanVienDAO050 nhanvienDao = new NhanVienDAO050();
    
    // Tạo đối tượng ThanhVien050 và gán giá trị
    ThanhVien050 thanhvien050 = new ThanhVien050();
    thanhvien050.setTentaikhoan(tentaikhoan);
    thanhvien050.setMatkhau(matkhau);
    
    // Kiểm tra thông tin đăng nhập
    ThanhVien050 thanhvien = thanhvienDao.check(thanhvien050);
    if (thanhvien == null) {
    	request.getSession().setAttribute("message", "Đăng nhập thất bại do sai tên tài khoản hoặc mật khẩu!");
        response.sendRedirect("gdDangNhap050.jsp");
    } else {
    	Integer thanhvienId = thanhvien.getId();
        KhachHang050 kh = khachhangDao.findById(thanhvienId);
        if (kh == null) {
            NhanVien050 nv = nhanvienDao.findById(thanhvienId);
            if (nv == null) {
            	request.getSession().setAttribute("message", "Lỗi server, bạn vui lòng liên hệ với nhân viên để hỗ trợ nhé!");
                response.sendRedirect("gdDangNhap050.jsp");
            } else {
                if (nv.getVitri().equals("NVBH")) {
                	session.setAttribute("NVBH", nv);
                    response.sendRedirect("/bt_pttkht_de12/view/nvbanhang/gdChinhNVBH050.jsp");
                } else if (nv.getVitri().equals("NVK")) {
                	session.setAttribute("NVK", nv);
                    response.sendRedirect("/bt_pttkht_de12/view/nvkho/gdChinhNVK050.jsp");
                } else if (nv.getVitri().equals("NVQL")) {
                	session.setAttribute("NVQL", nv);
                    response.sendRedirect("/bt_pttkht_de12/view/nvquanly/gdChinhNVQL050.jsp");
                }
            }
        } else {
        	session.setAttribute("KH", kh);
            response.sendRedirect("/bt_pttkht_de12/view/khachhang/gdChinhKH050.jsp");
        }
    }
%>
