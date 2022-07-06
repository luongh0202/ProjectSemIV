/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectBD {
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String URL ="jdbc:sqlserver://localhost:1433;databaseName=webService";
    private static  final String USER = "sa";
    private static final String PASS = "1234$";
    public static Connection openConnect(){
        Connection conn = null;
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectBD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    
//    public static void main(String[] args) {
//        System.out.println(openConnect());
//    }
    public static void closeConnect(Connection conn, CallableStatement calla){
        if(conn != null){
            try {
                
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConnectBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if(calla != null){
            try {
                calla.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConnectBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
