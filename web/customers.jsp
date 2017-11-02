<%-- 
    Document   : customers
    Created on : 25/10/2017, 21:20:46
    Author     : Marjorie
--%>

<%@page import="com.domain.db.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer jdbc</title>
    </head>
    <body>
        <h1>jdbc</h1>
        <h2>Customers</h2>
        <table border ="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Cidade</th>
            </tr>
            <% try {%>
            <%for (Customer c : Customer.getList()) {%>
            <tr>
                <td><%=c.getCustomerId()%></td>
                <td><%=c.getName()%></td>
                <td><%=c.getCity()%></td>
            </tr>
            <%}%>
            <%} catch (Exception ex) {%>
            <tr>
                <td colspan="3"> Erro : <%=ex.getMessage()%></td>
            </tr>
            <%}%>
        </table>




    </body>
</html>
