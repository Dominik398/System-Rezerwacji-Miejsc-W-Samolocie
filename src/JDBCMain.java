import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCMain {
    private String url = "jdbc:mysql://localhost:3306/flightsdatabase";
    private String user = "root";
    private String password = "";

    public Connection connectToDB(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
        } catch (Exception e){
            System.out.println("Error: " + e);
        }
        return connection;
    }
    public void closeConnectionToDB(Connection connection){
        try{
            connection.close();
        } catch (Exception e){
            System.out.println("Error: " + e);
        }
    }
    public void testConnection() throws Exception{
        Connection connection = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
    }
}
