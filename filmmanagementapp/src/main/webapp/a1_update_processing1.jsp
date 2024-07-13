<%-- 
    Document   : a1_update_processing
    Created on : 20 Nov 2023, 7:22:02 pm
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Update Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="a1_update_processing2.jsp">
            <jsp:useBean id="A" class="filmmaintenance.film_production_project" scope="session"/>
          
            <%int curr_film_id = Integer.parseInt(request.getParameter("film_project_id"));
            session.setAttribute("currentFilmID", curr_film_id);%>
            
            <label>Updating Record for Film <%= curr_film_id %></label><br>

            <%
            int i;
            for (i = 0; i < A.film_project_idList.size(); i++) {
                if (A.film_project_idList.get(i) == curr_film_id) {
                    break;
                }
            }
            
            // get values from the list
            String curr_title                 = A.titleList.get(i);
            String curr_short_summary         = A.short_summaryList.get(i);
            String curr_release_date          = A.release_dateList.get(i);
            String curr_production_company    = A.production_companyList.get(i);
            String curr_original_language     = A.original_languageList.get(i);
            Double curr_budget                = A.budgetList.get(i);
            Double curr_box_office_revenue    = A.box_office_revenueList.get(i);
            Integer curr_director_id          = A.director_idList.get(i);
            Integer curr_producer_id          = A.producer_idList.get(i);
            String  curr_age_ratings          = A.age_ratingsList.get(i);
            String  curr_status               = A.statusList.get(i);
            
            session.setAttribute("currentIndex", i); // store i in session attribute
            %>
            
            <!-- Add input fields for film project details -->
            Title: <input type="text" id="title" name="title" placeholder="<%= curr_title %>"><br>
            <label for="short_summary">Short Summary:</label><br>
            <textarea id="short_summary" name="short_summary" rows="6" cols="50" placeholder="<%= curr_short_summary %>"></textarea><br>
            Release Date: <input type="date" id="release_date" name="release_date" placeholder="<%= curr_release_date %>"><br>
            Production Company: <input type="text" id="production_company" name="production_company" placeholder="<%= curr_production_company %>"><br>
            Original Language: <input type="text" id="original_language" name="original_language" placeholder="<%= curr_original_language %>"><br>
            Budget: <input type="text" id="budget" name="budget" placeholder="<%= curr_budget %>"><br>
            Box Office Revenue: <input type="text" id="box_office_revenue" name="box_office_revenue" placeholder="<%= curr_box_office_revenue %>"><br>
            Director ID: <input type="text" id="director_id" name="director_id" placeholder="<%= curr_director_id %>"><br>
            Producer ID: <input type="text" id="producer_id" name="producer_id" placeholder="<%= curr_producer_id %>"><br>
            
            <!-- Add dropdown for Age Ratings -->
            <label for="age_ratings">Age Ratings:</label>
            <select id="age_ratings" name="age_ratings">
                <option value="" disabled selected><%= curr_age_ratings %></option>
                <option value="Rated G">Rated G</option>
                <option value="Rated PG">Rated PG</option>
                <option value="Rated PG-13">Rated PG-13</option>
                <option value="Rated R">Rated R</option>
            </select><br>
            
            <!-- Add dropdown for Status -->
            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="" disabled selected><%= curr_status %></option>
                <option value="Not Yet Started">Not Yet Started</option>
                <option value="Ongoing">Ongoing</option>
                <option value="Completed">Completed</option>
            </select><br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
