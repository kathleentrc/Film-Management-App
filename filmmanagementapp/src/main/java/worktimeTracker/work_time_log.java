
package worktimeTracker;

import databasemanager.db_manager;
import java.util.*;
import java.sql.*;

/**
 *
 * @author Shane Cloma
 */
public class work_time_log {
    
    /* fields */
    public Integer  work_log_id;
    public String   date;
    public String   start_time;
    public String   end_time;
    public Integer  employee_id;
    public Integer  total_hours;
    public Integer  overtime_hours;
    public Integer  rate_id;
    
    public Integer  rateID;
    public String   ratePosition;
    
    /* array list for the attributes */
    public ArrayList<Integer> work_log_idList    = new ArrayList<>();
    public ArrayList<String>  dateList           = new ArrayList<>();
    public ArrayList<String>  start_timeList     = new ArrayList<>();
    public ArrayList<String>  end_timeList       = new ArrayList<>();
    public ArrayList<Integer> employee_idList    = new ArrayList<>();
    public ArrayList<Integer> total_hoursList    = new ArrayList<>();
    public ArrayList<Integer> overtime_hoursList = new ArrayList<>();
    public ArrayList<Integer> rate_idList        = new ArrayList<>();
    
    public ArrayList<Integer> rateIDList         = new ArrayList<>();
    public ArrayList<String>  ratePositionList   = new ArrayList<>();
    
    public work_time_log(){}
    
    
    public int addWorkLog(){
        try {
            
            // register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            PreparedStatement pstmt;
            
            /* getting a new film project ID  */
            pstmt = conn.prepareStatement("SELECT MAX(work_log_id) + 1  AS newID FROM work_time_log");
            ResultSet rst = pstmt.executeQuery();
                
            while(rst.next()){
                work_log_id = rst.getInt("newID");
            }
            
            /* save the new film project ID */
            pstmt = conn.prepareStatement("INSERT INTO work_time_log(work_log_id, date, start_time, end_time, employee_id, total_hours, overtime_hours, rate_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            
            pstmt.setInt(1, work_log_id);
            pstmt.setString(2, date);
            pstmt.setString(3, start_time);
            pstmt.setString(4, end_time);
            pstmt.setInt(5, employee_id);
            pstmt.setInt(6, total_hours);        
            pstmt.setInt(7, (overtime_hours != null) ? overtime_hours : 0);
            pstmt.setInt(8, rate_id);

            
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);

            System.out.println("Work log added successfully.");
            return 1;

        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        } 
    
        return 0;
    }
    
    
    public int updateWorkLog() {
        try {
            
            // register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            PreparedStatement pstmt;    
                
            pstmt = conn.prepareStatement("UPDATE work_time_log SET date = ?, start_time = ?, end_time = ?, employee_id = ?, total_hours = ?, overtime_hours = ?, rate_id = ? WHERE work_log_id = ?;");
            
            pstmt.setString(1, date);
            pstmt.setString(2, start_time);
            pstmt.setString(3, end_time);
            pstmt.setInt(4, employee_id);
            pstmt.setInt(5, total_hours);        
            pstmt.setInt(6, (overtime_hours != null) ? overtime_hours : 0); 
            pstmt.setInt(7, rate_id);
            pstmt.setInt(8, work_log_id);
            
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);

            System.out.println("Work log updated successfully.");
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
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM work_time_log");
                ResultSet rst = pstmt.executeQuery();
            
                
                work_log_idList.clear();
                dateList.clear();
                start_timeList.clear();
                end_timeList.clear();
                employee_idList.clear();
                total_hoursList.clear();
                overtime_hoursList.clear();
                rate_idList.clear();

            
                while(rst.next()){
                    
                    work_log_id = rst.getInt("work_log_id");
                    work_log_idList.add(work_log_id);

                    date = rst.getString("date");
                    dateList.add(date);

                    start_time = rst.getString("start_time");
                    start_timeList.add(start_time);
                    
                    end_time = rst.getString("end_time");
                    end_timeList.add(end_time);
                    
                    employee_id = rst.getInt("employee_id");
                    employee_idList.add(employee_id);
                    
                    total_hours = rst.getInt("total_hours");
                    total_hoursList.add(total_hours);
                    
                    overtime_hours = rst.getInt("overtime_hours");
                    overtime_hoursList.add(overtime_hours);
                    
                    rate_id = rst.getInt("rate_id");
                    rate_idList.add(rate_id);

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
    
    
    public int getRateLists() {
        try {
            /* register the JDBC driver */
            Class.forName("com.mysql.cj.jdbc.Driver");

            /* open a connection */
            Connection conn = db_manager.getConnection();

            /* check if the connection is successful */
            if (conn != null) {
                System.out.println("Connected to the database!");
                
                /* perform database operations here */
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM work_time_rates");
                ResultSet rst = pstmt.executeQuery();
            
                
                rateIDList.clear();

            
                while(rst.next()){
                    
                    ratePosition = rst.getString("position");
                    ratePositionList.add(ratePosition);
                    
                    rateID = rst.getInt("rate_id");
                    rateIDList.add(rateID);

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
    
    
    public int getEmployeeLists() {
        try {
            /* register the JDBC driver */
            Class.forName("com.mysql.cj.jdbc.Driver");

            /* open a connection */
            Connection conn = db_manager.getConnection();

            /* check if the connection is successful */
            if (conn != null) {
                System.out.println("Connected to the database!");
                
                /* perform database operations here */
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM film_production_casts");
                ResultSet rst = pstmt.executeQuery();
            
                
                employee_idList.clear();

            
                while(rst.next()){
                    
                    employee_id = rst.getInt("cast_id");
                    employee_idList.add(employee_id);          

                }
                
                pstmt = conn.prepareStatement("SELECT * FROM film_production_crew");
                rst = pstmt.executeQuery();

            
                while(rst.next()){
                    
                    employee_id = rst.getInt("crew_id");
                    employee_idList.add(employee_id);          

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
    
    
    public static void main (String[] args) {
        
        work_time_log B = new work_time_log();
        
        /* test functions here */
        work_time_log log = new work_time_log();
        
//        log.date           = "2023-08-20";
//        log.start_time     = "07:58:23";
//        log.end_time       = "16:01:01";
//        log.employee_id    = 4006;
//        log.total_hours    = 8;
//        log.rate_id        = 106;
//                
//        log.addWorkLog();
        
//        log.work_log_id = 50006;
//        log.deleteWorkLog();

        log.work_log_id    = 50001;
        log.date           = "2023-08-20";
        log.start_time     = "07:58:23";
        log.end_time       = "16:01:01";
        log.employee_id    = 4006;
        log.total_hours    = 8;
        log.rate_id        = 106;
        
        log.updateWorkLog();
        
    }
    
}
