<%-- 
    Document   : a2_delete
    Created on : 11 20, 23, 7:18:23 PM
    Author     : Kathleen Therese R. Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Crew Record</title>
        <meta charset = "UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Delete Crew Records</h1>
        <form action="a2_delete_processing.jsp">
            <jsp:useBean id="C" class="crewmaintenance.film_production_crew" scope="session"/>
            
            <label for="crew_id">Crew ID:</label>
            <select id="crew_id" name="crew_id">
                <% 
                    C.getLists();
                    for (int i = 0; i < C.crew_idList.size(); i++) {
                %>
                        <option value="<%=C.crew_idList.get(i)%>"><%=C.crew_idList.get(i)%></option>
                <%
                    }
                %>
            </select>
            
            <input type="submit" value="Submit">
        </form><br>
        <button onclick="window.location.href='a2.html'">Go Back to Main Menu</button>
    </body>
</html>
