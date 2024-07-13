<%-- 
    Document   : a2_update_processing2
    Created on : 11 20, 23, 11:00:48 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="C" class="crewmaintenance.film_production_crew" scope="session"/>
<%
        int i = 0;
        Object indexObj = session.getAttribute("currentIndex");
        if (indexObj != null && indexObj instanceof Integer) {
            i = (Integer) indexObj; // Cast Object to Integer and then to int
        }

        int v_crew_id = 0; // Declare a different variable name
        Object crewIdObj = session.getAttribute("currentCrewID"); // Use a different variable name
        if (crewIdObj != null && crewIdObj instanceof Integer) {
            v_crew_id = (Integer) crewIdObj; // Cast Object to Integer and then to int
        }

        String filmIdParam = request.getParameter("film_id");
        String departmentIdParam = request.getParameter("department_id");
        String positionNameParam = request.getParameter("position_name");
        String skillsParam = request.getParameter("skills");
        String startDateParam = request.getParameter("start_date");
        String endDateParam = request.getParameter("end_date");
        String individualIdParam = request.getParameter("individual_id");

        int v_film_id = (filmIdParam != null && !filmIdParam.isEmpty()) ? Integer.parseInt(filmIdParam) : C.film_idList.get(i);
        int v_department_id = (departmentIdParam != null && !departmentIdParam.isEmpty()) ? Integer.parseInt(departmentIdParam) : C.department_idList.get(i);
        String v_position_name = (positionNameParam != null && !positionNameParam.isEmpty())? positionNameParam : C.position_nameList.get(i);
        String v_skills = (skillsParam != null && !skillsParam.isEmpty())? skillsParam : C.skillsList.get(i); 
        String v_start_date = (startDateParam != null && !startDateParam.isEmpty())? startDateParam : C.start_dateList.get(i);
        String v_end_date = (endDateParam != null && !endDateParam.isEmpty())? endDateParam : C.end_dateList.get(i); 
        int v_individual_id = (individualIdParam != null && !individualIdParam.isEmpty()) ? Integer.parseInt(individualIdParam) : C.individual_idList.get(i);

        C.crew_id = v_crew_id;
        C.film_id = v_film_id;
        C.department_id = v_department_id;
        C.position_name = v_position_name;
        C.skills = v_skills;
        C.start_date = v_start_date;
        C.end_date = v_end_date;
        C.individual_id = v_individual_id;

        int status = C.updateCrew();

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
