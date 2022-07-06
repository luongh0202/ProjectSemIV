/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.Banner;
import bkap.demo.utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LuongHoang
 */
public class BannerModel {
    /**
     * Lấy danh sách tất cả banner
     * @return list banner
     */
    public List<Banner> getAllBanner(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Banner> list = new ArrayList<Banner>();
        ResultSet rs ;
        try {
            // Mở kết nối
            conn = ConnectDB.openConnect();
            // gọi thủ tục lấy tất cả banner
            calla = conn.prepareCall("{ call getAllBanner()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Banner banner = new Banner();
                banner.setBannerId(rs.getInt("BannerId"));
                banner.setImages(rs.getString("Image"));
                banner.setDisplayNumber(rs.getInt("DisplayNumber"));
                banner.setStatus(rs.getBoolean("Status"));
                list.add(banner);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BannerModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Lấy thông tin banner theo id
     * @param id mã bannner cần lấy thông tin
     * @return banner
     */
    public Banner getBannerById(int id){
        Connection conn = null;
        CallableStatement calla = null;
        ResultSet rs;
        Banner banner = new Banner();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getBannerById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while(rs.next()){
                 banner.setBannerId(rs.getInt("BannerId"));
                banner.setImages(rs.getString("Image"));
                banner.setDisplayNumber(rs.getInt("DisplayNumber"));
                banner.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BannerModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return banner;
    }
    /**
     * Thêm dữ liệu cho banner
     * @param banner đối tượng banner cần thêm
     * @return True: Thêm thành công
     *         False: Thêm không thành công
     */
    public boolean insertBanner(Banner banner){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
             conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertBanner(?,?)}");
            calla.setString(1, banner.getImages());
            calla.setInt(2, banner.getDisplayNumber());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(BannerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Sửa thông tin banner
     * @param banner
     * @return 
     */
      public boolean updateBanner(Banner banner){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call updateBanner(?,?,?,?)}");
            calla.setInt(1, banner.getBannerId());
            calla.setString(2, banner.getImages());
            calla.setInt(3, banner.getDisplayNumber());
            calla.setBoolean(4, banner.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(BannerModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
      /**
       * Xóa banner
       * @param id mã banner cần xóa thông tin
       * @return True: Xóa thành công
       *         False: Xóa không thành công
       */
    public boolean deleteBanner(int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
              conn = ConnectDB.openConnect();
              calla = conn.prepareCall("{ call deleteBanner(?)}");
              calla.setInt(1, id);
              calla.executeUpdate();
              result = true;
        } catch (SQLException ex) {
            Logger.getLogger(BannerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
       return result;
    }
    /**
     * lấy banner hiển thị ở trang chủ (lấy 2 banner có độ ưu tiên hiển thị cao để hiện thị ra trang chủ)
     * @return list banner
     */
    public List<Banner> getBanner(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Banner> list = new ArrayList<Banner>();
        ResultSet rs ;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getBanner()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Banner banner = new Banner();
                banner.setBannerId(rs.getInt("BannerId"));
                banner.setImages(rs.getString("Image"));
                banner.setDisplayNumber(rs.getInt("DisplayNumber"));
                banner.setStatus(rs.getBoolean("Status"));
                list.add(banner);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BannerModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
}
