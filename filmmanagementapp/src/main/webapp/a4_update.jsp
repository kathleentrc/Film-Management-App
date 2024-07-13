<html>
    <head>
        <title>Update Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Update Equipment Record</h1>
        <form action="a4_update_processing.jsp">
            <jsp:useBean id="A" class="equipmentmaintenance.filmequipment" scope="session"/>
            Select a record to update:<select id="equipment_id" name="equipment_id">
                <%
                    A.getLists();
                    for (int i = 0; i < A.equipment_idList.size(); i++) {
                %>
                <option value="<%= A.equipment_idList.get(i) %>"><%= A.equipment_idList.get(i) %></option>
                <%
                    }
                %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='a4.html'">Go back to Main Menu</button>
    </body>
</html>
