<%-- 
    Document   : a1_update
    Created on : 20 Nov 2023, 7:21:51 pm
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
        <form action="a1_update_processing1.jsp">
            <jsp:useBean id="A" class="filmmaintenance.film_production_project" scope="session"/>
            Select a record to update:<select id="film_project_id" name="film_project_id">
                <%
                    A.getLists();
                    for (int i = 0; i < A.film_project_idList.size(); i++) {
                %>
                <option value="<%= A.film_project_idList.get(i) %>"><%= A.film_project_idList.get(i) %></option>
                <%
                    }
                    %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='a3.html'">Go back to Main Menu</button>
    </body>
</html>
