
package com.domain.db;
import java.util.ArrayList;
//importacoes para usar o banco
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public class Market {
 private String code;
 private String radius;
private String alenght;
private String awidth;

    public Market(String code, String radius, String alenght, String awidth) {
        this.code = code;
        this.radius = radius;
        this.alenght = alenght;
        this.awidth = awidth;
    }


    public static ArrayList<Market> getList() throws Exception{
    ArrayList<Market> marketlist = new ArrayList<>();
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    String url = "jdbc:derby://localhost:1527/sample";
    String user = "app";String pass = "app";
    Connection c = DriverManager.getConnection(url, user ,pass); //c é um nome qq
    Statement s = c.createStatement();
    ResultSet rs = s.executeQuery("SELECT*FROM MICRO_MARKET");
    while (rs.next()){
        Market dado = new Market(
                rs.getString("ZIP_CODE")
                ,rs.getString("RADIUS")
                ,rs.getString("AREA_LENGTH")
                ,rs.getString("AREA_WIDTH")
        
        );
                marketlist.add(dado);
    }
    rs.close(); s.close(); c.close();;
    return marketlist;
}
    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getRadius() {
        return radius;
    }

    public void setRadius(String radius) {
        this.radius = radius;
    }

    public String getAlenght() {
        return alenght;
    }

    public void setAlenght(String alenght) {
        this.alenght = alenght;
    }

    public String getAwidth() {
        return awidth;
    }

    public void setAwidth(String awidth) {
        this.awidth = awidth;
    }


}
