
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@include file="WEB-INF/jspf/includeJs.jspf"%>
<!DOCTYPE html>
    <html>
    <head>
        <title>Consultar Passageiro</title>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
                <%@include file="WEB-INF/jspf/header.jspf"%>
    <%        
        Connection connection = null;
            try {

                // Carregua o Driver JDBC 
                String driverName = "org.apache.derby.jdbc.ClientDriver";
                Class.forName(driverName);

                // Cria a conexão com o Banco de Dados 
                String serverName = "localhost";
                String portNumber = "3306";
                String url = "jdbc:derby://localhost:1527/ProjetoDB";
                String username = "app";
                String password = "app";
                connection = DriverManager.getConnection(url, username, password);

                if (request.getParameter("consultar") != null) {
                    Statement stmt = connection.createStatement();
                    String cpfpass = request.getParameter("cpfpass");
                    String sql = ("select * from passageiro where CPF_PASSAGEIRO=" + cpfpass);
                    ResultSet rs = stmt.executeQuery(sql);
                    while(rs.next()){
                        String novocpfpass = rs.getString("CPF_PASSAGEIRO");
                        String novonomepass = rs.getString("NOME_PASSAGEIRO");
                        String novonascpass = rs.getString("DATANASC_PASSAGEIRO");
                        String novosexopass = rs.getString("SEXO_PASSAGEIRO");          
                    %>
                    <div class="container">
           <table class="table table-bordered">
            <tr>
                <th>CPF</th>
                <th>Nome</th>
                <th>Data Nasc</th>
                <th>Sexo</th>
            </tr>
            <tr>
                <td><%=novocpfpass%></td>
                <td><%=novonomepass%></td>
                <td><%=novonascpass%></td>
                <td><%=novosexopass%></td>
            </tr>
        </table>
                    </div>
                    <%
                        }
                    rs.close();
                    stmt.close();
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
        <div clas="container">
        <h1>Consultar Passageiro</h1>
        <form>
        <label>Informe o <kbd>CPF</kbd> do passageiro a ser consultado</LABEL>
        <input type="text" name="cpfpass">
        <input class="btn btn-default" type="submit" name="consultar" value="Consultar">
        </FORM>
        </div>
    </body>
</html>
