<%-- 
    Document   : a1_delete
    Created on : 20 Nov 2023, 5:08:39 pm
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete Film Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="a1_delete_processing.jsp">
            <jsp:useBean id="A" class="filmmaintenance.film_production_project" scope="session"/>
            Film ID:<select id="film_project_id" name="film_project_id">
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
