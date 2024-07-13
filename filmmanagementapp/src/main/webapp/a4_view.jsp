<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    <h1>View Film Project Records</h1>
    <table border="1">
        <tr>
            <th>equipment_id</th>
            <th>film_id</th>
            <th>equipment_name</th>
            <th>equipment_type</th>
            <th>qty_available</th>
            <th>condition_</th>
        </tr>
        <% 
        try {
            /* register the JDBC driver */
            Class.forName("com.mysql.cj.jdbc.Driver");

            /* open a connection */
            Connection conn = db_manager.getConnection();

            /* check if the connection is successful */
            if (conn != null) {

                /* create a statement */
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM equipment");

                /* execute the query to retrieve data from the table */
                ResultSet rs = pstmt.executeQuery();

                /* iterate through the result set and display table rows */
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("equipment_id") %></td>
                        <td><%= rs.getInt("film_id") %></td>
                        <td><%= rs.getString("equipment_name") %></td>
                        <td><%= rs.getString("equipment_type") %></td>
                        <td><%= rs.getInt("qty_available") %></td>
                        <td><%= rs.getString("condition_") %></td>
                    </tr>
        <%
                }

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
    <form action="a4_search.jsp">
        <select id="searchOption" name="column" onchange="showSearchBar()">
            <option value="" disabled selected>Choose search option</option>
            <option value="equipment_id">Equipment ID</option>
            <option value="film_id">Film ID</option>
            <option value="equipment_name">Equipment Name</option>
            <option value="equipment_type">Equipment Type</option>
            <option value="qty_available">Quantity Available</option>
            <option value="condition_">Condition</option>
        </select>
        <div id="searchBar" style="display: none;">
            <input type="text" placeholder="Search..." name="query">
            <button type="submit">Search</button>
        </div>
    </form><br>

    
    <button onclick="window.location.href='a4.html'">Go back to Main Menu</button>

</body>
</html>
