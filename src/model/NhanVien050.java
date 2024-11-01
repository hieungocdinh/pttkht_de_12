package model;

public class NhanVien050 extends ThanhVien050 {
    private String maNV;
    private String vitri;

    // Constructors, getters, and setters
    public NhanVien050() {
    	super(); 
    }

    public NhanVien050(String maNV, String vitri) {
        super(); 
        this.maNV = maNV;
        this.vitri = vitri;
    }

    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getVitri() {
        return vitri;
    }

    public void setVitri(String vitri) {
        this.vitri = vitri;
    }
}
