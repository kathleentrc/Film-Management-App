<%-- 
    Document   : a3_update_processing
    Created on : 19 Nov 2023, 3:17:41 pm
    Author     : mnari
--%>

<html>
    <head>
        <title>Update Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="a3_update_processing2.jsp">
            <jsp:useBean id="C" class="castmaintenance.film_production_casts" scope="session"/>
          
            <%int curr_cast_id = Integer.parseInt(request.getParameter("cast_id"));
            session.setAttribute("currentCastID", curr_cast_id);%>
            
            <h1>Updating Record for Cast <%= curr_cast_id %></h1><br>

            <%
            int i;
            for (i = 0; i < C.cast_idlist.size(); i++) {
                if (C.cast_idlist.get(i) == curr_cast_id) {
                    break;
                }
            }
            
            int curr_film_id = C.film_idlist.get(i);
            String curr_role_name = C.role_namelist.get(i);
            String curr_role_type = C.role_typelist.get(i);
            
            session.setAttribute("currentIndex", i); // store i in session attribute
            %>
            
            
            Film ID: <input type="text" id="film_id" name="film_id" placeholder="<%= curr_film_id %>"><br><br>
            Role Name: <input type="text" id="role_name" name="role_name" placeholder="<%= curr_role_name %>"><br><br>
            <label for="role_type">Role Type:</label>
            <select id="role_type" name="role_type">
                <option value="" disabled selected><%= curr_role_type%></option>
                <option value="Lead">Lead</option>
                <option value="Supporting">Supporting</option>
                <option value="Background">Background</option>
                <option value="Other">Other</option>
            </select><br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
