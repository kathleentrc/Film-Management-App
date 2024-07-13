<html>
    <head>
        <title>Update Crew Records</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="b1_update_processing2.jsp">
            <jsp:useBean id="E" class="expensemaintenance.expense" scope="session"/>
          
            <%int v_expense_id = Integer.parseInt(request.getParameter("expense_id"));
            session.setAttribute("currentExpenseID", v_expense_id);%>
            
            <h1>Updating Record for Expense ID No. <%= v_expense_id %></h1><br>

            <%
            int i;
            for (i = 0; i < E.expense_idList.size(); i++) {
                if (E.expense_idList.get(i) == v_expense_id) {
                    break;
                }
            }

            int v_film_id = E.film_idList.get(i);
            int v_department_id = E.department_idList.get(i);
            String v_description = E.descriptionList.get(i);
            String v_production_type = E.production_typeList.get(i);
            String v_date = E.dateList.get(i);
            double v_total_cost = E.total_costList.get(i);
            
            session.setAttribute("currentIndex", i); // store i in session attribute
            %>
            
            Film ID: <input type="number" id="film_id" name="film_id" placeholder="<%= v_film_id %>"><br><br>
            Department ID: <input type="number" id="department_id" name="department_id" placeholder="<%= v_department_id %>"><br><br>
            Description: <input type="text" id="description" name="description" placeholder="<%= v_description %>"><br><br>
            Production Type: <input type="text" id="production_type" name="production_type" placeholder="<%= v_production_type %>"><br><br>
            <label for="production_type">Production Type: </label>
            <select id="production_type" name="production_type">
                <option value="" disabled selected><%= v_production_type %></option>
                <option value="Pre-Production">Pre-Production</option>
                <option value="Production">Production</option>
                <option value="Post-Production">Post-Production</option>
            </select><br><br>
            Date: <input type="date" id="date" name="date" placeholder="<%= v_date %>"><br><br>
            Total Cost: <input type="number" id="total_cost" name="total_cost" placeholder="<%= v_total_cost %>"><br><br>

            <input type="submit" value="Submit">
        </form>
    </body>
</html>