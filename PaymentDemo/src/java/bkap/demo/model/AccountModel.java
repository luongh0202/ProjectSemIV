/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.Account;
import bkap.demo.utils.ConnectBD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LuongHoang
 */
public class AccountModel {
    public List<Account> getAllAccount(){
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Account> list = new ArrayList<Account>();
        ResultSet rs;        
        try {
            conn = ConnectBD.openConnect();
            calla = conn.prepareCall("{ call getAllAccount()}");
            rs = calla.executeQuery();
            while(rs.next()){
                Account account = new Account();
                account.setAccountId(rs.getInt("AccountId"));
                account.setAccNo(rs.getString("AccNo"));
                account.setAccName(rs.getString("AccName"));
                account.setCreateDate(format.format(rs.getDate("CreatedDate")));
                account.setAvailableBalance(rs.getFloat("AvailableBalance"));
                account.setStatus(rs.getBoolean("Status"));
                list.add(account);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectBD.closeConnect(conn, calla);
        }
        return list;
        
    }
    
//    public static void main(String[] args) {
//        System.out.println(new AccountModel().getAllAccount().size());
//    }
}
