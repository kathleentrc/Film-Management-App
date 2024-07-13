/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crewmaintenance;

import java.util.*;

import databasemanager.db_manager;

import java.sql.*;

/**
 *
 * @author Kathleen Therese R. Cruz
 */
public class film_production_crew {
    public film_production_crew() {}

    // fields of film_production_crew
    public int crew_id;
    public int film_id;
    public int department_id;
    public String position_name;
    public String skills;
    public String start_date;
    public String end_date;
    public int individual_id;

    public ArrayList<Integer> crew_idList = new ArrayList<>();
    public ArrayList<Integer> film_idList = new ArrayList<>();
    public ArrayList<Integer> department_idList = new ArrayList<>();
    public ArrayList<String> position_nameList = new ArrayList<>();
    public ArrayList<String> skillsList = new ArrayList<>();
    public ArrayList<String> start_dateList = new ArrayList<>();
    public ArrayList<String> end_dateList = new ArrayList<>();
    public ArrayList<Integer> individual_idList = new ArrayList<>();

    public int registerCrew() {
        Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to database
            conn = db_manager.getConnection();

            // Prepare sql statement
            PreparedStatement s = conn.prepareStatement("SELECT MAX(crew_id)+1 AS newID FROM film_production_crew");
            ResultSet r = s.executeQuery();

            while(r.next()) {
                crew_id = r.getInt("newID");
            }

            s = conn.prepareStatement("INSERT INTO film_production_crew VALUE(?, ?, ?, ?, ?, ?, ?, ?)");
            s.setInt(1, crew_id);
            s.setInt(2, film_id);
            s.setInt(3, department_id);
            s.setString(4, position_name);
            s.setString(5, skills);
            s.setString(6, start_date);
            s.setString(7, end_date);
            s.setInt(8, individual_id);

            s.executeUpdate();

            // Close
            s.close();
            conn.close();

            System.out.println("Successful Run");
            return 1;
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            return 0;
        }
    }
    public int updateCrew() {
        Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to database
            conn = db_manager.getConnection();

            // Prepare sql statement
            PreparedStatement s = conn.prepareStatement("UPDATE film_production_crew SET film_id=?, department_id=?, position_name=?, skills=?, start_date=?, end_date=?, individual_id=? WHERE crew_id = ?");
            s.setInt(1, film_id);
            s.setInt(2, department_id);
            s.setString(3, position_name);
            s.setString(4, skills);
            s.setString(5, start_date);
            s.setString(6, end_date);
            s.setInt(7, individual_id);
            s.setInt(8, crew_id);
            s.executeUpdate();

            s.close();
            conn.close();

            System.out.println("Successful Run");
            return 1;
        } catch(Exception e){
            System.out.println("Error: " + e.getMessage());
            return 0;
        }   
    }

    public int deleteCrew() {
        Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to database
            conn = db_manager.getConnection();

            // Prepare sql statement
            PreparedStatement s = conn.prepareStatement("DELETE FROM film_production_crew WHERE crew_id = ?");
            s.setInt(1, crew_id);
            s.executeUpdate();

            s.close();
            conn.close();

            System.out.println("Successful Run");
            return 1;
        } catch(Exception e){
            System.out.println("Error: " + e.getMessage());
            return 0;
        }   
    }
    
    public int getLists(){
        Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
                
            // Connect to database
            conn = db_manager.getConnection();

            // Prepare sql statement
            PreparedStatement s = conn.prepareStatement("SELECT * FROM film_production_crew");
            ResultSet r = s.executeQuery();
                 
            crew_idList.clear();
            film_idList.clear();
            department_idList.clear();
            position_nameList.clear();
            skillsList.clear();
            start_dateList.clear();
            end_dateList.clear();
            individual_idList.clear();
                
            while(r.next()){
                crew_id = r.getInt("crew_id");
                crew_idList.add(crew_id);
                    
                film_id = r.getInt("film_id");
                film_idList.add(film_id);

                department_id = r.getInt("department_id");
                department_idList.add(department_id);
                    
                position_name = r.getString("position_name");
                position_nameList.add(position_name);
                    
                skills = r.getString("skills");
                skillsList.add(skills);
                    
                start_date = r.getString("start_date");
                start_dateList.add(start_date);
                    
                end_date = r.getString("end_date");
                end_dateList.add(end_date);

                individual_id = r.getInt("individual_id");
                individual_idList.add(individual_id);
                    
            }
            
            // Close
            s.close();
            conn.close();
                
            System.out.println("Successful Run");
            return 1;
        } catch(Exception e){
            System.out.println("Error: " + e.getMessage());
            return 0;
        }   
        
    }

    public static void main(String args[]) {
        film_production_crew C = new film_production_crew();
        /* 
        C.film_id = 2001;
        C.department_id = 8000;
        C.position_name = "Director";
        C.skills = "Cinematography";
        C.start_date = "2023-01-01";
        C.end_date = null;
        C.individual_id = 1010;
        C.hourly_pay = 1750; 
        C.registerCrew();*/
        
        //C.crew_id = 4011;
        //C.deleteCrew();
        C.crew_id = 4001;
        C.film_id = 2001;
        C.department_id = 8000;
        C.position_name = "Director";
        C.skills = "Cinematography";
        C.start_date = "2023-01-01";
        C.end_date = null;
        C.individual_id = 1010;
        C.updateCrew();
        
        System.out.println("Successful Main");
    }
}