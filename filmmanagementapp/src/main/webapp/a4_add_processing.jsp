<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="A" class="equipmentmaintenance.filmequipment" scope="session"/>
<%
        int v_equipment_id = Integer.parseInt(request.getParameter("equipment_id"));
        int v_film_id = Integer.parseInt(request.getParameter("film_id"));
        String v_equipment_name = request.getParameter("equipment_name");
        String v_equipment_type = request.getParameter("equipment_type");
        int v_qty_available = Integer.parseInt(request.getParameter("qty_available"));
        String v_condition_ = request.getParameter("condition_");

        A.equipment_id = v_equipment_id;
        A.film_id = v_film_id;
        A.equipment_name = v_equipment_name;
        A.equipment_type = v_equipment_type;
        A.qty_available = v_qty_available;
        A.condition_ = v_condition_;

        int status = A.add_record();

        if (status == 1) {
%>
        <h1>Adding Record Successful!</h1>
<%
        } else {
%>
        <h1>Adding Record Failed!</h1>
<%
        }
%>
<input type="submit" value="Return to Menu">
    </body>
</html>
