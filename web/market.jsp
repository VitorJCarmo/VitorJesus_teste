
<%@page import="com.domain.db.Market"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>jdbc</h1>
        <h2>Market</h2>
        <table border ="1">
            <tr>
                <th>code</th>
                <th>radius</th>
                <th>area_Lenght</th>
                <th>area_Width</th>
            </tr>
            <% try {%>
            <%for (Market c : Market.getList()) {%>
            <tr>
                <td><%=c.getCode()%></td>
                <td><%=c.getRadius()%></td>
                <td><%=c.getAlenght()%></td>
                <td><%=c.getAwidth()%></td>
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
