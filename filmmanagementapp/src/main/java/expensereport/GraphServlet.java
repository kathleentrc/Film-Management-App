package expensereport;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

//import expensereport.bar_graph;
//import java.io.FileOutputStream;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/GraphServlet") 

public class GraphServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int departmentId = Integer.parseInt(request.getParameter("department_id"));

        byte[] imageData;

        if (departmentId == -1) {
            // Call your bar_graph class method to generate the graph and get the byte array image data
            imageData = bar_graph.generateGraphAsImage();
        } else {
            imageData = bar_graph.generateGraphAsImage(departmentId); // Update the method name accordingly
        }

        // Set content type
        response.setContentType("image/png");

        // Write image data to the response output stream
        response.getOutputStream().write(imageData);

        
    }
}
