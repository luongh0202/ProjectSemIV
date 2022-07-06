/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.Color;
import bkap.demo.utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.asm.Type;

/**
 *
 * @author LuongHoang
 */
public class ColorModel {
    /**
     * Lấy danh sách màu của sản phẩm
     * @return 
     */
     public List<Color> getAllColor(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Color> list = new ArrayList<Color>();    
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllColor()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Color color = new Color();
                color.setColorId(rs.getInt("ColorId"));
                color.setColorName(rs.getString("ColorName"));
                color.setNatation(rs.getString("Natation"));
                color.setStatus(rs.getBoolean("Status"));
                list.add(color);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ColorModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
     /**
      * Thêm mới màu của sản phẩm
      * @param color
      * @return 
      */
      public boolean insertColor(Color color){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;      
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertColor(?,?)}");
            calla.setString(1, color.getColorName());
            calla.setString(2, color.getNatation());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ColorModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
      /**
       * Lấy thông tin màu của sản phẩm theo mã màu sản phẩm
       * @param id
       * @return 
       */
    public Color getColorById(int id){
        Color color = new Color();
        Connection conn = null;
        CallableStatement calla = null;      
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" { call getColorById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while(rs.next()){
              color.setColorId(rs.getInt("ColorId"));
              color.setColorName(rs.getString("ColorName"));
              color.setNatation(rs.getString("Natation"));
              color.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ColorModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        
        return color;
    }
    /**
     * Sửa thông tin màu của sản phẩm
     * @param color
     * @return 
     */
    public boolean updateColor(Color color){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateColor(?,?,?,?)}");
            calla.setInt(1, color.getColorId());
            calla.setString(2,color.getColorName());
            calla.setString(3, color.getNatation());
            calla.setBoolean(4, color.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Xóa màu sản phẩm theo mã màu sản phẩm
     * @param id
     * @return 
     */
    public boolean deleteColor(int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
              conn = ConnectDB.openConnect();
              calla = conn.prepareCall("{ call deleteColor(?)}");
              calla.setInt(1, id);
              calla.executeUpdate();
              result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        }
       return result;
    }
    /**
     * 
     * @param name
     * @return 
     */
     public boolean  checkColorName(String name){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkColorName(?,?)}");
            calla.setString(1, name);
            calla.registerOutParameter(2, Type.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean checkExistsColorName(Color catalog){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;    
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkExistsColorName(?,?,?)}");
            calla.setInt(1, catalog.getColorId());
            calla.setString(2, catalog.getColorName());
            calla.registerOutParameter(3, Type.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(3);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
}
