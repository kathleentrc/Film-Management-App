<%-- 
    Document   : a1_view
    Created on : 21 Nov 2023, 12:06:57 am
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="databasemanager.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.DecimalFormat" %>

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
            <th>film_project_id</th>
            <th>title</th>
            <th>short_summary</th>
            <th>release_date</th>
            <th>production_company</th>
            <th>original_language</th>
            <th>age_ratings</th>
            <th>status</th>
            <th>budget</th>
            <th>box_office_revenue</th>
            <th>director_id</th>
            <th>producer_id</th>
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
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM film_project");

                /* execute the query to retrieve data from the table */
                ResultSet rs = pstmt.executeQuery();

                /* iterate through the result set and display table rows */
                while (rs.next()) {
                    // Format budget and box office revenue using NumberFormat
                    NumberFormat formatter = NumberFormat.getInstance();
                    formatter.setMinimumFractionDigits(0);
                    formatter.setMaximumFractionDigits(0);

                    String formattedBudget = formatter.format(rs.getDouble("budget"));
                    String formattedBoxOfficeRevenue = formatter.format(rs.getDouble("box_office_revenue"));
                %>
                    <tr>
                        <td><%= rs.getInt("film_project_id") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("short_summary") %></td>
                        <td><%= rs.getString("release_date") %></td>
                        <td><%= rs.getString("production_company") %></td>
                        <td><%= rs.getString("original_language") %></td>
                        <td><%= rs.getString("age_ratings") %></td>
                        <td><%= rs.getString("status") %></td>
                        <td><%= formattedBudget %></td>
                        <td><%= formattedBoxOfficeRevenue %></td>
                        <td><%= rs.getInt("director_id") %></td>
                        <td><%= rs.getInt("producer_id") %></td>
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
    <form action="a1_search.jsp">
        <select id="searchOption" name="column" onchange="showSearchBar()">
            <option value="" disabled selected>Choose search option</option>
            <option value="film_project_id">Film ID</option>
            <option value="title">Film Title</option>
            <option value="short_summary">Short Summary</option>
            <option value="release_date">Release Date</option>
            <option value="production_company">Production Company</option>
            <option value="original_language">Original Language</option>
            <option value="age_ratings">Age Ratings</option>
            <option value="status">Status</option>
            <option value="budget">Budget</option>
            <option value="box_office_revenue">Box Office Revenue</option>
            <option value="director_id">Director ID</option>
            <option value="producer_id">Producer ID</option>
        </select>
        <div id="searchBar" style="display: none;">
            <input type="text" placeholder="Search..." name="query">
            <button type="submit">Search</button>
        </div>
    </form><br>

    
    <button onclick="window.location.href='a1.html'">Go back to Main Menu</button>

</body>
</html>

