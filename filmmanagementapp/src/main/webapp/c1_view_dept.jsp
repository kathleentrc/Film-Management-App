<%-- 
    Document   : c1_view_dept
    Created on : 21 Nov 2023, 6:32:51 am
    Author     : mnari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Report For Monthly Expenses for Department</title>
</head>
<body>
       <%-- Retrieve the department_id from the query parameters --%>
<%
    String departmentId = request.getParameter("department_id");
    if (departmentId != null) {
        int deptId = Integer.parseInt(departmentId);
        if (deptId == -1) {
%>
            <h1>Showing Monthly Expenditures of All Departments</h1>
<%
        } else {
%>
            <h1>Showing Monthly Expenditures of Department ID: <%= departmentId %></h1>
       
<%
        }
    }
%>

<!-- Your code for displaying the graph image here -->
<img src="GraphServlet?department_id=<%= departmentId %>" alt="Bar Graph"><br>
<button onclick="window.location.href='c1.jsp'">Go back</button>
</body>
</html>


