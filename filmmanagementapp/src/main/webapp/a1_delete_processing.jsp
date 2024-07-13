<%-- 
    Document   : a1_delete_processing
    Created on : 20 Nov 2023, 6:56:38 pm
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Film Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="A" class="filmmaintenance.film_production_project" scope="session"/>
<%
        int v_film_project_id = Integer.parseInt(request.getParameter("film_project_id"));
        
        A.film_project_id = v_film_project_id;

        int nStatus = A.deleteFilmProject();

        if (nStatus == 1) {
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
