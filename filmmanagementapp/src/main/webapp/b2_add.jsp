<%-- 
    Document   : b2_add
    Created on : Nov 21, 2023, 3:04:07 PM
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Add Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="b2_add_processing.jsp">
            <jsp:useBean id="B" class="worktimeTracker.work_time_log" scope="session"/>
            
            <!-- Add input fields for film project details -->
            Date: <input type="date" id="date" name="date" required><br>
            Start Time: <input type="time" step="1" id="start_time" name="start_time" required><br>
            End Time: <input type="time" step="1" name="end_time" required><br>
            
            Employee ID:<select id="employee_id" name="employee_id">
                <%
                    B.getEmployeeLists();
                    for (int i = 0; i < B.employee_idList.size(); i++) {
                %>
                <option value="<%= B.employee_idList.get(i) %>"><%= B.employee_idList.get(i) %></option>
                <%
                    }
                %>
            </select><br>
            
            Total Hours: <input type="text" id="total_hours" name="total_hours" required><br>
            Overtime Hours: <input type="text" id="overtime_hours" name="overtime_hours" ><br>
            
            Rate ID:<select id="rate_id" name="rate_id">
                <% 
                    B.getRateLists();
                    for (int i = 0; i < B.rateIDList.size(); i++) {
                        String rateOption = B.rateIDList.get(i) + " - Position " + B.ratePositionList.get(i);
                %>
                    <option value="<%= B.rateIDList.get(i) %>"><%= rateOption %></option>
                <%
                    }
                %>
            </select><br>

            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='a1.html'">Go back to Main Menu</button>
    </body>
</html>
