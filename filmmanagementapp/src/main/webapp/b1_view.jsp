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
            <th>expense_id</th>
            <th>film_id</th>
            <th>department_id</th>
            <th>description</th>
            <th>production_type</th>
            <th>date</th>
            <th>total_cost</th>
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
                pstmt = conn.prepareStatement("SELECT * FROM expense AS e "
                + "INNER JOIN receipt AS r ON r.or_no = e.or_no;");

                // Execute the query to retrieve data from the table
                ResultSet rs = pstmt.executeQuery();

                // Iterate through the result set and display table rows
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("expense_id") %></td>
                        <td><%= rs.getInt("film_id") %></td>
                        <td><%= rs.getInt("department_id") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td><%= rs.getString("production_type") %></td>
                        <td><%= rs.getString("date") %></td>
                        <td><%= rs.getDouble("total_cost") %></td>
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
    <form action="b1_search.jsp">
        <select id="searchOption" name="column" onchange="showSearchBar()">
            <option value="" disabled selected>Choose search option</option>
            <option value="expense_id">Expense ID</option>
            <option value="film_id">Film ID</option>
            <option value="department_id">Department ID</option>
            <option value="description">Description</option>
            <option value="production_type">Production Type</option>
            <option value="date">Date</option>
            <option value="total_cost">Total Cost</option>
        </select>
        <div id="searchBar" style="display: none;">
            <input type="text" placeholder="Search..." name="query">
            <button type="submit">Search</button>
        </div>
    </form><br>
    
    <button onclick="window.location.href='b1.html'">Go Back to Main Menu</button>

</body>
</html>

