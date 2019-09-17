package model;
import java.sql.*;
public class Konekcija {
    private Konekcija(){}
    private static Connection conn=null;
    public static Connection poveziSe()
    {
       if(conn==null) 
           try {
               Class.forName("com.mysql.jdbc.Driver");
                       } catch (ClassNotFoundException ex) {
               System.out.println(ex.getMessage());
       }
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movement?useSSL=false","root","srdjanhaker123");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
       return conn; 
    }
    
}
