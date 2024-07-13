<%-- 
    Document   : a2_update
    Created on : 11 20, 23, 9:20:12 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Crew Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Update Crew Records</h1>
        <form action="a2_update_processing.jsp">
            <jsp:useBean id="C" class="crewmaintenance.film_production_crew" scope="session"/>
            Select a record to update:<select id="crew_id" name="crew_id">
                <%
                    C.getLists();
                    for (int i = 0; i < C.crew_idList.size(); i++) {
                %>
                <option value="<%= C.crew_idList.get(i) %>"><%= C.crew_idList.get(i) %></option>
                <%
                    }
                    %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='a2.html'">Go back to Main Menu</button>
    </body>
</html>


