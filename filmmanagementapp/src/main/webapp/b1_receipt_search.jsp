<%@ page import="java.sql.*" %>
<%@ page import="databasemanager.db_manager" %>

<!DOCTYPE html>
<html>
<head>
    <title>Receipt</title>
</head>
<body>
    <h1>Receipt Information</h1>

    <table border="1">
        <tr>
            <th>or_no</th>
            <th>date</th>
            <th>total_cost</th>
        </tr>
        <% 
        Connection conn = null;
        try {
            String query = request.getParameter("query");

            if (query != null && !query.isEmpty()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Open a connection
                conn = db_manager.getConnection();

                if (conn != null) {
                    PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM receipt WHERE or_no = ?");
                    pstmt.setString(1, query);
                    ResultSet rs = pstmt.executeQuery();

                    while (rs.next()) {
        %>
                        <tr>
                            <td><%= rs.getInt("or_no") %></td>
                            <td><%= rs.getString("date") %></td>
                            <td><%= rs.getDouble("total_cost") %></td>
                        </tr>
        <%
                    }

                    rs.close();
                    pstmt.close();
                    conn.close();
                } 
            }
        } catch (Exception e) {
            out.println("Exception: " + e.getMessage());
        }
        %>
    </table>
    
    <form action="b1_receipt.jsp">
        <button type="submit">Go Back</button>
    </form>
    
</body>
</html>



