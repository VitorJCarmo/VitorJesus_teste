
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/includeJs.jspf"%>
  <%@include file="WEB-INF/jspf/header.jspf" %>
<!DOCTYPE html>
    <html>
    <head>
        <title>Consultar Motorista</title>
</head>
    <%        
            try {
                        String cpfgeral = request.getParameter("cpfmot");
            
                        Connection connection = null;

                // Carregua o Driver JDBC 
                String driverName = "org.apache.derby.jdbc.ClientDriver";
                Class.forName(driverName);

                // Cria a conexão com o Banco de Dados 
                String url = "jdbc:derby://localhost:1527/ProjetoDB";
                String username = "app";
                String password = "app";
                connection = DriverManager.getConnection(url, username, password);               
                    //edita status
                        

                    

                //consulta
                if (request.getParameter("consultar") != null) {
                    Statement stmt = connection.createStatement();
                    String cpfmot = request.getParameter("cpfmot");
                    String sql = ("select * from motorista where CPF_MOTORISTA=" + cpfmot);
                    ResultSet rs = stmt.executeQuery(sql);
                    while(rs.next()){
                        String novocpfmot = rs.getString("CPF_MOTORISTA");
                        String novonomemot = rs.getString("NOME_MOTORISTA");
                        String novonascmot = rs.getString("DATANASC_MOTORISTA");
                        String novostatusmot = rs.getString("STATUS_MOTORISTA");
                        String novomodelomot = rs.getString("MODELO_CARROMOTORISTA");
                        String novosexomot = rs.getString("SEXO_MOTORISTA"); 
                        %>
                    <div class="container">
           <table class="table table-bordered">
            <tr>
                <th>CPF</th>
                <th>Nome</th>
                <th>Data Nasc</th>
                <th>Status</th>
                <th>Modelo Carro</th>
                <th>Sexo</th>
            </tr>
            <tr>
                <td><%=novocpfmot%></td>
                <td><%=novonomemot%></td>
                <td><%=novonascmot%></td>
                <td><%=novostatusmot%>
                <td><%=novomodelomot%></td>
                <td><%=novosexomot%></td>
            </tr>
        </table>
            
                        <%                                                 
                        }
                                rs.close();
                                stmt.close();
                            }
                if (request.getParameter("editar") != null) {
                        Statement stmt2 = connection.createStatement();
                        String novostatus = request.getParameter("newstatus");
                        String ecpfmot = request.getParameter("ecpfmot");
                            out.print(novostatus);
                        String sql2 = ("update  motorista set STATUS_MOTORISTA = ? where CPF_MOTORISTA="+ecpfmot);
                        PreparedStatement preparedStatement = connection.prepareStatement(sql2);
                        preparedStatement.setString(1, novostatus);
                        preparedStatement.executeUpdate();                
                        %>
                        <SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
                                alert("Dados Alterados!")
                            </SCRIPT>
                    <%                connection.close(); }
            } catch (ClassNotFoundException e) {
                out.print("Erro Driver");
            } catch (SQLException e) {
                out.print("Erro Falha Conexão");
            } catch (Exception e) {
                out.print("Erro try catch");
            }
    %>
    <body>
        <h1>Consultar Motorista</h1>
        <form>
        <label>Informe o <kbd>CPF</kbd> do motorista a ser consultado</LABEL>
        <input type="text" name="cpfmot">
        <input class="btn btn-default" type="submit" name="consultar" value="Consultar">
        <hr/>
        </form>
        <h2 align="center">Editar Status Motorista</h2>
        <form>
        <label>Informe o <kbd>CPF</kbd> do motorista para editar o seu status</LABEL>
        <input type="text" name="ecpfmot"><br><br>
        <label for="combo2">Informe o novo <kbd>status</kbd> do Motorista</label>
        <select id="combo2" name="newstatus">
        <option value="ativo">Ativo</option>
        <option value="inativo">Inativo</option>
        </select><BR><BR>
        <input class="btn btn-default" type="submit" name="editar" value="Editar">
        </form>

                    </div>
      <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
