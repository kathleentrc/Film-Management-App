<%-- 
    Document   : b2_view
    Created on : Nov 21, 2023, 7:00:06 PM
    Author     : Shane Cloma
--%>

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
    <h1>Cast & Crew Work Log</h1>
    <table border="1">
        <tr>
            <th>work_log_id</th>
            <th>date</th>
            <th>start_time</th>
            <th>end_time</th>
            <th>employee_id</th>
            <th>total_hours</th>
            <th>overtime_hours</th>
            <th>rate_id</th>
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
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM work_time_log");

                /* execute the query to retrieve data from the table */
                ResultSet rs = pstmt.executeQuery();

                /* iterate through the result set and display table rows */
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("work_log_id") %></td>
                        <td><%= rs.getString("date") %></td>
                        <td><%= rs.getString("start_time") %></td>
                        <td><%= rs.getString("end_time") %></td>
                        <td><%= rs.getInt("employee_id") %></td>
                        <td><%= rs.getInt("total_hours") %></td>
                        <td><%= rs.getInt("overtime_hours") %></td>
                        <td><%= rs.getInt("rate_id") %></td>
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
    <form action="b2_search.jsp">
        <select id="searchOption" name="column" onchange="showSearchBar()">
            <option value="" disabled selected>Choose search option</option>
            <option value="work_log_id">Work Log ID</option>
            <option value="date">Date</option>
            <option value="start_time">Start Time</option>
            <option value="end_time">End Time</option>
            <option value="employee_id">Employee ID</option>
            <option value="total_hours">Total Hours</option>
            <option value="overtime_hours">Overtime Hours</option>
            <option value="rate_id">Rate ID</option>
        </select>
        <div id="searchBar" style="display: none;">
            <input type="text" placeholder="Search..." name="query">
            <button type="submit">Search</button>
        </div>
    </form><br>
    
    <button onclick="window.location.href='b2.html'">Go back to Main Menu</button>

</body>
</html>
