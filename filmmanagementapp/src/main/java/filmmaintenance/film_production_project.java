
package filmmaintenance;
import  databasemanager.*;

/**
 *
 * @author Shania Francine T. Cloma
 */
import java.util.*;
import java.sql.*;

public class film_production_project {
    
    /* fields */
    public Integer      film_project_id;
    public String       title;
    public String       short_summary;
    public String       release_date;
    public String       production_company;
    public String       original_language;
    public String       age_ratings;
    public String       status;
    public Double       budget;
    public Double       box_office_revenue;
    public Integer      director_id;
    public Integer      producer_id;
    
    public Integer employee_id;
    public ArrayList<Integer> employee_idList = new ArrayList<>();
    
    /* array list for the attributes */
    public ArrayList<Integer> film_project_idList   = new ArrayList<>();
    public ArrayList<String>  titleList              = new ArrayList<>();
    public ArrayList<String>  short_summaryList      = new ArrayList<>();
    public ArrayList<String>  release_dateList       = new ArrayList<>();
    public ArrayList<String>  production_companyList = new ArrayList<>();
    public ArrayList<String>  original_languageList  = new ArrayList<>();
    public ArrayList<String>  age_ratingsList        = new ArrayList<>();
    public ArrayList<String>  statusList             = new ArrayList<>();
    public ArrayList<Double>  budgetList             = new ArrayList<>();
    public ArrayList<Double>  box_office_revenueList = new ArrayList<>();
    public ArrayList<Integer> director_idList        = new ArrayList<>();
    public ArrayList<Integer> producer_idList        = new ArrayList<>();
   
    public film_production_project(){}
    
    public int addFilmProject(){
        try {
            
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            PreparedStatement pstmt;
            
            /* getting a new film project ID  */
            pstmt = conn.prepareStatement("SELECT MAX(film_project_id) + 1  AS newFilmID FROM film_project");
            ResultSet rst = pstmt.executeQuery();
                
            while(rst.next()){
                film_project_id = rst.getInt("newFilmID");
            }
            
            /* save the new film project ID */
            pstmt = conn.prepareStatement("INSERT INTO film_project(film_project_id, title, short_summary, release_date, production_company, original_language, age_ratings, status, budget, box_office_revenue, director_id, producer_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            
            pstmt.setInt(1, film_project_id);
            pstmt.setString(2, title);
            pstmt.setString(3, short_summary);
            pstmt.setString(4, release_date);
            pstmt.setString(5, production_company);
            pstmt.setString(6, original_language);
            pstmt.setString(7, age_ratings);        
            pstmt.setString(8, status); 
            pstmt.setDouble(9, budget);
            pstmt.setDouble(10, (box_office_revenue != null) ? box_office_revenue : 0);
            pstmt.setInt(11, director_id);
            pstmt.setInt(12, producer_id);
            
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);

            System.out.println("Film project added successfully.");
            return 1;

        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        } 
    
        return 0;
    }
    
    
    public int deleteFilmProject() {
        try {
            
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            PreparedStatement pstmt;

            pstmt = conn.prepareStatement("DELETE FROM film_project WHERE film_project_id = ?;");
            pstmt.setInt(1, film_project_id);
            
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);

            System.out.println("Film project deleted successfully.");
            return 1;

        } catch (Exception e) {
            System.out.println("Could not find the JDBC driver: " + e.getMessage());
        } 
    
