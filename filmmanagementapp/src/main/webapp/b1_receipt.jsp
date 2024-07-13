<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="databasemanager.db_manager" %>

<!DOCTYPE html>
<html>
<head>
    <title>List of Expenses</title>
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
    <h1>List of Expenses</h1>
    <table border="1">
        <tr>
            <th>or_no</th>
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
                pstmt = conn.prepareStatement("SELECT * FROM receipt;");

                // Execute the query to retrieve data from the table
                ResultSet rs = pstmt.executeQuery();
        %>
                <h3>List of OR Numbers</h3>

                <% // Iterate through the result set and display table rows
                while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("or_no") %></td>
                    </tr>
                <% } // End of while loop %>

                <% // Close the resources
                rs.close();
                pstmt.close();
                conn.close();
            } 
        } catch (SQLException e) {
            out.println("Exception: " + e.getMessage());
        } %>
    </table>
    
    <h2>Enter OR Number:</h2>
    <form action="b1_receipt_search.jsp">
        <input type="text" placeholder="Enter OR Number" name="query">
        <button type="submit">Generate Receipt</button>
    </form>

    <button onclick="window.location.href='b1.html'">Go Back to Main Menu</button>

</body>
</html>
