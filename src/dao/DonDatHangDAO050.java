package dao;

import model.DonDatHang050;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonDatHangDAO050 extends DAO050 {

    public DonDatHangDAO050() {
        super();
    }

    public List<DonDatHang050> getCacLanGiaoDichKH(String ngayBD, String ngayKT, int khachhangId) {
        List<DonDatHang050> donDatHangList = new ArrayList<>();
        String sql = "SELECT * FROM tblDonDatHang050 " +
                "WHERE tblKhachHang050id = ? " +
                "AND thoigiandathang >= ? " +
                "AND thoigiandathang <= ? " +
                "AND ((loaiDonHang = 'TRUCTIEP') OR (loaiDonHang = 'TRUCTUYEN' AND trangthai = 'DAHOANTHANH')) " +
                "ORDER BY thoigiandathang DESC";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, khachhangId);
            stmt.setString(2, ngayBD + " 00:00:00"); 
            stmt.setString(3, ngayKT + " 23:59:59");
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                DonDatHang050 donDatHang = new DonDatHang050(rs.getInt("id"), rs.getString("ma"), rs.getString("thoigiandathang"), rs.getFloat("tongtien"), rs.getString("loaiDonHang"));
                
                donDatHangList.add(donDatHang);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return donDatHangList;
    }
}
