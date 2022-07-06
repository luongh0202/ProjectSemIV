/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.controller;

import bkap.demo.entities.Account;
import bkap.demo.model.AccountModel;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author LuongHoang
 */
@Controller
public class AccountController {
    @RequestMapping(value = "/getAllAccount")
    public ModelAndView getAllAccount(){
        AccountModel accountModel = new AccountModel();
        ModelAndView model = new  ModelAndView("Account");
        List<Account> listAccount = accountModel.getAllAccount();
        model.getModelMap().put("listAccount",listAccount);
        return model;
    }
    
}
