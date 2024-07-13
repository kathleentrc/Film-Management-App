<%-- 
    Document   : b2_update_processing2
    Created on : Nov 21, 2023, 6:28:26 PM
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Work Log Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="B" class="worktimeTracker.work_time_log" scope="session"/>
<%
        int i = 0;
        Object indexObj = session.getAttribute("currentIndex");
        if (indexObj != null && indexObj instanceof Integer) {
            i = (Integer) indexObj; 
        }

        int v_work_id = 0; 
        Object workIdObj = session.getAttribute("currentWorkID");
        if (workIdObj != null && workIdObj instanceof Integer) {
            v_work_id = (Integer) workIdObj;
        }

        String dateA            = request.getParameter("date");
        String start_timeA      = request.getParameter("start_time");
        String end_timeA        = request.getParameter("end_time");
        Integer employee_idA    = Integer.parseInt(request.getParameter("employee_id"));
        Integer total_hoursA    = Integer.parseInt(request.getParameter("total_hours"));
        Integer overtime_hoursA = Integer.parseInt(request.getParameter("overtime_hours"));
        Integer rate_idA        = Integer.parseInt(request.getParameter("rate_id"));
       
        String v_date            = (dateA != null) ? dateA : B.dateList.get(i);
        String v_start_time      = (start_timeA != null) ? start_timeA : B.start_timeList.get(i);
        String v_end_time        = (end_timeA != null) ? end_timeA : B.end_timeList.get(i);
        Integer v_employee_id    = (employee_idA  != null) ? employee_idA  : B.employee_idList.get(i);
        Integer v_total_hours    = (total_hoursA  != null) ? total_hoursA  : B.total_hoursList.get(i);
        Integer v_overtime_hours = (overtime_hoursA  != null) ? overtime_hoursA  : B.overtime_hoursList.get(i);
        Integer v_rate_id        = (rate_idA  != null) ? rate_idA  : B.rate_idList.get(i);
        
       
        // set values
        B.work_log_id    = v_work_id;
        B.date           = v_date;
        B.start_time     = v_start_time;
        B.end_time       = v_end_time;
        B.employee_id    = v_employee_id;
        B.total_hours    = v_total_hours;
        B.overtime_hours = v_overtime_hours;
        B.rate_id        = v_rate_id;

        int nStatus = B.updateWorkLog();

        if (nStatus == 1) {
%>
        <h1>Updating Record Successful!</h1>
<%
        } else {
%>
        <h1>Updating Record Failed!</h1>
<%
        }
%>
<input type="submit" value="Return to Menu">
    </body>
</html>
