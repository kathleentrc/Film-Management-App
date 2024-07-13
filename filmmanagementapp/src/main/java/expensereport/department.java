/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package expensereport;

import databasemanager.db_manager;
import java.util.*;
import java.sql.*;

/**
 *
 * @author mnari
 */
public class department {
    public int department_id;
    public String department_name;
    public int department_head_id;
    public String email;
    public int contact_no;
    
    public ArrayList<Integer> department_idlist = new ArrayList<>();
    public ArrayList<String> department_namelist = new ArrayList<>();
    public ArrayList<Integer> department_head_idlist = new ArrayList<>();
    public ArrayList<String> email_list = new ArrayList<>();
    public ArrayList<Integer> contact_nolist = new ArrayList<>();
    
    
    public department(){}
    
    
 public int department_list(){
    Connection conn = null;
     try {          
           Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = db_manager.getConnection();


            // Check if the connection is successful
            if (conn != null) {
                System.out.println("Connected to the database!");
                
                // Perform database operations here
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM department");
                ResultSet rst = pstmt.executeQuery();
            
                
            department_idlist.clear();
            department_namelist.clear();
            department_head_idlist.clear();
            email_list.clear();
            contact_nolist.clear();
            
            while(rst.next()){
                department_id = rst.getInt("department_id");
                department_idlist.add(department_id);
                
                department_name = rst.getString("department_name");
                department_namelist.add(department_name);
            }
            
       
            pstmt.close();
            db_manager.closeConnection(conn);
            System.out.println("Success!");    
         
            
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        }
    
    return 1;
    }
    
    public static void main (String args[]){
        department D = new department();
        
        D.department_list();
        for (int i = 0; i < D.department_idlist.size(); i++){
            System.out.println(D.department_idlist.get(i));
        }
        
        D.department_list();
        for (int i = 0; i < D.department_namelist.size(); i++){
            System.out.println(D.department_namelist.get(i));
        }
        
        System.out.println(D.department_namelist.size());
        System.out.println(D.department_idlist.size());
    }
}
