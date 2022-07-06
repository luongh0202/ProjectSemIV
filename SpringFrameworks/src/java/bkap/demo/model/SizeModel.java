/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.Size;
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
public class SizeModel {
    public List<Size> getAllSize() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Size> list = new ArrayList<Size>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" {call getAllSize()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Size size = new Size();
                size.setSizeId(rs.getInt("SizeId"));
                size.setSizeName(rs.getString("SizeName"));
                size.setDescriptions(rs.getString("Descriptions"));
                size.setStatus(rs.getBoolean("Status"));
                list.add(size);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SizeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public boolean insertSize(Size size){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertSize(?,?)}");
            calla.setString(1, size.getSizeName());
            calla.setString(2, size.getDescriptions());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(SizeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean  updateSize(Size size){
        boolean result = false;
        Connection conn = null;
        CallableStatement calla = null;
        try {
              conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateSize(?,?,?,?)}");
            calla.setInt(1, size.getSizeId());
            calla.setString(2, size.getSizeName());
            calla.setString(3, size.getDescriptions());
            calla.setBoolean(4, size.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(SizeModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
        
    }
    public boolean  deleteSize(int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false; 
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call deleteSize(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(SizeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
      public boolean  checkSizeName(String name){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkSizeName(?,?)}");
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
    public boolean checkExistsSizeName(Size size){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;    
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkExistsSizeName(?,?,?)}");
            calla.setInt(1, size.getSizeId());
            calla.setString(2, size.getSizeName());
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
    public Size getSizeById(int id){
        Connection conn = null;
        CallableStatement calla = null;
        Size size = new Size();
        ResultSet rs ;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getSizeById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while(rs.next()){
               
                size.setSizeId(rs.getInt("SizeId"));
                size.setSizeName(rs.getString("SizeName"));
                size.setDescriptions(rs.getString("Descriptions"));
                size.setStatus(rs.getBoolean("Status"));
       
            }
        } catch (SQLException ex) {
            Logger.getLogger(SizeModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return size;
    }

}