        return 0;
    }
    
    
    public int updateFilmProject() {
        try {
            
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            PreparedStatement pstmt;    
                
            pstmt = conn.prepareStatement("UPDATE film_project SET title = ?, short_summary = ?, release_date = ?, production_company = ?, original_language = ?, age_ratings = ?, status = ?, budget = ?, box_office_revenue = ?, director_id = ?, producer_id = ? WHERE film_project_id = ?;");
            pstmt.setString(1, title);
            pstmt.setString(2, short_summary);
            pstmt.setString(3, release_date);
            pstmt.setString(4, production_company);
            pstmt.setString(5, original_language);
            pstmt.setString(6, age_ratings);        
            pstmt.setString(7, status); 
            pstmt.setDouble(8, budget);
            pstmt.setDouble(9, (box_office_revenue != null) ? box_office_revenue : 0);
            pstmt.setInt(10, director_id);
            pstmt.setInt(11, producer_id);
            pstmt.setInt(12, film_project_id);
            
            pstmt.executeUpdate();
            pstmt.close();
            db_manager.closeConnection(conn);

            System.out.println("Film project updated successfully.");
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
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM film_project");
                ResultSet rst = pstmt.executeQuery();
            
                
                film_project_idList.clear();
                titleList.clear();
                short_summaryList.clear();
                release_dateList.clear();
                production_companyList.clear();
                original_languageList.clear();
                age_ratingsList.clear();
                statusList.clear();
                budgetList.clear();
                box_office_revenueList.clear();
                director_idList.clear();
                producer_idList.clear();
            
            
                while(rst.next()){
                    
                    film_project_id = rst.getInt("film_project_id");
                    film_project_idList.add(film_project_id);

                    title = rst.getString("title");
                    titleList.add(title);

                    short_summary = rst.getString("short_summary");
                    short_summaryList.add(short_summary);
                    
                    release_date = rst.getString("release_date");
                    release_dateList.add(release_date);
                    
                    production_company = rst.getString("production_company");
                    production_companyList.add(production_company);
                    
                    original_language = rst.getString("original_language");
                    original_languageList.add(original_language);
                    
                    age_ratings = rst.getString("age_ratings");
                    age_ratingsList.add(age_ratings);
                    
                    status = rst.getString("status");
                    statusList.add(status);
                    
                    budget = rst.getDouble("budget");
                    budgetList.add(budget);
                    
                    box_office_revenue = rst.getDouble("box_office_revenue");
                    box_office_revenueList.add(box_office_revenue);
                    
                    director_id = rst.getInt("director_id");
                    director_idList.add(director_id);
                    
                    producer_id = rst.getInt("producer_id");
                    producer_idList.add(producer_id);

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
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM film_production_crew");
                ResultSet rst = pstmt.executeQuery();
            
                
                employee_idList.clear();

            
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
    
    
    /* main method */
    public static void main (String[] args) {
        
        film_production_project A = new film_production_project();

        /* test case 1 for checking purposes */
        film_production_project project = new film_production_project();
        
        project.film_project_id = 9999;
        project.title = "Harry Potter";
        project.short_summary = "The boy who lived.";
        project.release_date = "2001-11-21";
        project.production_company = "Warner Bros";
        project.original_language = "English";
        project.age_ratings = "Rated PG";
        project.status = "Completed";
        project.budget = 250000000.0;
        project.director_id = 4001;
        project.producer_id = 4002;
        
        project.addFilmProject();
        
//        project.film_project_id = 2006;
//        project.deleteFilmProject();

//        project.film_project_id = 2001;
//        project.title = "Harry Potter";
//        project.short_summary = "The boy who lived.";
//        project.release_date = "2001-11-21";
//        project.production_company = "Warner Bros";
//        project.original_language = "English";
//        project.age_ratings = "Rated PG";
//        project.status = "Completed";
//        project.budget = 250000000.0;
//        project.box_office_revenue = 975000000.0;
//        project.director_id = 4001;
//        project.producer_id = 4002;
//        
//        project.updateFilmProject();
//        
//        
//        project.getLists();
//        for (int i = 0; i < project.film_project_idList.size(); i++){
//            System.out.println(project.film_project_idList.get(i));
//            System.out.println(project.titleList.get(i));
//            System.out.println(project.production_companyList.get(i));
//            System.out.println(project.original_languageList.get(i));
//            System.out.println(project.statusList.get(i));
//            System.out.println(project.age_ratingsList.get(i));
//            System.out.println("===============================");
//        }
  
        
    }
}
