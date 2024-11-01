package model;

import java.sql.Date;
import java.text.DecimalFormat;

public class TKKhachHangTheoDoanhThu050 extends KhachHang050 {
	private Date ngayBD;
	private Date ngayKT;
    private double tongDoanhThu;

    // Constructor
    public TKKhachHangTheoDoanhThu050() {
        super(); // Gọi constructor của lớp cha
    }
    
    public TKKhachHangTheoDoanhThu050(int khachhangId, String maKH, String hovaten, Double tongdoanhthu, Date ngayBD, Date ngayKT) {
        this.setId(khachhangId);
        this.setMaKH(maKH);
        this.setHovaten(hovaten);
        this.tongDoanhThu = tongdoanhthu;
        this.ngayBD = ngayBD;
        this.ngayKT = ngayKT;
    }

    // Getter và Setter cho tongDoanhThu
    public double getTongDoanhThu() {
        return tongDoanhThu;
    }
    
    public String getTongDoanhThuFormatted() {
        DecimalFormat df = new DecimalFormat("#,##0.00");
        return df.format(tongDoanhThu);
    }

    public void setTongDoanhThu(double tongDoanhThu) {
        this.tongDoanhThu = tongDoanhThu;
    }
    
    public Date getNgayBD() {
    	return ngayBD;
    }
    
    public void setNgayBD(Date ngayBD) {
        this.ngayBD = ngayBD;
    }
    
    public Date getNgayKT() {
    	return ngayKT;
    }
    
    public void setNgayKT(Date ngayKT) {
        this.ngayKT = ngayKT;
    }
}
