<%-- 
    Document   : c1
    Created on : 20 Nov 2023, 9:18:01 pm
    Author     : mnari
--%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Expenses Report</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Choose a department to view their expenses records</h1>
        <form action="c1_view_dept.jsp">
            <jsp:useBean id="D" class="expensereport.department" scope="session"/>
            Department:<select id="department_id" name="department_id" required>
                <%
                    D.department_list();
                    for (int i = 0; i < D.department_idlist.size(); i++) {
                %>
                <option value="<%= D.department_idlist.get(i) %>"><%= D.department_namelist.get(i) %></option>
                <%
                    }
                    %>
                <option value="-1">ALL DEPARTMENTS</option>
            </select><br><br>
            
            <input type="submit" value="Submit">
        </form><br>
        <button onclick="window.location.href='index.html'">Go back to Main Menu</button>

    </body>
</html>
