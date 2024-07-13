package databasemanager;

import java.sql.*;

public class db_manager {
    private static final String URL = "jdbc:mysql://localhost:3306/filmprod_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "6761";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                // Handle any potential exception while closing the connection
                e.printStackTrace();
            }
        }
    }
}

