<%-- 
    Document   : a3_search
    Created on : 19 Nov 2023, 7:00:25 pm
    Author     : mnari
--%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="databasemanager.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Records</title>
</head>
<body>
    <h1>Search Results</h1>
    <table border="1">
        <tr>
            <th>cast_id</th>
            <th>actor_id</th>
            <th>last_name</th>
            <th>first_name</th>
            <th>film_id</th>
            <th>title</th>
            <th>role_name</th>
            <th>role_type</th>
        </tr>
        <% Connection conn = null;
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
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM film_production_casts "
                + "INNER JOIN actor ON film_production_casts.actor_id = actor.actor_id "
                + "INNER JOIN individual ON actor.actor_id = individual.individual_id "
                + "INNER JOIN film_project ON film_production_casts.film_id = film_project.film_project_id "
                + "WHERE film_production_casts." + searchOption + "= ? "
                + "ORDER BY film_production_casts.cast_id ASC;");
                
                //pstmt.setString(1, searchOption);
                pstmt.setString(1, query);
                // Execute the query to retrieve data from the table
                ResultSet rs = pstmt.executeQuery();

                // Iterate through the result set and display table rows
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("cast_id") %></td>
                        <td><%= rs.getInt("actor_id") %></td>
                        <td><%= rs.getString("last_name") %></td>
                        <td><%= rs.getString("first_name") %></td>
                        <td><%= rs.getInt("film_id") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("role_name") %></td>
                        <td><%= rs.getString("role_type") %></td>
                    </tr>
        <%
                }

                // Close the resources
                rs.close();
                pstmt.close();
                db_manager.closeConnection(conn);
            } 
        } catch (SQLException e) {
            out.println("Exception: " + e.getMessage());
        }
        %>
    </table><br>
    </form>
    
    <form action="a3_view.jsp">
    <button type="submit">Go Back</button>
    </form>
    
</body>
</html>
