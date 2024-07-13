<%-- 
    Document   : b2_update
    Created on : Nov 21, 2023, 5:25:48 PM
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Update Film Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="b2_update_processing1.jsp">
            <jsp:useBean id="B" class="worktimeTracker.work_time_log" scope="session"/>
            
            Select a record to update:<select id="work_log_id" name="work_log_id">
                <%
                    B.getLists();
                    for (int i = 0; i < B.work_log_idList.size(); i++) {
                %>
                <option value="<%= B.work_log_idList.get(i) %>"><%= B.work_log_idList.get(i) %></option>
                <%
                    }
                    %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='b2.html'">Go back to Main Menu</button>
    </body>
</html>
