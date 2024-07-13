<%-- 
    Document   : b2_update_processing1
    Created on : Nov 21, 2023, 5:30:55 PM
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Update Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="b2_update_processing2.jsp">
            <jsp:useBean id="B" class="worktimeTracker.work_time_log" scope="session"/>
          
            <%int curr_work_id = Integer.parseInt(request.getParameter("work_log_id"));
            session.setAttribute("currentWorkID", curr_work_id);%>
            
            <label>Updating Record for Work ID <%= curr_work_id %></label><br>

            <%
            int i;
            for (i = 0; i < B.work_log_idList.size(); i++) {
                if (B.work_log_idList.get(i) == curr_work_id) {
                    break;
                }
            }
            
            // get values from the list
            String curr_date            = B.dateList.get(i);
            String curr_start_time      = B.start_timeList.get(i);
            String curr_end_time        = B.end_timeList.get(i);
            Integer curr_employee_id    = B.employee_idList.get(i);
            Integer curr_total_hours    = B.total_hoursList.get(i);
            Integer curr_overtime_hours = B.overtime_hoursList.get(i);
            Integer curr_rate_id        = B.rate_idList.get(i);
            
            session.setAttribute("currentIndex", i); // store i in session attribute
            %>
            
            
            Date: <input type="date" id="date" name="date" placeholder="<%= curr_date %>"><br>
            Start Time: <input type="time" id="start_time" name="start_time" placeholder="<%= curr_start_time %>"><br>
            End Time: <input type="time" id="end_time" name="end_time" placeholder="<%= curr_end_time %>"><br>
            Employee ID: <input type="text" id="employee_id" name="employee_id" value="<%= curr_employee_id %>" readonly><br>
            Total Hours: <input type="text" id="total_hours" name="total_hours" placeholder="<%= curr_total_hours %>"><br>
            Overtime Hours: <input type="text" id="overtime_hours" name="overtime_hours" placeholder="<%= curr_overtime_hours %>"><br>
            
            Rate ID: 
            <select id="rate_id" name="rate_id">
                <% 
                    B.getRateLists();
                    for (int j = 0; j < B.rateIDList.size(); j++) {
                        String rateOption = B.rateIDList.get(j) + " - Position " + B.ratePositionList.get(j);
                %>
                    <option value="<%= B.rateIDList.get(j) %>" <%= B.rateIDList.get(j).equals(curr_rate_id) ? "selected" : "" %>><%= rateOption %></option>
                <%
                    }
                %>
            </select><br>

            <input type="submit" value="Submit">
        </form>
    </body>
</html>
