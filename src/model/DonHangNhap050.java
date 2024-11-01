package model;

public class DonHangNhap050 {
    private int id;
    private String ma;
    private float tongtien;
    private String ngaynhap;
    private int nhaCungCapId;
    private int thanhVienId;

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

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public String getNgaynhap() {
        return ngaynhap;
    }

    public void setNgaynhap(String ngaynhap) {
        this.ngaynhap = ngaynhap;
    }

    public int getNhaCungCapId() {
        return nhaCungCapId;
    }

    public void setNhaCungCapId(int nhaCungCapId) {
        this.nhaCungCapId = nhaCungCapId;
    }

    public int getThanhVienId() {
        return thanhVienId;
    }

    public void setThanhVienId(int thanhVienId) {
        this.thanhVienId = thanhVienId;
    }
}
