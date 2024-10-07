package model;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author gusta
 */
public class DbConnection {
    private Connection connection;
    private String ip;
    private String porta;
    private String dbName;
    private String dbUser="root";
    private String dbPass="";

    public DbConnection() {
        Arquivo arquivo = new Arquivo();
        String content = arquivo.read("db_config.db");
        if (content.isEmpty()) {
            arquivo.write("db_config.db", "0;0;0;0;0;");
        }
        else{
            String[] configs = content.split(";");
            this.ip = configs[0];
            this.porta = configs[1];
            this.dbName = configs[2];
        }
    }

    public DbConnection(String ip, String porta, String dbName, String dbUser, String dbPass) {
        this.ip = ip;
        this.porta = porta;
        this.dbName = dbName;
        this.dbUser = dbUser;
        this.dbPass = dbPass;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPorta() {
        return porta;
    }

    public void setPorta(String porta) {
        this.porta = porta;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public String getDbUser() {
        return dbUser;
    }

    public void setDbUser(String dbUser) {
        this.dbUser = dbUser;
    }

    public String getDbPass() {
        return dbPass;
    }

    public void setDbPass(String dbPass) {
        this.dbPass = dbPass;
    }
    
    public boolean dbConnect(){
        try {
            String url = "jdbc:mysql://"+ getIp() +":"+ getPorta() +"/"+ getDbName() +"";
            String cliente = getDbUser();
            String password = getDbPass();
            connection = DriverManager.getConnection(url, cliente, password);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean testConnection(String ip, String port, String dbName, String dbUser, String dbPass){
        try {
            String url = "jdbc:mysql://"+ ip +":"+ port +"/"+ dbName +"";
            String cliente = dbUser;
            String password = dbPass;
            connection = DriverManager.getConnection(url, cliente, password);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public PreparedStatement prepareStatement(String query) throws SQLException{
        return connection.prepareStatement(query);
    }
    
    public Statement createStatement() throws SQLException{
        return connection.createStatement();
    }
}
