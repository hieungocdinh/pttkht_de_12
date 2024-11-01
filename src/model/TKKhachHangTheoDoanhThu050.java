package model;

import java.sql.Date;
import java.text.DecimalFormat;

public class TKKhachHangTheoDoanhThu050 extends KhachHang050 {
	private Date ngayBD;
	private Date ngayKT;
	private String hovaten;
    private double tongDoanhThu;

    // Constructor
    public TKKhachHangTheoDoanhThu050() {
        super(); // Gọi constructor của lớp cha
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
    
    public String getHovaten() {
        return hovaten;
    }

    public void setHovaten(String hovaten) {
        this.hovaten = hovaten;
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
