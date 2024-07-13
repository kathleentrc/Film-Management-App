<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record Processing</title>
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="E" class="expensemaintenance.expense" scope="session"/>
<%
        int i = 0;
        Object indexObj = session.getAttribute("currentIndex");
        if (indexObj != null && indexObj instanceof Integer) {
            i = (Integer) indexObj; // Cast Object to Integer and then to int
        }

        int v_expense_id = 0; // Declare a different variable name
        Object expenseIDObj = session.getAttribute("currentExpenseID"); // Use a different variable name
        if (expenseIDObj != null && expenseIDObj instanceof Integer) {
            v_expense_id = (Integer) expenseIDObj; // Cast Object to Integer and then to int
        }

        String filmIdParam = request.getParameter("film_id");
        String departmentIdParam = request.getParameter("department_id");
        String descriptionParam = request.getParameter("description");
        String productionTypeParam = request.getParameter("production_type");
        String dateParam = request.getParameter("date");
        String totalCostParam = request.getParameter("total_cost");

        int v_film_id = (filmIdParam != null && !filmIdParam.isEmpty()) ? Integer.parseInt(filmIdParam) : E.film_idList.get(i);
        int v_department_id = (departmentIdParam != null && !departmentIdParam.isEmpty()) ? Integer.parseInt(departmentIdParam) : E.department_idList.get(i);
        String v_description = (descriptionParam != null && !descriptionParam.isEmpty())? descriptionParam : E.descriptionList.get(i);
        String v_production_type = (productionTypeParam != null && !productionTypeParam.isEmpty())? productionTypeParam : E.production_typeList.get(i); 
        String v_date = (dateParam != null && !dateParam.isEmpty())? dateParam : E.dateList.get(i);
        double v_total_cost = (totalCostParam != null && !totalCostParam.isEmpty()) ? Double.parseDouble(totalCostParam) : E.total_costList.get(i);

        E.expense_id = v_expense_id;
        E.film_id = v_film_id;
        E.department_id = v_department_id;
        E.description = v_description;
        E.production_type = v_production_type;
        E.date = v_date;
        E.total_cost = v_total_cost;

        int status = E.updateExpense();

        if (status == 1) {
        %>
        <h1>Expense Record Successfully Updated</h1>
        <%
        } else {
        %>
        <h1>Failed!</h1>
        <%
        }
%>
<input type="submit" value="Return to Menu">
    </body>
</html>