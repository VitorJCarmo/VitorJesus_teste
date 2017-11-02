<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/includeJs.jspf"%>
<%
    Connection connection = null;
    try {

        // Load the JDBC driver  
        String driverName = "org.apache.derby.jdbc.ClientDriver";
        Class.forName(driverName);

        // Create a connection to the database  
        String serverName = "localhost";
        String portNumber = "3306";
        String url = "jdbc:derby://localhost:1527/ProjetoDB";
        String username = "app";
        String password = "app";
        connection = DriverManager.getConnection(url, username, password);

        if (request.getParameter("enviar") != null) {
            String cpfmot = request.getParameter("cpf");
            String nomemot = request.getParameter("nomemot");
            String nascmot = request.getParameter("outra_data");
            String statusmot = request.getParameter("status");
            String sexomot = request.getParameter("sexomot");
            String modelomot = request.getParameter("modelocar");
            Statement stmt = connection.createStatement();
            String insertTableSQL = "INSERT INTO motorista"
                    + "(CPF_MOTORISTA,NOME_MOTORISTA,DATANASC_MOTORISTA,STATUS_MOTORISTA,SEXO_MOTORISTA,MODELO_CARROMOTORISTA) VALUES"
                    + "(?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
            preparedStatement.setString(1, cpfmot);
            preparedStatement.setString(2, nomemot);
            preparedStatement.setString(3, nascmot);
            preparedStatement.setString(4, statusmot);
            preparedStatement.setString(5, sexomot);
            preparedStatement.setString(6, modelomot);
// execute insert SQL stetement
            preparedStatement.executeUpdate();
%>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
    alert("Dados Cadastrados!")
</SCRIPT>
<%
            stmt.close();
            preparedStatement.close();
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
        <title>Cadastrar Motorista</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div class="container">
            <form>
                <fieldset>
                    <legend>Cadastro Mostorista</legend>
                    <label>Informe seu nome: </label> <input type="text" name="nomemot" required><BR><BR>
                    <label>Informe sua data de nascimento: </label> <input type="text" name="outra_data" id="date" maxlength="10" placeholder="00/00/0000"/><BR><BR>
                    <label>Informe seu numero de CPF: </label><input type="number" name="cpf" id="cpf" maxlength="15" required onkeydown=""><BR><BR>
                    <label>Informe o modelo do carro: </label><input type="text" name="modelocar" required><BR><BR>
                    <label>Informe o status:</label>
                      <select id="combo2" name="status">
                        <option value="ativo">Ativo</option>
                        <option value="inativo">Inativo</option>
                    </select><BR><BR>
                    <label for="combo1">Informe seu sexo: </label>
                    <select id="combo1" name="sexomot">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                    </select><BR><BR>
                    <input class="btn btn-default" type="submit" name="enviar" value="Cadastrar">
                </fieldset>
            </form>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
