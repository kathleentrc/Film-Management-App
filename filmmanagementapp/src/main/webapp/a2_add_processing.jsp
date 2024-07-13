<%-- 
    Document   : a2_add
    Created on : 11 20, 23, 4:16:17 PM
    Author     : Kathleen Therese R. Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, crewmaintenance.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crew Record Processing</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id = "C" class = "crewmaintenance.film_production_crew" scope="session" />
<%          // Receive the values
    
            //int v_crew_id = Integer.parseInt(request.getParameter("crew_id"));
            int v_film_id = Integer.parseInt(request.getParameter("film_id"));
            int v_department_id = Integer.parseInt(request.getParameter("department_id"));
            String v_position_name = request.getParameter("position_name");
            String v_skills = request.getParameter("skills");
            String v_start_date = request.getParameter("start_date");
            String v_end_date = request.getParameter("end_date");
            int v_individual_id = Integer.parseInt(request.getParameter("individual_id"));
            
            //C.crew_id = v_crew_id;
            C.film_id = v_film_id;
            C.department_id = v_department_id;
            C.position_name = v_position_name;
            C.skills = v_skills;
            C.start_date = v_start_date;
            C.end_date = v_end_date;
            C.individual_id = v_individual_id;
            
            int status = C.registerCrew();
            
            if(status==1) {
%>     
            <h1>Crew Successfully Added</h1>
<%          } else {
%>
            <h1>Failed!</h1>
<%          }
%>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>