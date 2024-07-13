<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Add Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Add Cast Records</h1>
        <form action="a3_add_processing.jsp">
            <jsp:useBean id="A" class="castmaintenance.actor" scope="session"/>
            Actor ID:<select id="actor_id" name="actor_id" required>
                <%
                    A.actor_list();
                    for (int i = 0; i < A.actor_idlist.size(); i++) {
                %>
                <option value="<%= A.actor_idlist.get(i) %>"><%= A.actor_idlist.get(i) %></option>
                <%
                    }
                    %>
            </select><br><br>
            Film ID:<input type="text" id="film_id" name="film_id" required><br><br>
            Role Name:<input type="text" id="role_name" name="role_name" required><br><br>
            <label for="role_type">Role Type:</label>
            <select id="role_type" name="role_type" required>
            <option value="Lead">Lead</option>
            <option value="Supporting">Supporting</option>
            <option value="Background">Background</option>
            <option value="Other">Other</option>
            </select><br><br>
            <input type="submit" value="Submit">
        </form><br>
        <button onclick="window.location.href='a3.html'">Go back to Main Menu</button>
    </body>
</html>
