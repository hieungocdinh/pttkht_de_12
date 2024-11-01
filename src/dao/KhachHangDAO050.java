package dao;

import model.KhachHang050;
import java.sql.*;

public class KhachHangDAO050 extends DAO050 {

    public KhachHangDAO050() {
        super();
    }

    public boolean insert(KhachHang050 khachhang) {
        String sql = "INSERT INTO tblkhachhang050 (tblThanhVien050id, maKH) VALUES (?, ?)";
        try (Connection conn = this.getConnection()) {
            
            // Dùng chung kết nối cho generateMaKhachHang
            String maKH = generateMaKhachHang(conn); 
            khachhang.setMaKH(maKH);

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, khachhang.getId());
                stmt.setString(2, khachhang.getMaKH());
                return stmt.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public KhachHang050 findById(int khachhangId) {
    	String sql = "SELECT kh.*, tv.* " +
                "FROM tblKhachHang050 kh " +
                "JOIN tblThanhVien050 tv ON kh.tblThanhVien050id = tv.id " +
                "WHERE kh.tblThanhVien050id = ?";
        
        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
        	
            statement.setInt(1, khachhangId);
            
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                KhachHang050 khachhang = new KhachHang050();
                khachhang.setId(khachhangId);
                khachhang.setMaKH(resultSet.getString("maKH"));
                khachhang.setHovaten(resultSet.getString("hovaten"));
                
                return khachhang;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null; 
        }
    }
    
    //gen maKH
    private String generateMaKhachHang(Connection conn) {
        String sql = "SELECT maKH FROM tblkhachhang050 ORDER BY maKH DESC LIMIT 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
             
            if (rs.next()) {
                String lastMaKH = rs.getString("maKH");
                int lastNumber = Integer.parseInt(lastMaKH.substring(2));
                return String.format("KH%03d", lastNumber + 1);
            } else {
                return "KH001";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "KH001"; // Trả về KH001 nếu có lỗi
        }
    }
}
