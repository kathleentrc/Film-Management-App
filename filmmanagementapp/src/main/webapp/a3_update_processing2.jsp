<%-- 
    Document   : a3_update_processing2
    Created on : 19 Nov 2023, 4:06:03 pm
    Author     : mnari
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="C" class="castmaintenance.film_production_casts" scope="session"/>
<%
        int i = 0;
        Object indexObj = session.getAttribute("currentIndex");
        if (indexObj != null && indexObj instanceof Integer) {
            i = (Integer) indexObj; // Cast Object to Integer and then to int
        }

        int v_cast_id = 0; // Declare a different variable name
        Object castIdObj = session.getAttribute("currentCastID"); // Use a different variable name
        if (castIdObj != null && castIdObj instanceof Integer) {
            v_cast_id = (Integer) castIdObj; // Cast Object to Integer and then to int
        }

        String filmIdParam = request.getParameter("film_id");
        String roleParam = request.getParameter("role_name");
        String roleTypeParam = request.getParameter("role_type");

       
        int v_film_id = (filmIdParam != null && !filmIdParam.isEmpty()) ? Integer.parseInt(filmIdParam) : C.film_idlist.get(i);
        String v_role_name = (roleParam != null && !roleParam.isEmpty())? roleParam : C.role_namelist.get(i);
        String v_role_type = (roleTypeParam != null && !roleTypeParam.isEmpty())? roleTypeParam : C.role_typelist.get(i); //
        
        C.cast_id = v_cast_id;
        C.film_id = v_film_id;
        C.role_name = v_role_name;
        C.role_type = v_role_type;

        int status = C.update_record();

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