<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="A" class="equipmentmaintenance.filmequipment" scope="session"/>
<%
        int v_equipment_id= Integer.parseInt(request.getParameter("equipment_id"));
        A.equipment_id = v_equipment_id;
        int status = A.delete_record();

        if (status == 1) {
%>
        <h1>Deleting Record Successful!</h1>
<%
        } else {
%>
        <h1>Deleting Record Failed!</h1>
<%
        }
%>
<input type="submit" value="Return to Menu">
    </body>
</html>
