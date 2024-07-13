<%-- 
    Document   : a2_add
    Created on : 11 20, 23, 4:26:38 PM
    Author     : Kathleen Therese R. Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Crew Record</title>
        <meta charset = "UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Add Crew Records</h1>
        <form action="a2_add_processing.jsp">
            <jsp:useBean id="C" class="crewmaintenance.film_production_crew" scope="session"/>
            
            Film ID:<input type="number" id="film_id" name="film_id"><br>
            Department ID:<input type="number" id="department_id" name="department_id"><br>
            Position Name:<input type="text" id="position_name" name="position_name"><br>
            Skills:<input type="text" id="skills" name="skills"><br>
            Start Date:<input type="date" id="start_date" name="start_date"><br>
            End Date:<input type="date" id="end_date" name="end_date"><br>
            Individual ID:<input type="number" id="individual_id" name="individual_id"><br>
            
            <input type="submit" value="Submit">

        </form>
    </body>
</html>