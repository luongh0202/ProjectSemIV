/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.Packages;
import bkap.demo.utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LuongHoang
 */
public class PackageModel {
     public List<bkap.demo.entities.Packages> getAllPackage(){
        Connection conn = null;
        CallableStatement calla = null;
        List<bkap.demo.entities.Packages> list = new ArrayList<bkap.demo.entities.Packages>();
        ResultSet rs ;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllPackage()}");
            rs = calla.executeQuery();
            while(rs.next()){
              bkap.demo.entities.Packages pa = new bkap.demo.entities.Packages();
              pa.setPackageId(rs.getInt("PackageId"));
              pa.setPackageName(rs.getString("PackageName"));
              pa.setAmount(rs.getFloat("Amount"));
              pa.setUserId(rs.getInt("UserId"));
              pa.setStatus(rs.getBoolean("Status"));
              list.add(pa);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public bkap.demo.entities.Packages getPackageById(int id){
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        bkap.demo.entities.Packages pa = new bkap.demo.entities.Packages();      
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getPackageById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while(rs.next()){
                pa.setPackageId(rs.getInt("PackageId"));
                pa.setPackageName(rs.getString("PackageName"));
                pa.setAmount(rs.getFloat("Amount"));
                pa.setUserId(rs.getInt("UserId"));
                pa.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return pa;
    }
    
     public boolean insertPackage(String name, int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
             conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertPackage(?,?)}");
            calla.setString(1, name);
            calla.setInt(2, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
      public boolean insertPackageF(Packages pa){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
             conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertPackage(?,?)}");
            calla.setString(1, pa.getPackageName());
            calla.setInt(2, pa.getUserId());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
      public boolean updatePackage(bkap.demo.entities.Packages pa){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call updatePackage(?,?,?,?,?)}");
            calla.setInt(1, pa.getPackageId());
            calla.setString(2, pa.getPackageName());
            calla.setFloat(3, pa.getAmount());
            calla.setInt(4, pa.getUserId());
            calla.setBoolean(5, pa.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
       public boolean addMoneyPackage(int money, int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;      
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call addMoneyPackage(?,?)}");
            calla.setInt(1, money);
            calla.setInt(2,id);
          
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean deletePackage(int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
              conn = ConnectDB.openConnect();
              calla = conn.prepareCall("{ call deletePackage(?)}");
              calla.setInt(1, id);
              calla.executeUpdate();
              result = true;
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
       return result;
    }
     public boolean  checkPackageName(String name){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkPackageName(?,?)}");
            calla.setString(1, name);
            calla.registerOutParameter(2, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean checkExistsPackageName(bkap.demo.entities.Packages pa){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;    
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkExistsPackageName(?,?,?)}");
            calla.setInt(1, pa.getPackageId());
            calla.setString(2, pa.getPackageName());
            calla.registerOutParameter(3, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(3);
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean checkPackage(String name, float total){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;    
         try {
             conn = ConnectDB.openConnect();
             calla = conn.prepareCall("{ call checkPackage(?,?,?)}");
             calla.setString(1, name);
             calla.setFloat(2, total);
             calla.registerOutParameter(3, Types.BOOLEAN);
             calla.executeUpdate();
             result = calla.getBoolean(3);
         } catch (SQLException ex) {
             Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
         } finally{
             ConnectDB.closeConnect(conn, calla);
         }
         return result;
    }
    public boolean  finishPackage(String name, float total){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;   
         try {
             conn = ConnectDB.openConnect();
             calla = conn.prepareCall("{ call finishPackage(?,?)}");
             calla.setString(1, name);
             calla.setFloat(2, total);
             calla.executeUpdate();
             result = true;
         } catch (SQLException ex) {
             Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             ConnectDB.closeConnect(conn, calla);
         }
         return result;
    }
    public Packages getPackageByUserId(int id){
        Connection conn = null;
        CallableStatement calla = null;
        Packages pa = new Packages();
        ResultSet rs;
         try {
             conn = ConnectDB.openConnect();
             calla = conn.prepareCall("{ call  getPackageByUserId(?)}");
             calla.setInt(1,id);
             rs = calla.executeQuery();
             while(rs.next()){
                 pa.setPackageId(rs.getInt("PackageId"));
                 pa.setPackageName(rs.getString("PackageName"));
                 pa.setAmount(rs.getFloat("Amount"));
                 pa.setUserId(id);
                 pa.setStatus(rs.getBoolean("Status"));
             }
         } catch (SQLException ex) {
             Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
         }
         return pa;
    }
}
