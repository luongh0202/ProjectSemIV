/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.controller;

import javax.servlet.http.HttpSession;

/**
 *
 * @author LuongHoang
 */
public class CheckUrl {
    public static  boolean check(HttpSession session){
        if(session.getAttribute("user") != null){
            return true;
        }else {
            return false;
        }
    }
}
