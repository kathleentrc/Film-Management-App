package worktimeTracker;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/LineGraphServlet") 

public class LineGraphServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   

        byte[] imageData;

       
        imageData = line_chart.generateGraphAsImage();
       
        // Set content type
        response.setContentType("image/png");
        
        


        // Write image data to the response output stream
        response.getOutputStream().write(imageData);
        // Print a part of the image data
        System.out.println("Image Data: " + Arrays.toString(Arrays.copyOfRange(imageData, 0, 100)));

        
    }
}

