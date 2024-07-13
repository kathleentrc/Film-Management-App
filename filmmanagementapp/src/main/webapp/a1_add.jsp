<%-- 
    Document   : a1_add
    Created on : 19 Nov 2023, 10:17:46 pm
    Author     : Shania Francine T. Cloma
--%>

<html>
    <head>
        <title>Add Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="a1_add_processing.jsp">
            <jsp:useBean id="A" class="filmmaintenance.film_production_project" scope="session"/>
            
            <!-- Add input fields for film project details -->
            Title: <input type="text" id="title" name="title" required><br>
            <label for="short_summary">Short Summary:</label><br>
            <textarea id="short_summary" name="short_summary" rows="6" cols="50" required></textarea><br>
            Release Date: <input type="date" id="release_date" name="release_date" required><br>
            Production Company: <input type="text" id="production_company" name="production_company" required><br>
            Original Language: <input type="text" id="original_language" name="original_language" required><br>
            Budget: <input type="text" id="budget" name="budget" required><br>
            Box Office Revenue: <input type="text" id="box_office_revenue" name="box_office_revenue" ><br>
            
            Director ID:<select id="director_id" name="director_id">
                <%
                    A.getEmployeeLists();
                    for (int i = 0; i < A.employee_idList.size(); i++) {
                %>
                <option value="<%= A.employee_idList.get(i) %>"><%= A.employee_idList.get(i) %></option>
                <%
                    }
                %>
            </select><br>
            
            Producer ID:<select id="dproducer_id" name="producer_id">
                <%
                    A.getEmployeeLists();
                    for (int i = 0; i < A.employee_idList.size(); i++) {
                %>
                <option value="<%= A.employee_idList.get(i) %>"><%= A.employee_idList.get(i) %></option>
                <%
                    }
                %>
            </select><br>
            
            <!-- Add dropdown for Age Ratings -->
            <label for="age_ratings">Age Ratings:</label>
            <select id="age_ratings" name="age_ratings">
                <option value="Rated G">Rated G</option>
                <option value="Rated PG">Rated PG</option>
                <option value="Rated PG-13">Rated PG-13</option>
                <option value="Rated R">Rated R</option>
            </select><br>
            
            <!-- Add dropdown for Status -->
            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="Not Yet Started">Not Yet Started</option>
                <option value="Ongoing">Ongoing</option>
                <option value="Completed">Completed</option>
            </select><br>
            
            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='a1.html'">Go back to Main Menu</button>
    </body>
</html>
