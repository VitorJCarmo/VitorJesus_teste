
package com.domain.db;

import java.util.ArrayList;
//importacoes para usar o banco
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public class Motorista {
private int motoristaCPF;
private String motoristaname; 
private String modelomotorista; 
private String statusmotorista; 
private String sexomotorista;
private String datanascmotorista;


//se der exceção trata na pg web (throws Exception)
public static ArrayList<Motorista> getList() throws Exception{
    ArrayList<Motorista> list = new ArrayList<>();
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    String url = "jdbc:mysql://localhost:3306/novo banco?zeroDateTimeBehavior=convertToNull";
    String user = "app";String pass = "app";
    Connection c = DriverManager.getConnection(url, user ,pass); //c é um nome qq
    Statement s = c.createStatement();
    ResultSet rs = s.executeQuery("SELECT*FROM CUSTOMER");
    while (rs.next()){
        Motorista cust = new Motorista(
                rs.getInt("CPF_MOTORISTA")
                ,rs.getString("NOME_MOTORISTA")
                ,rs.getString("DATANASC_MOTORISTA")
                ,rs.getString("SEXO_MOTORISTA")
                ,rs.getString("STATUS_MOTORISTA")
                ,rs.getString("MODELO_CARROMOTORISTA"));
                list.add(cust);
    }
    rs.close(); s.close(); c.close();;
    return list;
}

    public int getMotoristaCPF() {
        return motoristaCPF;
    }

    public void setMotoristaCPF(int motoristaCPF) {
        this.motoristaCPF = motoristaCPF;
    }

    public String getMotoristaname() {
        return motoristaname;
    }

    public void setMotoristaname(String motoristaname) {
        this.motoristaname = motoristaname;
    }

    public String getModelomotorista() {
        return modelomotorista;
    }

    public void setModelomotorista(String modelomotorista) {
        this.modelomotorista = modelomotorista;
    }

    public String getStatusmotorista() {
        return statusmotorista;
    }

    public void setStatusmotorista(String statusmotorista) {
        this.statusmotorista = statusmotorista;
    }

    public String getSexomotorista() {
        return sexomotorista;
    }

    public void setSexomotorista(String sexomotorista) {
        this.sexomotorista = sexomotorista;
    }

    public Motorista(int motoristaCPF, String motoristaname, String modelomotorista, String statusmotorista, String sexomotorista, String datanascmotorista) {
        this.motoristaCPF = motoristaCPF;
        this.motoristaname = motoristaname;
        this.modelomotorista = modelomotorista;
        this.statusmotorista = statusmotorista;
        this.sexomotorista = sexomotorista;
    }

    public String getDatanascmotorista() {
        return datanascmotorista;
    }

    public void setDatanascmotorista(String datanascmotorista) {
        this.datanascmotorista = datanascmotorista;
    }


    

    


    
}
