package dao;

import model.NhanVien050;
import java.sql.*;

public class NhanVienDAO050 extends DAO050 {

    public NhanVienDAO050() {
        super();
    }

    public NhanVien050 findById(int thanhVienId) {
    	String sql = "SELECT * FROM tblNhanVien050 WHERE tblThanhVien050id = ?";
        
        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
             
            statement.setInt(1, thanhVienId);
            
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
            	NhanVien050 nhanvien = new NhanVien050();
            	nhanvien.setId(resultSet.getInt("tblThanhVien050id"));
            	nhanvien.setMaNV(resultSet.getString("maNV"));
            	nhanvien.setVitri(resultSet.getString("vitri"));
            	
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
