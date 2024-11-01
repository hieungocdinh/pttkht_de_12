package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO050 {
    private static final String URL = "jdbc:mysql://localhost:3306/pttkht_de12";
    private static final String USER = "root"; // Thay "root" bằng username của bạn
    private static final String PASSWORD = ""; // Thay "" bằng password của bạn

    private Connection connection;

    public DAO050() {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection
            this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Kết nối cơ sở dữ liệu thành công!");
        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy driver JDBC: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Đóng kết nối cơ sở dữ liệu thành công!");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi đóng kết nối cơ sở dữ liệu: " + e.getMessage());
        }
    }
}
