

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
                        String cpfmot = request.getParameter("cpfmot");
                        String cpfpass = request.getParameter("cpfpass");
                        String nvalor = request.getParameter("valor");
                        Statement stmt2 = connection.createStatement();
                        
                        
                       String sql = ("SELECT STATUS_MOTORISTA FROM MOTORISTA WHERE CPF_MOTORISTA =" + cpfmot);
                       ResultSet rs4 = stmt2.executeQuery(sql);
                        while(rs4.next()){
                           rs4.getString("STATUS_MOTORISTA");  
                            String statusmot = rs4.getString("STATUS_MOTORISTA");
                            out.print(statusmot);
                            if((statusmot).equalsIgnoreCase("inativo")){
                                %>
                                <SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
 alert("Motorista Inativo");
                                </SCRIPT>
                                
                                
                                <%
                                connection.close();
                            }
                                                    }
                        
                    
                       String insertTableSQL = "INSERT INTO corrida (PASSAGEIRO_CORRIDA ,  MOTORISTA_CORRIDA,  VALOR_CORRIDA) VALUES(?,?,?)";
                       PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
                        Statement stmt = connection.createStatement();
                        ResultSet rs;
                        ResultSet rs2;
                        ResultSet rs3;
                        rs2 = stmt.executeQuery("SELECT NOME_MOTORISTA FROM MOTORISTA WHERE CPF_MOTORISTA =" + cpfmot);
                        while (rs2.next()){
                                 
                            preparedStatement.setString(2, rs2.getString("NOME_MOTORISTA"));  
                            String nomemot = rs2.getString("NOME_MOTORISTA");
                           
                        }
                        
                        rs = stmt.executeQuery("SELECT NOME_PASSAGEIRO FROM PASSAGEIRO WHERE CPF_PASSAGEIRO =" + cpfpass);
                        while (rs.next()){
                             preparedStatement.setString(1, rs.getString("NOME_PASSAGEIRO"));
                            String nomepass = rs.getString("NOME_PASSAGEIRO");
                            
                        }
                                
                                preparedStatement.setString(3, nvalor);
                                preparedStatement.executeUpdate();
                                                        
                      
                        
            %>
   <SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
    alert("Corrida Cadastrada!");
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
