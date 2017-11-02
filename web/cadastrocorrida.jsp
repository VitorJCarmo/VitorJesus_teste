

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/includeJs.jspf"%>
<!DOCTYPE html>
<%     
        Connection connection = null;
            try {

                // Carregua o Driver JDBC 
                String driverName = "org.apache.derby.jdbc.ClientDriver";
                Class.forName(driverName);

                // Cria a conexão com o Banco de Dados 
                String url = "jdbc:derby://localhost:1527/ProjetoDB";
                String username = "app";
                String password = "app";
                connection = DriverManager.getConnection(url, username, password);

                if (request.getParameter("cadastrarc") != null) {
                       String insertTableSQL = "INSERT INTO corrida (PASSAGEIRO_CORRIDA ,  MOTORISTA_CORRIDA,  VALOR_CORRIDA) VALUES(?,?,?)";
                       PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
                        String cpfmot = request.getParameter("cpfmot");
                        String cpfpass = request.getParameter("cpfpass");
                        String nvalor = request.getParameter("valor");
                        Statement stmt = connection.createStatement();
                        ResultSet rs;
                        ResultSet rs2;
                        rs2 = stmt.executeQuery("SELECT NOME_MOTORISTA FROM MOTORISTA WHERE CPF_MOTORISTA =" + cpfmot);
                        while (rs2.next()){
                                 
                            preparedStatement.setString(2, rs2.getString("NOME_MOTORISTA"));  
                            String nomepass = rs2.getString("NOME_MOTORISTA");
                           out.print(nomepass);
                        }
                        
                        rs = stmt.executeQuery("SELECT NOME_PASSAGEIRO FROM PASSAGEIRO WHERE CPF_PASSAGEIRO =" + cpfpass);
                        while (rs.next()){
                             preparedStatement.setString(1, rs.getString("NOME_PASSAGEIRO"));
                            String nomemot = rs.getString("NOME_PASSAGEIRO");
                            out.println(nomemot);
                        }
                                
                                preparedStatement.setString(3, nvalor);
                                preparedStatement.executeUpdate();
                                                        
                       
                          
                        
            %>
   <SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
    alert("Corrida Cadastrada!")
</SCRIPT>
<%
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Corridas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div class="container">
        <h1>Cadastro de Corridas</h1>
                    <form>
                <fieldset>
                    <legend>Cadastro Corridas</legend>
                    <label>Informe CPF do Motorista:</label> <input type="number" name="cpfmot" maxlength="30" required><BR><BR>
                    <label>Informe CPF do Passageiro:</label> <input type="number" name="cpfpass"  maxlength="30" required/><BR><BR>
                    <label>Informe o Valor da corrida:</label> <input type="number" name="valor" required/><BR><BR>
                    <input class="btn btn-default" type="submit" name="cadastrarc" value="Cadastrar">
                </fieldset>
            </form>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
