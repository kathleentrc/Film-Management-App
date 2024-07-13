<%-- 
    Document   : b2_add_processing
    Created on : Nov 21, 2023, 3:04:52 PM
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Film Project Processing</title>
    </head>
    
    <body>
        <form action="index.html">
        <jsp:useBean id="B" class="worktimeTracker.work_time_log" scope="session"/>
<%
        // get parameters from the form
        String v_date            = request.getParameter("date");
        String v_start_time      = request.getParameter("start_time");
        String v_end_time        = request.getParameter("end_time");
        Integer v_employee_id    = Integer.parseInt(request.getParameter("employee_id"));
        Integer v_total_hours    = Integer.parseInt(request.getParameter("total_hours"));
        
        String overtimeHoursParam = request.getParameter("overtime_hours");
        Integer v_overtime_hours = 0; // Default value if the parameter is not provided or is empty

        if (overtimeHoursParam != null && !overtimeHoursParam.isEmpty()) {
            try {
                v_overtime_hours = Integer.parseInt(overtimeHoursParam);
            } catch (NumberFormatException e) {
                // Handle the case where the parameter is not a valid integer
                e.printStackTrace(); // Log the exception for debugging
            }
        }
        
        Integer v_rate_id        = Integer.parseInt(request.getParameter("rate_id"));       
                
        // set values
        B.date           = v_date;
        B.start_time     = v_start_time;
        B.end_time       = v_end_time;
        B.employee_id    = v_employee_id;
        B.total_hours    = v_total_hours;
        B.overtime_hours = v_overtime_hours;
        B.rate_id        = v_rate_id;

        // call the method to add a film project
        int nStatus = B.addWorkLog();

        if (nStatus == 1) {
%>
        <h1>Adding Record Successful!</h1>
<%
        } else {
%>
        <h1>Adding Record Failed!</h1>
<%
        }
%>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>

