<%-- 
    Author     : Kathleen Therese R. Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, expensemaintenance.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expense Record Processing</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id = "E" class = "expensemaintenance.expense" scope="session" />
<%          // Receive the values
            
            int v_film_id = Integer.parseInt(request.getParameter("film_id"));
            int v_department_id = Integer.parseInt(request.getParameter("department_id"));
            String v_description= request.getParameter("description");
            String v_production_type = request.getParameter("production_type");
            String v_date = request.getParameter("date");
            double v_total_cost = Double.parseDouble(request.getParameter("total_cost"));
            
            E.film_id = v_film_id;
            E.department_id = v_department_id;
            E.description = v_description;
            E.production_type = v_production_type;
            E.date = v_date;
            E.total_cost = v_total_cost;

            int status = E.addExpense();
            
            if(status==1) {
%>     
            <h1>Expense Successfully Added</h1>
<%          } else {
%>
            <h1>Failed!</h1>
<%          }
%>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>