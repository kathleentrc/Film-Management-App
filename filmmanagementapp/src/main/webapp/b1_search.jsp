<%-- 
    Document   : b1_search
    Created on : 11 21, 23, 1:54:09 AM
    Author     : Kathleen Therese R. Cruz
--%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="databasemanager.db_manager" %>

<!DOCTYPE html>
<html>
<head>
    <title>List of Expenses</title>
</head>
<body>
    <h1>Search Results</h1>
    <table border="1">
        <tr>
            <th>expense_id</th>
            <th>film_id</th>
            <th>department_id</th>
            <th>description</th>
            <th>production_type</th>
            <th>date</th>
            <th>total_cost</th>
        </tr>
        <% 
        Connection conn = null;
        try {
            
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = db_manager.getConnection();
            
            // Check if the connection is successful
            if (conn != null) {
                
            String searchOption = request.getParameter("column");
            String query = request.getParameter("query");
            
                // Create a statement
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM expense AS e "
                + "INNER JOIN receipt AS r ON r.or_no = e.or_no "
                + "WHERE " + searchOption + " = ?;");

              
                pstmt.setString(1, query);
                ResultSet rs = pstmt.executeQuery();

                // Iterate through the result set and display table rows
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("expense_id") %></td>
                        <td><%= rs.getInt("film_id") %></td>
                        <td><%= rs.getInt("department_id") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td><%= rs.getString("production_type") %></td>
                        <td><%= rs.getString("date") %></td>
                        <td><%= rs.getDouble("total_cost") %></td>
                    </tr>
        <%
                }

                // Close the resources
                rs.close();
                pstmt.close();
                conn.close();
            } 
        } catch (SQLException e) {
            out.println("Exception: " + e.getMessage());
        }
        %>
    </table><br>
    </form>
    
    <form action="b1_view.jsp">
    <button type="submit">Go Back</button>
    </form>
    
</body>
</html>
