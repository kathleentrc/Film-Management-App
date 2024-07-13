<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="databasemanager.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Equipment Records</title>
</head>
<body>
    <h1>Search Equipment Results</h1>
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
            
            // register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            /* open a connection */
            Connection conn = db_manager.getConnection();
            
            if (conn != null) {
                
            String searchOption = request.getParameter("column");
            String query = request.getParameter("query");
            
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM equipment WHERE " + searchOption + "= ?;");
                
                // pstmt.setString(1, searchOption); 
                pstmt.setString(1, query);
                
                // execute the query to retrieve data from the table
                ResultSet rs = pstmt.executeQuery();

                // iterate through the result set and display table rows
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

            } else {

            }
        } catch (SQLException e) {
            out.println("Exception: " + e.getMessage());
        }
        %>
    </table><br>
    </form>
    
    <form action="a4_view.jsp">
    <button type="submit">Go Back</button>
    </form>
    
</body>
</html>
</html>
