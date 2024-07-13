<html>
    <head>
        <title>Update Crew Records</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="a2_update_processing2.jsp">
            <jsp:useBean id="C" class="crewmaintenance.film_production_crew" scope="session"/>
          
            <%int v_crew_id = Integer.parseInt(request.getParameter("crew_id"));
            session.setAttribute("currentCrewID", v_crew_id);%>
            
            <h1>Updating Record for Crew No. <%= v_crew_id %></h1><br>

            <%
            int i;
            for (i = 0; i < C.crew_idList.size(); i++) {
                if (C.crew_idList.get(i) == v_crew_id) {
                    break;
                }
            }
            
            int v_film_id = C.film_idList.get(i);
            int v_department_id = C.department_idList.get(i);
            String v_position_name = C.position_nameList.get(i);
            String v_skills = C.skillsList.get(i);
            String v_start_date = C.start_dateList.get(i);
            String v_end_date = C.end_dateList.get(i);
            int v_individual_id = C.individual_idList.get(i);
            
            session.setAttribute("currentIndex", i); // store i in session attribute
            %>
            
            
            Film ID: <input type="number" id="film_id" name="film_id" placeholder="<%= v_film_id %>"><br><br>
            Department ID: <input type="number" id="department_id" name="department_id" placeholder="<%= v_department_id %>"><br><br>
            Position Name: <input type="text" id="position_name" name="position_name" placeholder="<%= v_position_name %>"><br><br>
            Skills: <input type="text" id="skills" name="skills" placeholder="<%= v_skills %>"><br><br>
            Start Date: <input type="date" id="start_date" name="start_date" placeholder="<%= v_start_date %>"><br><br>
            End Date: <input type="date" id="end_date" name="end_date" placeholder="<%= v_end_date %>"><br><br>
            Individual ID: <input type="number" id="individual_id" name="individual_id" placeholder="<%= v_individual_id %>"><br><br>

            <input type="submit" value="Submit">
        </form>
    </body>
</html>