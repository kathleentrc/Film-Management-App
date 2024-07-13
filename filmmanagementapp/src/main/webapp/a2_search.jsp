<%-- 
    Document   : a2_search
    Created on : 11 21, 23, 1:54:09 AM
    Author     : ccslearner
--%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="databasemanager.db_manager" %>


<!DOCTYPE html>
<html>
<head>
    <title>View Crew Records</title>
</head>
<body>
    <h1>Search Results</h1>
    <table border="1">
        <tr>
            <th>crew_id</th>
            <th>last_name</th>
            <th>first_name</th>
            <th>position_name</th>
            <th>department_id</th>
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
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM film_production_crew AS f "
                + "INNER JOIN individual AS i ON i.individual_id = f.individual_id "
                + "INNER JOIN department AS d ON f.department_id = d.department_id "
                + "WHERE " + searchOption + "= ?;");
                
                //pstmt.setString(1, searchOption);
                pstmt.setString(1, query);
                // Execute the query to retrieve data from the table
                ResultSet rs = pstmt.executeQuery();

                // Iterate through the result set and display table rows
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("crew_id") %></td>
                        <td><%= rs.getString("last_name") %></td>
                        <td><%= rs.getString("first_name") %></td>
                        <td><%= rs.getString("position_name") %></td>
                        <td><%= rs.getString("department_id") %></td>
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
    
    <form action="a2_view.jsp">
    <button type="submit">Go Back</button>
    </form>
    
</body>
</html>
