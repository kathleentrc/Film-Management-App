<%-- 
    Document   : a1_search
    Created on : 21 Nov 2023, 12:44:15 am
    Author     : Shane Cloma
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
            
            // register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            if (conn != null) {
                
            String searchOption = request.getParameter("column");
            String query = request.getParameter("query");
            
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM film_project WHERE " + searchOption + "= ?;");
                
                // pstmt.setString(1, searchOption); 
                pstmt.setString(1, query);
                
                // execute the query to retrieve data from the table
                ResultSet rs = pstmt.executeQuery();

                // iterate through the result set and display table rows
                while (rs.next()) {
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
                        <td><%= rs.getDouble("budget") %></td>
                        <td><%= rs.getDouble("box_office_revenue") %></td>
                        <td><%= rs.getInt("director_id") %></td>
                        <td><%= rs.getInt("producer_id") %></td>
                    </tr>
        <%
                }

                rs.close();
                pstmt.close();
                db_manager.closeConnection(conn);

            } else {

            }
        } catch (SQLException e) {
            out.println("Exception: " + e.getMessage());
        }
        %>
    </table><br>
    </form>
    
    <form action="a1_view.jsp">
    <button type="submit">Go Back</button>
    </form>
    
</body>
</html>
</html>
