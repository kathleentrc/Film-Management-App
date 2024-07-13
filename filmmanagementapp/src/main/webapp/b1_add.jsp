<%-- 
    Author     : Kathleen Therese R. Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expense Tracker</title>
        <meta charset = "UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Track a New Expense</h1>
        <form action="b1_add_processing.jsp">
            <jsp:useBean id="E" class="expensemaintenance.expense" scope="session"/>

            Film ID:<input type="number" id="film_id" name="film_id"><br>
            Department ID:<input type="number" id="department_id" name="department_id"><br>
            Description:<input type="text" id="description" name="description"><br>
            
            <label for="production_type">Production Type:</label>
            <select id="production_type" name="production_type">
            <option value="Pre-Production">Pre-Production</option>
            <option value="Production">Production</option>
            <option value="Post-Production">Post-Production</option>
            </select><br><br>

            Date of Expense:<input type="date" id="date" name="date"><br>
            Total Cost:<input type="number" id="total_cost" name="total_cost"><br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>