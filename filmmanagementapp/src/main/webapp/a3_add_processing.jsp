<%-- 
    Document   : a3_add_processing
    Created on : 17 Nov 2023, 9:27:30 pm
    Author     : mnari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="C" class="castmaintenance.film_production_casts" scope="session"/>
<%
        int v_actor_id = Integer.parseInt(request.getParameter("actor_id"));
        int v_film_id = Integer.parseInt(request.getParameter("film_id"));
        String v_role_name = request.getParameter("role_name");
        String v_role_type = request.getParameter("role_type");
        
        C.actor_id = v_actor_id;
        C.film_id = v_film_id;
        C.role_name = v_role_name;
        C.role_type = v_role_type;

        int status = C.add_record();

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
