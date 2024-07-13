<%-- 
    Document   : a3_delete
    Created on : 19 Nov 2023, 2:40:19 am
    Author     : mnari
--%>

<html>
    <head>
        <title>Delete Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Delete Cast Records</h1>
        <form action="a3_delete_processing.jsp">
            <jsp:useBean id="C" class="castmaintenance.film_production_casts" scope="session"/>
            Cast ID:<select id="cast_id" name="cast_id">
                <%
                    C.getLists();
                    for (int i = 0; i < C.cast_idlist.size(); i++) {
                %>
                <option value="<%= C.cast_idlist.get(i) %>"><%= C.cast_idlist.get(i) %></option>
                <%
                    }
                    %>
            </select>
            <input type="submit" value="Submit">
        </form><br>
        <button onclick="window.location.href='a3.html'">Go back to Main Menu</button>
    </body>
</html>