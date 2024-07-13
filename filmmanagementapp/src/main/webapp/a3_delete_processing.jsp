<%-- 
    Document   : a3_delete_processing
    Created on : 19 Nov 2023, 2:43:01 am
    Author     : mnari
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
        <jsp:useBean id="C" class="castmaintenance.film_production_casts" scope="session"/>
<%
        int v_cast_id = Integer.parseInt(request.getParameter("cast_id"));
        
        C.cast_id = v_cast_id;

        int status = C.delete_record();

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