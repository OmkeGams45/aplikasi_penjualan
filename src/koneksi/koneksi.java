package koneksi;
import java.sql.*;

public class koneksi {
    private Connection koneksi;
    public Connection connect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Berhasil Terkoneksi");
        }
        catch(ClassNotFoundException ex){
            System.out.println("Gagal Terkoneksi"+ex);
        }
        String url = "jdbc:mysql://localhost/penjualan";
        try{
            koneksi = DriverManager.getConnection(url, "root", "");
            System.out.println("Database Berhasil Terkoneksi");
        }
        catch(SQLException ex){
            System.out.println("Gagal Terkoneksi ke Database");
        }
        return koneksi;
    }
}
