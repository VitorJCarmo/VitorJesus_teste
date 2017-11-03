

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/includeJs.jspf"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Corridas</title>
    </head>
            <%@include file="WEB-INF/jspf/header.jspf"%>
    <%        
            try {
                        Connection connection = null;

                // Carregua o Driver JDBC 
                String driverName = "org.apache.derby.jdbc.ClientDriver";
                Class.forName(driverName);

                // Cria a conexão com o Banco de Dados 
                String url = "jdbc:derby://localhost:1527/ProjetoDB";
                String username = "app";
                String password = "app";
                connection = DriverManager.getConnection(url, username, password);

                if (request.getParameter("consultamot") != null) {
                    Statement stmt = connection.createStatement();
                    String aux = request.getParameter("nomemot");
                    String nomemot = "'"+aux+"'";
                    ResultSet rs = stmt.executeQuery("select * from CORRIDA where MOTORISTA_CORRIDA="+nomemot);
                    while(rs.next()){
                        String idcorrida = rs.getString("ID_CORRIDA");
                        String passcorrida = rs.getString("PASSAGEIRO_CORRIDA");
                        String motcorrida = rs.getString("MOTORISTA_CORRIDA");
                        String valorcorrida = rs.getString("VALOR_CORRIDA");          
                    %>
                    <div class="container">
           <table class="table table-bordered">
            <tr>
                <th>Id </th>
                <th>Nome Passageiro</th>
                <th>Nome Motorista</th>
                <th>Valor Corrida</th>
            </tr>
            <tr>
                <td><%=idcorrida%></td>
                <td><%=passcorrida%></td>
                <td><%=motcorrida%></td>
                <td><%=valorcorrida%></td>
            </tr>
        </table>
            
                        <%
                        }
                   
                    rs.close();
                    stmt.close();
                }


                if (request.getParameter("consultapass") != null) {
                    Statement stmt2 = connection.createStatement();
                    String aux2 = request.getParameter("nomepass");
                    String nomepass = "'"+aux2+"'";
                    ResultSet rs2 = stmt2.executeQuery("select * from CORRIDA where PASSAGEIRO_CORRIDA="+nomepass);
                    while(rs2.next()){
                        String idcorrida = rs2.getString("ID_CORRIDA");
                        String passcorrida = rs2.getString("PASSAGEIRO_CORRIDA");
                        String motcorrida = rs2.getString("MOTORISTA_CORRIDA");
                        String valorcorrida = rs2.getString("VALOR_CORRIDA");          
                    %>
                    <div class="container">
           <table class="table table-bordered">
            <tr>
                <th>Id </th>
                <th>Nome Passageiro</th>
                <th>Nome Motorista</th>
                <th>Valor Corrida</th>
            </tr>
            <tr>
                <td><%=idcorrida%></td>
                <td><%=passcorrida%></td>
                <td><%=motcorrida%></td>
                <td><%=valorcorrida%></td>
            </tr>
        </table>
            
                        <%
                        }
                   
                    rs2.close();
                    stmt2.close();
                }

                connection.close();
            } catch (ClassNotFoundException e) {
                out.print("Erro Driver");
            } catch (SQLException e) {
                out.print("Erro Falha Conexão");
            } catch (Exception e) {
                out.print("Erro try catch");
            }
    %>

    <body>
        <div class="container">
        <h1>Consulta de Corridas</h1>
                    <form>
                <fieldset>
                    <legend>Consultar Corrida Motorista</legend>
                    <label>Informe Nome do <kbd>Motorista</kbd> para consultar todas as corridas realizadas por ele:</label><input type="text" name="nomemot" maxlength="30" required><BR><BR>
                    <input class="btn btn-default" type="submit" name="consultamot" value="Consultar">
                </fieldset>
            </form>
                    <form>
                <fieldset>
                    <legend>Consultar Corrida Passageiro</legend>
                    <label>Informe Nome do <kbd>Passageiro</kbd> para consultar todas as corridas em que ele esteve:</label><input type="text" name="nomepass" maxlength="30" required><BR><BR>
                    <input class="btn btn-default" type="submit" name="consultapass" value="Consultar">
                </fieldset>
            </form>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
