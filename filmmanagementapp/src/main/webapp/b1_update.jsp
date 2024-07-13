<html>
    <head>
        <title>Update Expenses</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Update Expense Details</h1>
        <form action="b1_update_processing.jsp">
            <jsp:useBean id="E" class="expensemaintenance.expense" scope="session"/>
            Select a record to update:<select id="expense_id" name="expense_id">
                <%
                    E.getLists();
                    for (int i = 0; i < E.expense_idList.size(); i++) {
                %>
                <option value="<%= E.expense_idList.get(i) %>"><%= E.expense_idList.get(i) %></option>
                <%
                    }
                %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='b1.html'">Go back to Main Menu</button>
    </body>
</html>