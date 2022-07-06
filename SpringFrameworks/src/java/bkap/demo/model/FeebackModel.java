/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.Feeback;
import bkap.demo.utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Types;

/**
 *
 * @author LuongHoang
 */
public class FeebackModel {
    public boolean insertFeeback(Feeback feeback){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" { call insertFeeback(?,?,?)}");
            calla.setString(1, feeback.getName());
            calla.setString(2, feeback.getEmail());
            calla.setString(3, feeback.getContent());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(FeebackModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public List<Feeback> getAllFeeback(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Feeback> list = new ArrayList<Feeback>();     
        ResultSet rs ;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllFeeback()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Feeback feeback = new Feeback();
                feeback.setFeebackId(rs.getInt("FeebackId"));
                feeback.setName(rs.getString("Name"));
                feeback.setEmail(rs.getString("Email"));
                feeback.setContent(rs.getString("Content"));
                list.add(feeback);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeebackModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
     public int getTotalFeeback(){
      Connection conn = null;
      CallableStatement calla = null;
      int result = 0;
         try {
             conn = ConnectDB.openConnect();
             calla = conn.prepareCall("{ call totalFeeback(?)}");
             calla.registerOutParameter(1, Types.INTEGER);
             calla.executeUpdate();
             result = calla.getInt(1);
         } catch (SQLException ex) {
             Logger.getLogger(FeebackModel.class.getName()).log(Level.SEVERE, null, ex);
         } finally{
            ConnectDB.closeConnect(conn, calla);
         }
         return result;
      
    }
       public boolean updateFeeback(int id){
           Connection conn = null;
           CallableStatement calla = null;
           boolean result = false;
            try {
                conn = ConnectDB.openConnect();
                calla = conn.prepareCall("{ call updateFeeback(?)}");
                calla.setInt(1, id);
                calla.executeUpdate();
                result = true;
            } catch (SQLException ex) {
                Logger.getLogger(FeebackModel.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
                ConnectDB.closeConnect(conn, calla);
            }
           return result;
       }
      
}
