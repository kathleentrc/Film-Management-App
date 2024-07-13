<%-- 
    Document   : a3_search_and_filter
    Created on : 19 Nov 2023, 6:06:11 pm
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
    <script>
        function showSearchBar() {
            var selectBox = document.getElementById("searchOption");
            var selectedValue = selectBox.options[selectBox.selectedIndex].value;
            
            var searchBar = document.getElementById("searchBar");
            if (selectedValue === "searchOption") {
                searchBar.style.display = "none";
            } else {
                searchBar.style.display = "block";
            }
        }
    </script>
</head>
<body>
    <h1>View Cast Records</h1>
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

                // Create a statement
                PreparedStatement pstmt;
                pstmt = conn.prepareStatement("SELECT * FROM film_production_casts "
                + "INNER JOIN actor ON film_production_casts.actor_id = actor.actor_id "
                + "INNER JOIN individual ON actor.actor_id = individual.individual_id "
                + "INNER JOIN film_project ON film_production_casts.film_id = film_project.film_project_id");

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
    </table>
    
    <h2>Search by:</h2>
    <form action="a3_search.jsp">
        <select id="searchOption" name="column" onchange="showSearchBar()">
            <option value="" disabled selected>Choose search option</option>
            <option value="cast_id">Cast ID</option>
            <option value="actor_id">Actor ID</option>
            <option value="film_id">Film ID</option>
            <option value="role_name">Role Name</option>
            <option value="role_type">Role Type</option>
        </select>
        <div id="searchBar" style="display: none;">
            <input type="text" placeholder="Search..." name="query">
            <button type="submit">Search</button>
        </div>
    </form><br>
    
    <button onclick="window.location.href='a3.html'">Go back to Main Menu</button>

</body>
</html>
