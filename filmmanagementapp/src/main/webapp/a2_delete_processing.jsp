<%-- 
    Document   : a2_delete_processing
    Created on : 11 20, 23, 7:18:23 PM
    Author     : Kathleen Therese R. Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="C" class="crewmaintenance.film_production_crew" scope="session"/>
<%
        int v_crew_id = Integer.parseInt(request.getParameter("crew_id"));
        
        C.crew_id = v_crew_id;

        int status = C.deleteCrew();

        if (status == 1) {
%>
        <h1>Crew Successfully Deleted</h1>
<%
        } else {
%>
        <h1>Failed!</h1>
<%
        }
%>
<input type="submit" value="Return to Menu">
    </body>
</html>