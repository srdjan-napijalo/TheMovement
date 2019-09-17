
package model;




import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;





public class Usluge {

    
    private static Connection konekcija;
    private static Statement st;
    private static ResultSet rs;


    public static int vratiPokret(String mail){
        int pokret=0;
        try{
        konekcija = Konekcija.poveziSe();
        st = konekcija.createStatement();
        String upit = "select pokret from proba2 where mail= '"+mail+"'";
        rs = st.executeQuery(upit);
        while(rs.next())
            pokret = rs.getInt("pokret");
           
            
        }catch(SQLException ex){  System.out.println("Nije pronadjen navedeni mail");}
       return  pokret;
    }
    public static String vratiPw(String mail){
        String pw="";
        try{
        konekcija = Konekcija.poveziSe();
        st = konekcija.createStatement();
        String upit = "select password from proba2 where mail= '"+mail+"'";
        rs = st.executeQuery(upit);
        while(rs.next())
            pw = rs.getString("password");
           
            
        }catch(SQLException ex){pw = "Nije pronadjen navedeni mail";}
       return  pw;
    }
    
   public static boolean slobodanMail(String mail){
       boolean isFree=false; 
        try{
        konekcija = Konekcija.poveziSe();
        st = konekcija.createStatement();
        String upit = "select password from proba2 where mail= '"+mail+"'";
        rs = st.executeQuery(upit);
        isFree = !rs.next();
           
            
        }catch(SQLException ex){System.out.println(ex.getMessage());}
       return  isFree;
    }
    
    //table = ime tabele, index= indeks kolone- POCINJE OD 1, isInt = da li je tip podatka int?    
    public static ArrayList getGeneric(String table, int index, boolean isInt){
        ArrayList genList = new ArrayList();
        try{
        konekcija = Konekcija.poveziSe();
        st = konekcija.createStatement();
        String upit = "select * from "+table+"";
        rs = st.executeQuery(upit);
        while(rs.next())
            if(isInt)
            genList.add(rs.getInt(index));
            else genList.add(rs.getString(index));
            
        }catch(SQLException ex){System.out.println(ex.getMessage());}
        
        return genList;
    }
    
    
    public static String getLink(String mail){
        String pokret="";
        try{
        konekcija = Konekcija.poveziSe();
        st = konekcija.createStatement();
        String upit = ("select link from pokret,proba2 where mail ='"+mail+"'"); 
        rs = st.executeQuery(upit);
        if(rs.next())pokret = rs.getString("link");

            
        }catch(SQLException ex){System.out.println(ex.getMessage());}
        
        return pokret;
        
    }
    
    public static void promeniPokret(int noviPokretId, String mail){
        try{
        konekcija = Konekcija.poveziSe();
        st = konekcija.createStatement();
        String upit = "update proba2 set pokret ="+noviPokretId+" where mail ='"+mail+"'";
        st.execute(upit);
        }catch(SQLException ex){System.out.println(ex.getMessage());}
    }
    
    
    public static void unesiProbno(String str){
         try{
        konekcija = Konekcija.poveziSe();
        st = konekcija.createStatement();
        String upit = "insert into proba2 values("+str+")";
        st.execute(upit);
        }catch(SQLException ex){System.out.println(ex.getMessage());}
    }
}