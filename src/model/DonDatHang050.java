package model;

import java.text.DecimalFormat;

public class DonDatHang050 {
    private int id;
    private String ma;
    private String thoigiandathang;
    private float tongtien;
    private String loaiDonHang;
    private String trangthai;
    private String diachi;
    private int nhanVienId;
    private int khachHangId;
    
    //Constructor
    public DonDatHang050() {
    	
    }
    
	public DonDatHang050(int id, String ma, String thoigiandathang, Float tongtien, String loaidonhang) {
		this.id = id;
		this.ma = ma;
		this.thoigiandathang = thoigiandathang;
		this.tongtien = tongtien;
		this.loaiDonHang = loaidonhang;
	}
    
    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMa() {
        return ma;
    }

    public void setMa(String ma) {
        this.ma = ma;
    }

    public String getThoigiandathang() {
        return thoigiandathang;
    }

    public void setThoigiandathang(String thoigiandathang) {
        this.thoigiandathang = thoigiandathang;
    }

    public float getTongtien() {
        return tongtien;
    }
    
    public String getTongtienFormatted() {
        DecimalFormat df = new DecimalFormat("#,##0.00");
        return df.format(tongtien);
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public String getLoaiDonHang() {
        return loaiDonHang;
    }

    public void setLoaiDonHang(String loaiDonHang) {
        this.loaiDonHang = loaiDonHang;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public int getNhanVienId() {
        return nhanVienId;
    }

    public void setNhanVienId(int nhanVienId) {
        this.nhanVienId = nhanVienId;
    }

    public int getKhachHangId() {
        return khachHangId;
    }

    public void setKhachHangId(int khachHangId) {
        this.khachHangId = khachHangId;
    }
}
