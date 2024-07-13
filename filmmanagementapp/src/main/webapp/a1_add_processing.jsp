<%-- 
    Document   : a1_add_processing
    Created on : 19 Nov 2023, 10:17:46 pm
    Author     : Shania Francine T. Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Film Project Processing</title>
    </head>
    
    <body>
        <form action="index.html">
        <jsp:useBean id="A" class="filmmaintenance.film_production_project" scope="session"/>
<%
        // get parameters from the form
        String v_title                 = request.getParameter("title");
        String v_short_summary         = request.getParameter("short_summary");
        String v_release_date          = request.getParameter("release_date");
        String v_production_company    = request.getParameter("production_company");
        String v_original_language     = request.getParameter("original_language");
        Double v_budget                = Double.valueOf(request.getParameter("budget"));
        
        String boxOfficeRevenueParam = request.getParameter("box_office_revenue");
        Double v_box_office_revenue = 0.0;

        if (boxOfficeRevenueParam != null && !boxOfficeRevenueParam.isEmpty()) {
            try {
                v_box_office_revenue = Double.valueOf(boxOfficeRevenueParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        
        Integer v_director_id          = Integer.parseInt(request.getParameter("director_id"));
        Integer v_producer_id          = Integer.parseInt(request.getParameter("producer_id"));
        String  v_age_ratings          = request.getParameter("age_ratings");
        String  v_status               = request.getParameter("status");
                
        // set values
        A.title              = v_title;
        A.short_summary      = v_short_summary;
        A.release_date       = v_release_date;
        A.production_company = v_production_company;
        A.original_language  = v_original_language;
        A.budget             = v_budget;
        A.box_office_revenue = v_box_office_revenue;
        A.director_id        = v_director_id;
        A.producer_id        = v_producer_id;
        A.age_ratings        = v_age_ratings;
        A.status             = v_status;

        // call the method to add a film project
        int nStatus = A.addFilmProject();

        if (nStatus == 1) {
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
        </form>
    </body>
</html>
