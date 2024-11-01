package dao;

import model.ThanhVien050;
import model.KhachHang050;

import java.sql.*;

public class ThanhVienDAO050 extends DAO050 {

    public ThanhVienDAO050() {
        super();
    }

    public boolean luuDangKi(ThanhVien050 thanhvien) {
    	String sql = "INSERT INTO tblthanhvien050 (tentaikhoan, matkhau, hovaten, ngaysinh, email, sodienthoai, diachi) VALUES (?, ?, ?, ?, ?, ?, ?)";
    	try (Connection conn = this.getConnection();
	        PreparedStatement stmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)) {
	            stmt.setString(1, thanhvien.getTentaikhoan());
	            stmt.setString(2, thanhvien.getMatkhau());
	            stmt.setString(3, thanhvien.getHovaten());
	            stmt.setDate(4, thanhvien.getNgaysinh());
	            stmt.setString(5, thanhvien.getEmail());
	            stmt.setString(6, thanhvien.getSodienthoai());
	            stmt.setString(7, thanhvien.getDiachi());
	
	            int affectedRows = stmt.executeUpdate();

	            if (affectedRows > 0) {
	                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
	                    if (generatedKeys.next()) {
	                        int thanhvienid = generatedKeys.getInt(1);
	                        // Gọi KhachHangDAO để thêm bản ghi vào bảng tblKhachHang050
	                        KhachHang050 khachhang = new KhachHang050(thanhvienid);
	                        KhachHangDAO050 khachhangDao = new KhachHangDAO050();
	                        return khachhangDao.insert(khachhang);
	                    }
	                }
	            }
	    } catch (SQLException e) {
	            e.printStackTrace();
	    }
    	return false;
    }
    
    public ThanhVien050 check(ThanhVien050 thanhvien050) {
        String sql = "SELECT * FROM tblthanhvien050 WHERE tentaikhoan = ? AND matkhau = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
             
            statement.setString(1, thanhvien050.getTentaikhoan());
            statement.setString(2, thanhvien050.getMatkhau());
            
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
            	ThanhVien050 thanhvien = new ThanhVien050();
            	
            	thanhvien.setId(resultSet.getInt("id"));
            	thanhvien.setHovaten(resultSet.getString("hovaten"));
            	
                return thanhvien;  
            } else {
                return null; 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null; // Trả về null nếu có lỗi xảy ra
        }
    }
    
    public ThanhVien050 findById(int id) {
        String sql = "SELECT * FROM tblthanhvien050 WHERE id = ?";
        ThanhVien050 thanhVien = null;

        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
             
            statement.setInt(1, id);
            
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                thanhVien = new ThanhVien050();
                thanhVien.setId(resultSet.getInt("id"));
                thanhVien.setTentaikhoan(resultSet.getString("tentaikhoan"));
                thanhVien.setMatkhau(resultSet.getString("matkhau"));
                thanhVien.setHovaten(resultSet.getString("hovaten"));
                thanhVien.setNgaysinh(resultSet.getDate("ngaysinh"));
                thanhVien.setEmail(resultSet.getString("email"));
                thanhVien.setSodienthoai(resultSet.getString("sodienthoai"));
                thanhVien.setDiachi(resultSet.getString("diachi"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return thanhVien;
    }

}
