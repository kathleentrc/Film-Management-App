<%-- 
    Document   : a1_update_processing2
    Created on : 20 Nov 2023, 8:11:05 pm
    Author     : Shane Cloma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Film Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="A" class="filmmaintenance.film_production_project" scope="session"/>
<%
        int i = 0;
        Object indexObj = session.getAttribute("currentIndex");
        if (indexObj != null && indexObj instanceof Integer) {
            i = (Integer) indexObj; 
        }

        int v_film_id = 0; 
        Object filmIdObj = session.getAttribute("currentFilmID");
        if (filmIdObj != null && filmIdObj instanceof Integer) {
            v_film_id = (Integer) filmIdObj; //
        }

        // get parameters from the form
        String titleA                 = request.getParameter("title");
        String short_summaryA         = request.getParameter("short_summary");
        String release_dateA          = request.getParameter("release_date");
        String production_companyA    = request.getParameter("production_company");
        String original_languageA     = request.getParameter("original_language");
        Double budgetA                = Double.valueOf(request.getParameter("budget"));
        Double box_office_revenueA    = Double.valueOf(request.getParameter("box_office_revenue"));
        Integer director_idA          = Integer.parseInt(request.getParameter("director_id"));
        Integer producer_idA          = Integer.parseInt(request.getParameter("producer_id"));
        String  age_ratingsA          = request.getParameter("age_ratings");
        String  statusA               = request.getParameter("status");
        
        
        String v_title                = (titleA != null) ? titleA : A.titleList.get(i);
        String v_short_summary        = (short_summaryA != null) ? short_summaryA : A.short_summaryList.get(i);
        String v_release_date         = (release_dateA  != null) ? release_dateA  : A.release_dateList.get(i);
        String v_production_company   = (production_companyA != null) ? production_companyA : A.production_companyList.get(i);
        String v_original_language    = (original_languageA != null) ? original_languageA : A.original_languageList.get(i);
        Double v_budget               = (budgetA != null) ? Double.valueOf(budgetA) : A.budgetList.get(i);
        Double v_box_office_revenue   = (box_office_revenueA != null) ? Double.valueOf(box_office_revenueA) : A.box_office_revenueList.get(i);
        Integer v_director_id         = (director_idA != null) ? Integer.valueOf(director_idA) : A.director_idList.get(i);
        Integer v_producer_id         = (producer_idA != null) ? Integer.valueOf(producer_idA) : A.producer_idList.get(i);
        String v_age_ratings          = (age_ratingsA != null) ? age_ratingsA : A.age_ratingsList.get(i);
        String v_status               = (statusA  != null) ? statusA  : A.statusList.get(i);
       
        // set values
        A.film_project_id    = v_film_id;
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

        int nStatus = A.updateFilmProject();

        if (nStatus == 1) {
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
