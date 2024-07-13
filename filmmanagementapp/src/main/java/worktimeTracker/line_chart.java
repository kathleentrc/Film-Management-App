/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package worktimeTracker;

import databasemanager.db_manager;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author mnari
 */
public class line_chart {
    public static byte[] generateGraphAsImage() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Connection conn = null;
        // Connect to the database and retrieve data
        try {
            
            conn = db_manager.getConnection();
      
            
            PreparedStatement pstmt = conn.prepareStatement(
                        "SELECT WEEK(date) AS week, SUM(total_hours) AS total_hours " +
                          "FROM work_time_log " +
                          "GROUP BY WEEK(date) " +
                          "ORDER BY week ");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                    int week = rs.getInt("week");
                    int hours = rs.getInt("total_hours");
                    dataset.addValue(hours, "Total Hours", Integer.toString(week));
                }

                pstmt.close();
                
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_manager.closeConnection(conn);
        }

        // Create the line chart
        JFreeChart lineChart = ChartFactory.createLineChart(
                "Total Work Hours per Week", // Chart title
                "Week", // X-axis label
                "Work Hours", // Y-axis label
                dataset
        );
        
      

        // Create a buffered image from the chart
        BufferedImage bufferedImage = lineChart.createBufferedImage(1000, 800);

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
        String fileName = "linegraphhhh.png";
        try (FileOutputStream fos = new FileOutputStream(fileName)) {
            fos.write(imageData);
            System.out.println("Image saved to: " + fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
