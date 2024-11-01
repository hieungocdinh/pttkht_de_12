package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import model.TKKhachHangTheoDoanhThu050;

public class TKKhachHangTheoDoanhThuDAO050 extends DAO050 {
	
	public TKKhachHangTheoDoanhThuDAO050() {
        super();
    }
	
	public List<TKKhachHangTheoDoanhThu050> getTKKhachHangTheoDoanhThu(String ngayBD, String ngayKT) {
        List<TKKhachHangTheoDoanhThu050> customerRevenueList = new ArrayList<>();
        String sql = "SELECT kh.tblThanhVien050id, kh.maKH, tv.hovaten, " +
                "SUM(CASE " +
                "WHEN ddh.loaiDonHang = 'TRUCTIEP' THEN ddh.tongtien " +
                "WHEN ddh.loaiDonHang = 'TRUCTUYEN' AND ddh.trangthai = 'DAHOANTHANH' THEN ddh.tongtien " +
                "ELSE 0 " +
                "END) AS tong_tien " +
                "FROM tblKhachHang050 AS kh " +
                "LEFT JOIN tblDonDatHang050 AS ddh " +
                "ON kh.tblThanhVien050id = ddh.tblKhachHang050id " +
                "LEFT JOIN tblThanhVien050 AS tv " +
                "ON kh.tblThanhVien050id = tv.id " +
                "WHERE ddh.thoigiandathang >= ? " +
                "AND ddh.thoigiandathang <= ? " +
                "GROUP BY kh.tblThanhVien050id, kh.maKH, tv.hovaten " +
                "HAVING tong_tien > 0 " +
                "ORDER BY tong_tien DESC";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Set the start and end dates for the query
            stmt.setString(1, ngayBD+" 00:00:00");
            stmt.setString(2, ngayKT+" 23:59:59");
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // Retrieve data from the result set
                	Integer tblThanhVien050id = rs.getInt("tblThanhVien050id");
                	String hovaten = rs.getString("hovaten");
                    String maKH = rs.getString("maKH");
                    double tongTien = rs.getDouble("tong_tien");
                    
                    // Create a new TKKhachHangTheoDoanhThu050 object and add it to the list
                    TKKhachHangTheoDoanhThu050 customerRevenue = new TKKhachHangTheoDoanhThu050(tblThanhVien050id, maKH, hovaten, tongTien, Date.valueOf(ngayBD), Date.valueOf(ngayKT));
                    customerRevenueList.add(customerRevenue);
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return customerRevenueList;
    }
	
}
