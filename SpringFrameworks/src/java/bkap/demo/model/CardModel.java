/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.Card;
import bkap.demo.utils.ConnectDB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
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
public class CardModel {
    /**
     * Lấy tất cả thẻ nạp
     * @return 
     */
    public List<Card> getAllCard(){
        Connection conn = null;
        CallableStatement calla = null;
        List<Card> list = new ArrayList<Card>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllCard()}");
            ResultSet rs = calla.executeQuery();
            while(rs.next()){
                Card card = new Card();
                card.setCardId(rs.getInt("CardId"));
                card.setCardNumber(rs.getString("CardNumber"));
                card.setCardSeri(rs.getString("CardSeri"));
                card.setPriceUnit(rs.getInt("PriceUnit"));
                card.setStatus(rs.getBoolean("Status"));
                list.add(card);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Thêm thẻ nạp
     * @param card
     * @return 
     */
    public boolean insertCard(Card card){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;      
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call inserCard(?,?,?)}");
            calla.setString(1, card.getCardSeri());
            calla.setString(2, card.getCardNumber());
            calla.setInt(3, card.getPriceUnit());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Lấy thông tin thẻ nạp theo id
     * @param id mã thẻ nạp cần lấy thông tin
     * @return 
     */
    public Card getCardById(int id){
        Card card = new Card();
        Connection conn = null;
        CallableStatement calla = null;      
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" { call getCardById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while(rs.next()){
                card.setCardId(rs.getInt("CardId"));
                card.setCardNumber(rs.getString("CardNumber"));
                card.setCardSeri(rs.getString("CardSeri"));
                card.setPriceUnit(rs.getInt("PriceUnit"));
                card.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        
        return card;
    }
    /**
     * Lấy thông tin thẻ nạp theo mã thẻ
     * @param number mã thẻ cần lấy thông tin
     * @return 
     */
     public Card getCardByCardNumber(String number){
        Card card = new Card();
        Connection conn = null;
        CallableStatement calla = null;      
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" { call getCardByCardNumber(?)}");
            calla.setString(1, number);
            rs = calla.executeQuery();
            while(rs.next()){
                card.setCardId(rs.getInt("CardId"));
                card.setCardNumber(rs.getString("CardNumber"));
                card.setCardSeri(rs.getString("CardSeri"));
                card.setPriceUnit(rs.getInt("PriceUnit"));
                card.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        
        return card;
    }
     /**
      * Sửa thông tin thẻ nạp
      * @param card đối trượng card cần sửa
      * @return 
      */
    public boolean updateCard(Card card){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call updateCard(?,?,?,?,?)}");
            calla.setInt(1, card.getCardId());
            calla.setString(2, card.getCardSeri());
            calla.setString(3, card.getCardNumber());
            calla.setInt(4, card.getPriceUnit());
            calla.setBoolean(5, card.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Xóa thông tin thẻ nạp
     * @param id mã thẻ nạp cần xóa thông tin
     * @return 
     */
    public boolean deleteCard(int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
              conn = ConnectDB.openConnect();
              calla = conn.prepareCall("{ call deleteCard(?)}");
              calla.setInt(1, id);
              calla.executeUpdate();
              result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        }
       return result;
    }
    /**
     * Kiểm tra seri thẻ đã có trong cơ sở dữ liệu hay chưa
     * @param seri số seri cần kiểm tra
     * @return 
     */
    public boolean  checkCardSeri(String seri){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkCardSeri(?,?)}");
            calla.setString(1, seri);
            calla.registerOutParameter(2, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Kiểm tra số seri khi sửa có trùng với seri đã có hay chưa
     * @param card 
     * @return 
     */
    public boolean checkExistsCardSeri(Card card){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;    
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkExistsCardSeri(?,?,?)}");
            calla.setInt(1, card.getCardId());
            calla.setString(2, card.getCardSeri());
            calla.registerOutParameter(3, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(3);
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
   /**
    * Kiểm tra mã thẻ đã có tring cơ sở dữ liệu chưa
    * @param number mã thẻ cần kiểm tra
    * @return 
    */
     public boolean  checkCardNumber(String number){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;       
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkCardNumber(?,?)}");
            calla.setString(1, number);
            calla.registerOutParameter(2, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(2);
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
     /**
      * Kiểm tra mã thẻ khi sửa có trùng với mã thẻ đã có hay chưa
      * @param card
      * @return 
      */
    public boolean checkExistsCardNumber(Card card){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;    
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call checkExistsCardNumber(?,?,?)}");
            calla.setInt(1, card.getCardId());
            calla.setString(2, card.getCardNumber());
            calla.registerOutParameter(3, Types.BOOLEAN);
            calla.executeUpdate();
            result = calla.getBoolean(3);
        } catch (SQLException ex) {
            Logger.getLogger(CardModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }

    
}
