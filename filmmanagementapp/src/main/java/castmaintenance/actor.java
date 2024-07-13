/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package castmaintenance;

import databasemanager.db_manager;
import java.sql.*;
import java.util.*;

/**
 *
 * @author mnari
 */
public class actor {
    public int actor_id;
    public int agency_id;
    public int agent_id;
    
    public ArrayList<Integer> actor_idlist = new ArrayList<>();
    public ArrayList<Integer> agency_idlist = new ArrayList<>();
    public ArrayList<Integer> agent_idlist = new ArrayList<>();
    
    public actor(){}
    
    public int actor_list(){
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
                PreparedStatement pstmt = conn.prepareStatement("SELECT actor_id FROM actor");
                ResultSet rst = pstmt.executeQuery();
            
                
            actor_idlist.clear();
            agency_idlist.clear();
            agent_idlist.clear();
            
            while(rst.next()){
                actor_id = rst.getInt("actor_id");
                actor_idlist.add(actor_id);
            }
            
            /*
            pstmt = conn.prepareStatement("INSERT INTO actor (actor_id, agency_id, agent_id) VALUES (?, ?, ?)");
            pstmt.setInt(1, actor_id);
            pstmt.setInt(2, agency_id);
            pstmt.setInt(3, agent_id);
            pstmt.executeUpdate();*/
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
    
    return 1;
    }
    
    public static void main (String args[]){
        actor A = new actor();
        
        A.actor_list();
        for (int i = 0; i < A.actor_idlist.size(); i++){
            System.out.println(A.actor_idlist.get(i));
        }
    }
}
