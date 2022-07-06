/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.Provider;
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
public class ProviderModel {
      public List<Provider> getAllProvider(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Provider> list = new ArrayList<Provider>();
        ResultSet rs ;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllProvider()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Provider Provider = new Provider();
                Provider.setProviderId(rs.getInt("ProviderId"));
                Provider.setProviderName(rs.getString("ProviderName"));
                Provider.setAddress(rs.getString("Address"));
                Provider.setPhone(rs.getString("Phone"));
                Provider.setEmail(rs.getString("Email"));
                Provider.setStatus(rs.getBoolean("Status"));
               list.add(Provider);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }



      public boolean insertProvider(Provider provider){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
             conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertProvider(?,?,?,?}");
            calla.setString(1, provider.getProviderName());
             calla.setString(2, provider.getAddress());
             calla.setString(3, provider.getEmail());
            calla.setString(4, provider.getPhone());

            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProviderModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
      
   
         public boolean  checkProviderName(String name){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkProviderName(?,?)}");
            calla.setString(1, name);
            calla.registerOutParameter(2, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean checkExistsProviderName(Provider provider){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;    
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkExistsProviderName(?,?,?)}");
            calla.setInt(1, provider.getProviderId());
            calla.setString(2, provider.getProviderName());
            calla.registerOutParameter(3, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(3);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
     public boolean  checkProviderEmail(String mail){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkProviderEmail(?,?)}");
            calla.setString(1, mail);
            calla.registerOutParameter(2, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean checkExistsProviderEmail(Provider provider){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;    
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkExistsProviderEmail(?,?,?)}");
            calla.setInt(1, provider.getProviderId());
            calla.setString(2, provider.getEmail());
            calla.registerOutParameter(3, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(3);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
     public Provider getProviderById(int id){
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Provider provider = new Provider();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getProviderById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while(rs.next()){
               provider.setProviderId(rs.getInt("ProviderId"));
                provider.setProviderName(rs.getString("ProviderName"));          
                provider.setAddress(rs.getString("Address"));
                provider.setPhone(rs.getString("Phone"));
                provider.setEmail(rs.getString("Email"));
                provider.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return provider;
    }
   
      public boolean updateProvider(Provider provider){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call updateProvider(?,?,?,?,?,?)}");
            calla.setInt(1, provider.getProviderId());
             calla.setString(2, provider.getProviderName());
             calla.setString(3, provider.getAddress());
            
            calla.setString(4, provider.getEmail());
          calla.setString(5, provider.getPhone());          
            calla.setBoolean(6, provider.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean deleteProvider(int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
              conn = ConnectDB.openConnect();
              calla = conn.prepareCall("{ call deleteProvider(?)}");
              calla.setInt(1, id);
              calla.executeUpdate();
              result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        }
       return result;
    }

}
