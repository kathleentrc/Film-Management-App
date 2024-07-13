<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="databasemanager.db_manager" %>


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
    <h1>View Crew Records</h1>
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

                // Create a statement
                PreparedStatement pstmt;
                pstmt = conn.prepareStatement("SELECT * FROM film_production_crew AS f "
                + "INNER JOIN individual AS i ON i.individual_id = f.individual_id "
                + "INNER JOIN department AS d ON f.department_id = d.department_id ");

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
    </table>
    
    <h2>Search by:</h2>
    <form action="a2_search.jsp">
        <select id="searchOption" name="column" onchange="showSearchBar()">
            <option value="" disabled selected>Choose search option</option>
            <option value="crew_id">Crew ID</option>
            <option value="last_name">Last Name</option>
            <option value="first_name">First Name</option>
            <option value="position_name">Position Name</option>
            <option value="department_id">Department ID</option>
        </select>
        <div id="searchBar" style="display: none;">
            <input type="text" placeholder="Search..." name="query">
            <button type="submit">Search</button>
        </div>
    </form><br>
    
    <button onclick="window.location.href='a2.html'">Go Back to Main Menu</button>

</body>
</html>



