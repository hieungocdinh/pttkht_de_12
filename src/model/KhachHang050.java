package model;

public class KhachHang050 extends ThanhVien050{
    private String maKH;

    // Constructors, getters, and setters
    public KhachHang050() {
    	super(); 
    }
    
    public KhachHang050(int khachhangId, String maKH, String hovaten) {
    	 this.setId(khachhangId);
    	 this.maKH = maKH;
    	 this.setHovaten(hovaten);
    }
    
    public KhachHang050(int id) {
    	this.setId(id);
    }
    
    
    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }
}
