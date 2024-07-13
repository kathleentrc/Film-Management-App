package equipmentmaintenance;

import databasemanager.db_manager;
import java.util.*;
import java.sql.*;

public class filmequipment {


    /* fields */
    public Integer equipment_id;
    public Integer film_id;
    public String  equipment_name;
    public String  equipment_type;
    public Integer qty_available;
    public String  condition_;

    /* array list for the attributes */
    public ArrayList<Integer> equipment_idList  = new ArrayList<>();
    public ArrayList<Integer> film_idList       = new ArrayList<>();
    public ArrayList<String> equipment_nameList = new ArrayList<>();
    public ArrayList<String> equipment_typeList = new ArrayList<>();
    public ArrayList<Integer> qty_availableList = new ArrayList<>();
    public ArrayList<String> condition_List     = new ArrayList<>();

    public filmequipment() {}

    public int add_record() {
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            PreparedStatement pstmt;
            
            /* getting a new equipment ID  */
            pstmt = conn.prepareStatement("SELECT MAX(equipment_id) + 1  AS newID FROM equipment");
            ResultSet rst = pstmt.executeQuery();

            while (rst.next()) {
                equipment_id = rst.getInt("newID");
            }

            /* save the new equipment ID */
            pstmt = conn.prepareStatement("INSERT INTO equipment(equipment_id, film_id, equipment_name, equipment_type, qty_available, condition_) VALUES (?, ?, ?, ?, ?, ?)");
            
            pstmt.setInt(1, equipment_id);
            pstmt.setInt(2, film_id);
            pstmt.setString(3, equipment_name);
            pstmt.setString(4, equipment_type);
            pstmt.setInt(5, qty_available);
            pstmt.setString(6, condition_);
            
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);

            System.out.println("Equipment added successfully.");
            return 1;

        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        }

        return 0;
    }
    
    
    public int delete_record() {
        try {
            
            // register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            PreparedStatement pstmt;

            pstmt = conn.prepareStatement("DELETE FROM equipment WHERE equipment_id = ?;");
            pstmt.setInt(1, equipment_id);
            
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);

            System.out.println("Equipment deleted successfully.");
            return 1;

        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        } 
    
        return 0;
    }
    
    
    public int update_record() {
        try {
            
            // register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            PreparedStatement pstmt;    
                
            pstmt = conn.prepareStatement("UPDATE equipment SET film_id = ?, equipment_name = ?, equipment_type = ?, qty_available = ?, condition_ = ?  WHERE equipment_id = ?;");
            
            pstmt.setInt(1, film_id);
            pstmt.setString(2, equipment_name);
            pstmt.setString(3, equipment_type);
            pstmt.setInt(4, qty_available);
            pstmt.setString(5, condition_);
            pstmt.setInt(6, equipment_id);
            
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);

            System.out.println("Equipment updated successfully.");
            return 1;

        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        } 
    
        return 0;
    }
    
    
    public int getLists() {
        try {
            /* register the JDBC driver */
            Class.forName("com.mysql.cj.jdbc.Driver");

            /* open a connection */
            Connection conn = db_manager.getConnection();

            /* check if the connection is successful */
            if (conn != null) {
                System.out.println("Connected to the database!");
                
                /* perform database operations here */
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM equipment");
                ResultSet rst = pstmt.executeQuery();
            
                
                equipment_idList.clear();
                film_idList.clear();
                equipment_nameList.clear();
                equipment_typeList.clear();
                qty_availableList.clear();
                condition_List.clear();

            
            
                while(rst.next()){
                    
                    equipment_id = rst.getInt("equipment_id");
                    equipment_idList.add(equipment_id);

                    film_id = rst.getInt("film_id");
                    film_idList.add(film_id);

                    equipment_name = rst.getString("equipment_name");
                    equipment_nameList.add(equipment_name);
                    
                    equipment_type = rst.getString("equipment_type");
                    equipment_typeList.add(equipment_type);
                    
                    qty_available = rst.getInt("qty_available");
                    qty_availableList.add(qty_available);
                    
                    condition_ = rst.getString("condition_");
                    condition_List.add(condition_);
                    
                }
            
                pstmt.close();
                db_manager.closeConnection(conn);

                System.out.println("Retrieval Success!");   

                return 1;
            
            } else {
                System.out.println("Failed to make connection!");
            }                                                                                                                                   
        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        } 
    
        return 1;  
        
    }
    

    /* main method */
    public static void main(String[] args) {

        filmequipment A = new filmequipment();
        
        filmequipment B = new filmequipment();
        
        
//        B.equipment_id = 1001;
//        B.film_id = 2002;
//        B.equipment_name = "TEST";
//        B.equipment_type = "Props";
//        B.qty_available = 10;
//        B.condition_ = "Fair";
//        B.update_record();

          B.getLists();
          for (int i = 0; i < B.equipment_idList.size(); i++){
            System.out.println(B.equipment_idList.get(i));
            System.out.println(B.film_idList.get(i));
            System.out.println(B.equipment_nameList.get(i));
            System.out.println(B.equipment_typeList.get(i));
            System.out.println(B.qty_availableList.get(i));
            System.out.println(B.condition_List.get(i));
            System.out.println("===============================");
        }

        
    }
}
