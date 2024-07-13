<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Equipment</title>
        <meta charset = "UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Add Equipment</h1>
        <form action="a4_add_processing.jsp">
            <jsp:useBean id="A" class="equipmentmaintenance.filmequipment" scope="session"/>
            
            Equipment ID:<input type="number" id="equipment_id" name="equipment_id"><br>
            Film ID:<input type="number" id="film_id" name="film_id"><br>
            Equipment Name:<input type="text" id="equipment_name" name="equipment_name"><br>
            Equipment Type:<input type="text" id="equipment_type" name="equipment_type"><br>
            Quantity:<input type="number" id="qty_available" name="qty_available"><br>
            Condition:<input type="text" id="condition_" name="condition_"><br>
            
            <input type="submit" value="Submit">

        </form>
    </body>
</html>