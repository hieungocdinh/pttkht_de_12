package dao;

import model.NhanVien050;
import java.sql.*;

public class NhanVienDAO050 extends DAO050 {

    public NhanVienDAO050() {
        super();
    }

    public NhanVien050 findById(int thanhVienId) {
    	String sql = "SELECT nv.*, tv.* " +
    	        "FROM tblNhanVien050 nv " +
    	        "JOIN tblThanhVien050 tv ON nv.tblThanhVien050id = tv.id " +
    	        "WHERE nv.tblThanhVien050id = ?";
        
        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
             
            statement.setInt(1, thanhVienId);
            
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
            	NhanVien050 nhanvien = new NhanVien050();
            	nhanvien.setId(resultSet.getInt("tblThanhVien050id"));
            	nhanvien.setMaNV(resultSet.getString("maNV"));
            	nhanvien.setVitri(resultSet.getString("vitri"));
            	nhanvien.setHovaten(resultSet.getString("hovaten"));
            	
                return nhanvien;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null; 
        }
    }
}
