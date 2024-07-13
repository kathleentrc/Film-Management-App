<html>
    <head>
        <title>Update Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="a4_update_processing2.jsp">
            <jsp:useBean id="A" class="equipmentmaintenance.filmequipment" scope="session"/>
          
            <%int curr_equipment_id = Integer.parseInt(request.getParameter("equipment_id"));
            session.setAttribute("currentEquipmentID", curr_equipment_id);%>
            
            <h1>Updating Record for Equipment No. <%= curr_equipment_id %></h1><br>

            <%
            int i;
            for (i = 0; i < A.equipment_idList.size(); i++) {
                if (A.equipment_idList.get(i) == curr_equipment_id) {
                    break;
                }
            }

            int curr_film_id = A.film_idList.get(i);
            String curr_equipment_name = A.equipment_nameList.get(i);
            String curr_equipment_type = A.equipment_typeList.get(i);
            int curr_qty_available = A.qty_availableList.get(i);
            String curr_condition_ = A.condition_List.get(i);
            
            session.setAttribute("currentIndex", i); // store i in session attribute
            %>
            
            Film ID: <input type="number" id="film_id" name="film_id" placeholder="<%= curr_film_id %>"><br><br>
            Equipment Name: <input type="text" id="equipment_name" name="equipment_name" placeholder="<%= curr_equipment_name %>"><br><br>
            Equipment Type: <input type="text" id="equipment_type" name="equipment_type" placeholder="<%= curr_equipment_type %>"><br><br>
            Quantity: <input type="number" id="qty_available" name="qty_available" placeholder="<%= curr_qty_available %>"><br><br>
            Condition: <input type="text" id="condition_" name="condition_" placeholder="<%= curr_condition_ %>"><br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>