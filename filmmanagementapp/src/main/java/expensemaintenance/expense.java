package expensemaintenance;
import java.util.*;
import java.sql.*;
import databasemanager.db_manager;


public class expense {
    public expense() {}
    
    public enum Production_type {
        Pre_Production,
        Production,
        Post_Production
    }

    public int expense_id;
    public int film_id;
    public int department_id;
    public String description;
    public String production_type;
    public int or_no;
    public String date;
    public double total_cost;

    public ArrayList<Integer> expense_idList = new ArrayList<>();
    public ArrayList<Integer> film_idList = new ArrayList<>();
    public ArrayList<Integer> department_idList = new ArrayList<>();
    public ArrayList<String> descriptionList = new ArrayList<>();
    public ArrayList<String> production_typeList= new ArrayList<>();
    public ArrayList<Integer> or_noList = new ArrayList<>();
    public ArrayList<String> dateList= new ArrayList<>();
    public ArrayList<Double> total_costList = new ArrayList<>();

    public int addExpense() {
        Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to database
            conn = db_manager.getConnection();

            // Prepare sql statement
            PreparedStatement s2 = conn.prepareStatement("SELECT MAX(or_no)+1 AS maxOR FROM receipt");
            ResultSet r2 = s2.executeQuery();
            //int orTemp;
            
            while(r2.next()) {
                or_no = r2.getInt("maxOR");
                System.out.println("TEST" + or_no);
            }

            s2 = conn.prepareStatement("INSERT INTO receipt VALUE(?,?,?)");
            s2.setInt(1, or_no);
            s2.setString(2, date);
            s2.setDouble(3, total_cost);
            s2.executeUpdate();
            
            PreparedStatement s = conn.prepareStatement("SELECT MAX(expense_id)+1 AS newID FROM expense");
            ResultSet r = s.executeQuery();

            while(r.next()) {
                expense_id = r.getInt("newID");
            } 

            s = conn.prepareStatement("INSERT INTO expense VALUE(?,?,?,?,?,?)");
            s.setInt(1, expense_id);
            s.setInt(2, film_id);
            s.setInt(3, department_id);
            s.setString(4, description);
            s.setString(5, production_type);
            s.setInt(6, or_no);
            s.executeUpdate();

            s.close();
            s2.close();
            conn.close();

            System.out.println("Expense added succesfully.");
            return 1;
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            return 0;
        }
    }

    public int updateExpense() {
        Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to database
            conn = db_manager.getConnection();

            // Prepare sql statement
            PreparedStatement s = conn.prepareStatement("UPDATE expense SET film_id=?, department_id=?, description=?, production_type=?, or_no=? WHERE expense_id=?;");
            s.setInt(1, film_id);
            s.setInt(2, department_id);
            s.setString(3, description);
            s.setString(4, production_type);
            s.setInt(5, or_no);
            s.setInt(6, expense_id);

            PreparedStatement s2 = conn.prepareStatement("UPDATE receipt SET date=?, total_cost=? WHERE or_no=?;");
            s2.setString(1, date);
            s2.setDouble(2, total_cost);
            s2.setInt(3, or_no);

            s.executeUpdate();
            s2.executeUpdate();
            s.close();
            s2.close();
            conn.close();
            System.out.println("Expense updated succesfully");
            return 1;
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            return 0;
        }
    }

    public int getLists() {
        Connection conn = null;
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to database
            conn = db_manager.getConnection();
            
            if(conn != null) {
                System.out.println("Connection Successful");

                PreparedStatement s = conn.prepareStatement("SELECT * FROM expense");
                ResultSet r = s.executeQuery();

                PreparedStatement s2 = conn.prepareStatement("SELECT * FROM receipt");
                ResultSet r2 = s2.executeQuery();

                expense_idList.clear();
                film_idList.clear();
                department_idList.clear();
                descriptionList.clear();
                production_typeList.clear();
                or_noList.clear();
                dateList.clear();
                total_costList.clear();

                while(r.next()) {
                    expense_id = r.getInt("expense_id");
                    expense_idList.add(expense_id);

                    film_id = r.getInt("film_id");
                    film_idList.add(film_id);

                    department_id = r.getInt("department_id");
                    department_idList.add(department_id);

                    description = r.getString("description");
                    descriptionList.add(description);

                    production_type = r.getString("production_type");
                    production_typeList.add(production_type);

                    or_no = r.getInt("or_no");
                    or_noList.add(or_no);
                    
                }

                while(r2.next()) {
                    date = r2.getString("date");
                    dateList.add(date);

                    total_cost = r2.getDouble("total_cost");
                    total_costList.add(total_cost);
                }

                s.close();
                s2.close();
                conn.close();

                System.out.println("getList() Successful");
                
            } else {
                System.out.println("Connection failed!");
            }

            return 1;
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            return 0;
        }
    }

    public static void main(String[] args) {
        expense E = new expense();
        /*
        E.film_id = 2001;
        E.department_id = 8001;
        E.description = "Camera Lighting";
        E.production_type = "Production";
        E.date = "2022-12-12";
        E.total_cost = 5500;
        int test = E.addExpense();
        System.out.println("Successful Add: " + test);*/
        E.film_id = 2001;
        E.department_id = 8001;
        E.expense_id = 11000;
        E.production_type = "Pre-Production";
        E.description = "Camera Lighting";
        E.date = "2022-12-12";
        E.total_cost = 5500;
        E.or_no = 10000;
        int test2 = E.updateExpense();
        System.out.println("Successful Update" + test2);
        /*
        
        E.film_id = 2002;
        E.department_id = 8000;
        E.description = "Test Pay";
        E.production_type = "Production";
        E.or_no = 10019;
        E.addExpense();
        System.out.println("Successful Add");

        E.expense_id = 11020;
        E.film_id = 2001;
        E.department_id = 8000;
        E.description = "Crew Pay";
        E.production_type = "Production";
        E.or_no = 10019;
        E.deleteExpense();
        System.out.println("Successful Delete");

        E.production_type = "Post-Production";
        E.updateExpense();
        System.out.println("Successful Update");
*/
    }
}