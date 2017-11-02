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
        
        if(request.getParameter("cadastrar")!=null){
            	    String cpfpass = request.getParameter("cpfpass");
	            String nomepass = request.getParameter("nomepass");
	            String nascpass = request.getParameter("datapass");
	            String sexopass = request.getParameter("sexopass");
                    Statement stmt = connection.createStatement();
        String insertTableSQL = "INSERT INTO passageiro"
		+ "(CPF_PASSAGEIRO,NOME_PASSAGEIRO,DATANASC_PASSAGEIRO,SEXO_PASSAGEIRO) VALUES"
		+ "(?,?,?,?)";
    PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
preparedStatement.setString(1, cpfpass);
preparedStatement.setString(2, nomepass);
preparedStatement.setString(3, nascpass);
preparedStatement.setString(4, sexopass);
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
    }
    
     catch (Exception e) {
        out.print("Erro try catch");
     }
    %>
    
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body>
            <%@include file="WEB-INF/jspf/header.jspf"%>
            <div class="container">
            <h1>Cadastro Corridas</h1>
            <form>
                <fieldset>
                    <legend>Cadastro Passageiro</legend>
                    <label>Informe seu nome:</label> <input type="text" name="nomepass" required><BR><BR>
                    <label>Informe sua data de nascimento:</label> <input type="text" name="datapass" id="date" maxlength="10" placeholder="00/00/0000"/><BR><BR>
                    <label>Informe seu numero de CPF:</label><input type="number" name="cpfpass" id="cpf" maxlength="15" required onkeydown=""><BR><BR>
                    <label for="combo1">Informe seu sexo:</label>
                    <select id="combo1" name="sexopass">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                    </select><BR><BR>
                    <input class="btn btn-default" type="submit" name="cadastrar" value="Cadastrar">
                </fieldset>
            </form>
            </div>
        </body>
    </html>
+