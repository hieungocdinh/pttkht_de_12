package model;

import java.sql.Date;

public class ThanhVien050 {
    private int id;
    private String tentaikhoan;
    private String matkhau;
    private String hovaten;
    private Date ngaysinh;
    private String email;
    private String sodienthoai;
    private String diachi;

    // Constructors, getters, and setters
    public ThanhVien050() {
    }
    
    public ThanhVien050(String tentaikhoan, String matkhau, String hovaten, Date ngaysinh, String email, String sodienthoai, String diachi) {
    	this.tentaikhoan = tentaikhoan;
    	this.matkhau = matkhau;
    	this.hovaten = hovaten;
    	this.ngaysinh = ngaysinh;
    	this.email = email;
    	this.sodienthoai = sodienthoai;
    	this.diachi = diachi;
    }
    // Add constructors as needed

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTentaikhoan() {
        return tentaikhoan;
    }

    public void setTentaikhoan(String tentaikhoan) {
        this.tentaikhoan = tentaikhoan;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getHovaten() {
        return hovaten;
    }

    public void setHovaten(String hovaten) {
        this.hovaten = hovaten;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSodienthoai() {
        return sodienthoai;
    }

    public void setSodienthoai(String sodienthoai) {
        this.sodienthoai = sodienthoai;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }
}
