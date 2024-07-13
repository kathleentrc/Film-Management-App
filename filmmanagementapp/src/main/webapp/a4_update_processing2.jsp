<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="A" class="equipmentmaintenance.filmequipment" scope="session"/>
<%
        int i = 0;
        Object indexObj = session.getAttribute("currentIndex");
        if (indexObj != null && indexObj instanceof Integer) {
            i = (Integer) indexObj; // Cast Object to Integer and then to int
        }

        int v_equipment_id = 0; // Declare a different variable name
        Object equipmentIdObj = session.getAttribute("currentEquipmentID"); // Use a different variable name
        if (equipmentIdObj != null && equipmentIdObj instanceof Integer) {
            v_equipment_id = (Integer) equipmentIdObj; // Cast Object to Integer and then to int
        }

        String equipmentIdParam = request.getParameter("equipment_id");
        String filmIdParam = request.getParameter("film_id");
        String equipmentNameParam = request.getParameter("equipment_name");
        String equipmentTypeParam = request.getParameter("equipment_type");
        String quantityParam = request.getParameter("qty_available");
        String conditionParam = request.getParameter("condition_");
       

        int v_film_id = (filmIdParam != null && !filmIdParam.isEmpty()) ? Integer.parseInt(filmIdParam) : A.film_idList.get(i);
        String v_equipment_name = (equipmentNameParam != null && !equipmentNameParam.isEmpty())? equipmentNameParam : A.equipment_nameList.get(i); //
        String v_equipment_type = (equipmentTypeParam != null && !equipmentTypeParam.isEmpty())? equipmentTypeParam : A.equipment_typeList.get(i); //
        int v_qty_available= (quantityParam != null && !quantityParam.isEmpty()) ? Integer.parseInt(quantityParam) : A.qty_availableList.get(i);
        String v_condition_ = (conditionParam != null && !conditionParam.isEmpty())? conditionParam : A.condition_List.get(i); //

        A.equipment_id = v_equipment_id;
        A.film_id = v_film_id;
        A.equipment_name = v_equipment_name;
        A.equipment_type = v_equipment_type;
        A.qty_available = v_qty_available;
        A.condition_ = v_condition_;

        int status = A.update_record();

        if (status == 1) {
%>
        <h1>Updating Record Successful!</h1>
<%
        } else {
%>
        <h1>Updating Record Failed!</h1>
<%
        }
%>
<input type="submit" value="Return to Menu">
    </body>
</html>