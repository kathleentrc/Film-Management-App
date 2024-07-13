<%-- 
    Document   : b2_search
    Created on : Nov 21, 2023, 6:54:04 PM
    Author     : Shane Cloma
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            
            // register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            if (conn != null) {
                
            String searchOption = request.getParameter("column");
            String query = request.getParameter("query");
            
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM work_time_log WHERE " + searchOption + "= ?;");
                
                // pstmt.setString(1, searchOption); 
                pstmt.setString(1, query);
                
                // execute the query to retrieve data from the table
                ResultSet rs = pstmt.executeQuery();

                // iterate through the result set and display table rows
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
                <%@ page import="databasemanager.*" %>

            } else {

            }
        } catch (SQLException e) {
            out.println("Exception: " + e.getMessage());
        }
        %>
    </table><br>
    </form>
    
    <form action="b2_view.jsp">
    <button type="submit">Go Back</button>
    </form>
    
</body>
</html>
</html>

