package castmaintenance;
import databasemanager.db_manager;
import java.util.*;
import java.sql.*;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Marian Ricci N. Ariaga
 */
public class film_production_casts {
    public int cast_id;
    public int actor_id;
    public int film_id;
    public String role_name;
    public String role_type;
    
    public ArrayList<Integer> cast_idlist = new ArrayList<>();
    public ArrayList<Integer> actor_idlist = new ArrayList<>();
    public ArrayList<Integer> film_idlist = new ArrayList<>();
    public ArrayList<String> role_namelist = new ArrayList<>();
    public ArrayList<String> role_typelist = new ArrayList<>();
    
    public film_production_casts(){}
    
    public int getLists(){
        Connection conn = null;
    try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = db_manager.getConnection();

            // Check if the connection is successful
            if (conn != null) {
                System.out.println("Connected to the database!");
                
                // Perform database operations here
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM film_production_casts");
                ResultSet rst = pstmt.executeQuery();
            
                
            cast_idlist.clear();
            actor_idlist.clear();
            film_idlist.clear();
            role_namelist.clear();
            role_typelist.clear();
            
            while(rst.next()){
                cast_id = rst.getInt("cast_id");
                cast_idlist.add(cast_id);
                
                actor_id = rst.getInt("actor_id");
                actor_idlist.add(actor_id);
                
                film_id = rst.getInt("film_id");
                film_idlist.add(film_id);
                
                role_name = rst.getString("role_name");
                role_namelist.add(role_name);
                
                role_type = rst.getString("role_type");
                role_typelist.add(role_type);
              
            }
            
            pstmt.close();
            db_manager.closeConnection(conn);
            
            System.out.println("Success!");   
                
            return 1;
            
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        } 
    
    return 0;
    }
    
    public int add_record(){
        Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = db_manager.getConnection();

            // Check if the connection is successful
            if (conn != null) {
                System.out.println("Connected to the database!");
                
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(cast_id) + 1  AS newCastID FROM film_production_casts");
            ResultSet rst = pstmt.executeQuery();    
                
            while(rst.next()){
                cast_id = rst.getInt("newCastID");
            }
            
            
            pstmt = conn.prepareStatement("INSERT INTO film_production_casts (cast_id, actor_id, film_id, role_name, role_type, hourly_pay) VALUES (?, ?, ?, ?, ?)");
            pstmt.setInt(1, cast_id);
            pstmt.setInt(2, actor_id);
            pstmt.setInt(3, film_id);
            pstmt.setString(4, role_name);
            pstmt.setString(5, role_type);
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);
            
                
            return 1;
            
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        }
    
        return 0;
    }
    
    public int delete_record(){
    Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = db_manager.getConnection();

            // Check if the connection is successful
            if (conn != null) {
                System.out.println("Connected to the database!");
                
                
            PreparedStatement pstmt;
                       
            
            pstmt = conn.prepareStatement("DELETE FROM film_production_casts WHERE cast_id = ?;");
            pstmt.setInt(1, cast_id);
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);
            
                
            return 1;
            
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        }
    
        return 0;
    }
    
    public int update_record(){
    Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = db_manager.getConnection();

            // Check if the connection is successful
            if (conn != null) {
                System.out.println("Connected to the database!");
                
                
            PreparedStatement pstmt;
                       
            
            pstmt = conn.prepareStatement("UPDATE film_production_casts SET film_id = ?, role_name = ?, role_type = ? WHERE cast_id = ?;");
            pstmt.setInt(1, film_id);
            pstmt.setString(2, role_name);
            pstmt.setString(3, role_type);
            pstmt.setInt(4, cast_id);
            pstmt.executeUpdate();
            pstmt.close();
            //conn.close();
            db_manager.closeConnection(conn);
                
            return 1;
            
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        } 
    
        return 0;
    }
    
    public static void main (String args[]){
        film_production_casts cast = new film_production_casts();
        cast.actor_id = 1013;
        cast.film_id = 2001;
        cast.role_name = "Lucy Gray Baird";
        cast.role_type = "Lead";
        
        cast.add_record();
        
        cast.cast_id = 7002;
        cast.delete_record();
        
        cast.cast_id = 7006;
        cast.film_id = 2004;
        cast.role_name = "Katniss Everdeen";
        cast.role_type = "Lead";
        cast.update_record();
        
        //.getLists();
        for (int i = 0; i < cast.cast_idlist.size(); i++){
            System.out.println(cast.cast_idlist.get(i));
            System.out.println(cast.film_idlist.get(i));
            System.out.println(cast.role_namelist.get(i));
            System.out.println(cast.role_typelist.get(i));
            System.out.println("===============================");
        }
    }
    
}
