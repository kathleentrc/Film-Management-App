<%-- 
    Document   : a3_update
    Created on : 19 Nov 2023, 3:15:50 pm
    Author     : mnari
--%>

<html>
    <head>
        <title>Update Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Update Cast Record</h1>
        <form action="a3_update_processing.jsp">
            <jsp:useBean id="C" class="castmaintenance.film_production_casts" scope="session"/>
            Select a record to update:<select id="cast_id" name="cast_id">
                <%
                    C.getLists();
                    for (int i = 0; i < C.cast_idlist.size(); i++) {
                %>
                <option value="<%= C.cast_idlist.get(i) %>"><%= C.cast_idlist.get(i) %></option>
                <%
                    }
                    %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='a3.html'">Go back to Main Menu</button>
    </body>
</html>
