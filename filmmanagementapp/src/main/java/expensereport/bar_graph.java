package expensereport;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.CategoryPlot;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.*;
import java.io.FileOutputStream;
import databasemanager.db_manager;

public class bar_graph {

    public static byte[] generateGraphAsImage(int department_id) {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Connection conn = null;
        // Connect to the database and retrieve data
        try {
            
            conn = db_manager.getConnection();
            String sql = "SELECT DATE_FORMAT(date, '%Y-%m') AS month_year, SUM(total_cost) AS total_cost_per_month\n" +
            "FROM receipt\n" +
            "JOIN expense ON receipt.or_no = expense.or_no\n" +
            "WHERE department_id = ?\n" +
            "GROUP BY DATE_FORMAT(date, '%Y-%m')\n" +
            "ORDER BY month_year;";
    
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, department_id); // Set the department ID as an integer

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String category = resultSet.getString("month_year");
                double value = resultSet.getDouble("total_cost_per_month");
                dataset.addValue(value, "total_cost_per_month", category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_manager.closeConnection(conn);
        }

        // Create the bar chart
        JFreeChart chart = ChartFactory.createBarChart(
                "Total Expenses per Month of Department",
                "Months",
                "Total Cost",
                dataset
        );
        
        // After creating the chart, access its plot (CategoryPlot)
CategoryPlot plot = (CategoryPlot) chart.getPlot();

// Access the domain (X-axis) and adjust its rendering to prevent label truncation
CategoryAxis domainAxis = plot.getDomainAxis();
domainAxis.setMaximumCategoryLabelWidthRatio(10.0f); // Adjust the ratio as needed
domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45); // Rotate labels if necessary

        // Create a buffered image from the chart
        BufferedImage bufferedImage = chart.createBufferedImage(1000, 800);

        // Convert the buffered image to byte array
        byte[] imageData = null;
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            javax.imageio.ImageIO.write(bufferedImage, "png", baos);
            imageData = baos.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return imageData;
    }
    
    public static byte[] generateGraphAsImage() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Connection conn = null;
        // Connect to the database and retrieve data
        try {
            conn = db_manager.getConnection();
            
            String sql = "SELECT DATE_FORMAT(date, '%Y-%m') AS month_year, SUM(total_cost) AS total_cost_per_month\n" +
            "FROM receipt\n" +
            "JOIN expense ON receipt.or_no = expense.or_no\n" +
            "GROUP BY DATE_FORMAT(date, '%Y-%m')\n" +
            "ORDER BY month_year;";
    
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
           

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String category = resultSet.getString("month_year");
                double value = resultSet.getDouble("total_cost_per_month");
                dataset.addValue(value, "total_cost_per_month", category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_manager.closeConnection(conn);
        }

        // Create the bar chart
        JFreeChart chart = ChartFactory.createBarChart(
                "Monthly Departmental Expenditure",
                "Months",
                "Total Cost",
                dataset
        );
        
        // After creating the chart, access its plot (CategoryPlot)
        CategoryPlot plot = (CategoryPlot) chart.getPlot();

        // Access the domain (X-axis) and adjust its rendering to prevent label truncation
        CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setMaximumCategoryLabelWidthRatio(10.0f); // Adjust the ratio as needed
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45); // Rotate labels if necessary

        // Create a buffered image from the chart
        BufferedImage bufferedImage = chart.createBufferedImage(1000, 800);

        // Convert the buffered image to byte array
        byte[] imageData = null;
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            javax.imageio.ImageIO.write(bufferedImage, "png", baos);
            imageData = baos.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return imageData;
    }
    
    public static void main(String[] args) {
        byte[] imageData = generateGraphAsImage();

        // Save the generated image to a file for testing
        String fileName = "bargraphhhh.png";
        try (FileOutputStream fos = new FileOutputStream(fileName)) {
            fos.write(imageData);
            System.out.println("Image saved to: " + fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
