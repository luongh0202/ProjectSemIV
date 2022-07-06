/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.controller;

import bkap.demo.entities.Catalog;
import bkap.demo.entities.Order;
import bkap.demo.entities.User;
import bkap.demo.model.CatalogModel;
import bkap.demo.model.FeebackModel;
import bkap.demo.model.OrderModel;
import bkap.demo.model.UserModel;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author LuongHoang
 */
@Controller
public class HomeBackEndController {
    private UserModel userModel;
    private CatalogModel catalogModel;
    private OrderModel orderModel;
    private FeebackModel feebackModel;
    
    public HomeBackEndController(){
        userModel = new UserModel();
        catalogModel = new CatalogModel();
        orderModel = new OrderModel();
        feebackModel = new FeebackModel();
    }
    /**
     * Xư lí khi đăng nhập
     * @return 
     */
    @RequestMapping(value = "initBackendLogin")
    public ModelAndView initBackendLogin(){
        ModelAndView model = new ModelAndView("Admin/Login");
        User user = new User();
        model.addObject("user", user);
        return model;
    }
    /**
     * Kiểm tra thông tin đăng nhập
     * @param user
     * @param mm
     * @param session
     * @return 
     */
    @RequestMapping(value = "backendLogin")
    public String loginBackend(@ModelAttribute("user") User user, ModelMap mm,HttpSession session){
        boolean result = false;
        result = userModel.checkLogin(user);
        if(result){
            session.setAttribute("user", user.getUserName());
            return "redirect: homeBackend.htm";
        } else {
            mm.put("message", "Sai thông tin đăng nhập.");
            return "Admin/Login";
        }
        
    }
    /**
     * Hiển thị thông tin trang chủ backend
     * @param session
     * @return 
     */
    @RequestMapping(value = "homeBackend")
    public ModelAndView homeBacend(HttpSession session){
        ModelAndView model ;
        float totalMoney = 0;
        int totalFeeback;
        if(CheckUrl.check(session)){
            model = new ModelAndView("Admin/Index");
            int totalUser = userModel.getTotalUser();
            int totalOrder = orderModel.getTotalOrder();
            totalFeeback = feebackModel.getTotalFeeback();
            totalMoney = orderModel.getTotalMoney();
            model.getModelMap().put("totalUser", totalUser);
            model.getModelMap().put("totalOrder", totalOrder);
            model.getModelMap().put("totalMoney",totalMoney);
            model.getModelMap().put("totalFeeback", totalFeeback);
            return model;
        } else {
            model = new ModelAndView("Admin/Login");
            User user =new User();
            model.getModelMap().put("user", user);
        }
        return model;
    }
    /**
     * lấy toàn bộ danh sách danh mục
     * @param session
     * @return 
     */
       @RequestMapping(value = "getAllCatalog")
    public ModelAndView getAllCatalog(HttpSession session){
        ModelAndView model; 
           if(CheckUrl.check(session)){
                 model = new ModelAndView("Admin/Catalog");
                 List<Catalog> listCatalog = catalogModel.getAllCatalog();
                 model.getModelMap().put("listCatalog", listCatalog);
           } else {
                model = new ModelAndView("Admin/Login");
                User user =new User();
                model.getModelMap().put("user", user);
           }
      
        return model;
    }
    /**
     * Xử lí khi click vào thêm mới danh mục sản phẩm
     * @param session
     * @return 
     */
    @RequestMapping(value = "initInsertCatalog")
    public ModelAndView initInsertCatalog(HttpSession session){
        ModelAndView model ;
        if(CheckUrl.check(session)){
            model = new ModelAndView("Admin/InsertCatalog");
            List<Catalog> list = catalogModel.getAllCatalog();
            Catalog catalog = new Catalog();
            model.getModelMap().put("newCatalog", catalog);
            model.getModelMap().put("listCatalog", list);
        }else{
             model = new ModelAndView("Admin/Login");
             User user =new User();
             model.getModelMap().put("user", user);
        } 
        return model;
    }
    /**
     * thêm mới danh mục sản phẩm
     * @param catalog
     * @param mm
     * @param request
     * @return 
     */
   @RequestMapping(value = "insertCatalog")
    public String insertCatalog(@ModelAttribute("newCatalog") Catalog catalog, ModelMap mm, HttpServletRequest request){
        String path = request.getRealPath("/jsp/Fontend/images/");
        path = path.substring(0, path.indexOf("\\build"));
        path = path + "\\web\\jsp\\Fontend\\images";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload uploader = new ServletFileUpload(factory);
        try {
            List<FileItem> lst = uploader.parseRequest(request);
            for (FileItem fileItem : lst) {
                if (fileItem.isFormField() == false) {
                    //path
                    catalog.setImages(fileItem.getName());
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }else{
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                     if(name.equals("catalogName")) {
                        catalog.setCatalogName(value);
                    } else if(name.equals("descriptions")){
                        catalog.setDescriptions(value);
                    } else if (name.equals("parentID")){
                        catalog.setParentId(Integer.parseInt(value));
                    } else if(name.equals("displayNumber")){
                        catalog.setDisplayNumber(Integer.parseInt(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        boolean check = catalogModel.insertCatalog(catalog);
        if (check) {
            return "redirect:getAllCatalog.htm";
        } else {
            mm.put("message", "Thêm mới không thành công");
            return "Fontend/InsertCatalog";
        }
    }
    /**
     * Xử lí khi click vào  sửa danh mục sản phẩm
     * @param id
     * @param mm
     * @return 
     */
    @RequestMapping(value = "initUpdateCatalog")
    public ModelAndView initUpdateCatalog(@RequestParam("Id")int id,ModelMap mm){
        ModelAndView model = new ModelAndView("Admin/UpdateCatalog");
        Catalog catalog = catalogModel.getCatalogById(id);
        List<Catalog> list = catalogModel.getAllCatalog();
        model.getModelMap().put("listCatalog", list);
        model.getModelMap().put("updateCatalog", catalog);
        return model;
    }
    /**
     *  sửa danh mục sản phẩm
     * @param id
     * @param mm
     * @return 
     */
      @RequestMapping(value = "viewCatalog")
    public ModelAndView viewCatalog(@RequestParam("Id")int id,ModelMap mm){
        ModelAndView model = new ModelAndView("Admin/CatalogDetail");
        Catalog catalog = catalogModel.getCatalogById(id);
        model.getModelMap().put("catalog", catalog);
        return model;
    }
    /**
     * Xóa  danh mục sản phẩm
     * @param id
     * @param session
     * @return 
     */
     @RequestMapping(value = "deleteCatalog")
    public String deleteCard(@RequestParam("Id") int id,HttpSession session){
        CatalogModel cardModel = new CatalogModel();
        boolean result = false;
        if (CheckUrl.check(session)) {
            result = catalogModel.deleteCatalog(id);
            if (result) {
                return "redirect:getAllCatalog.htm";
            } else {
                return "Admin/Error";
            }
        } else {
            return "redirect:initBackendLogin.htm";
        }

    }
    /**
     *  sửa danh mục sản phẩm
     * @param catalog
     * @param mm
     * @return 
     */
     @RequestMapping(value = "updateCatalog")
    public String updateCatalog(@ModelAttribute("updateCatalog") Catalog catalog, ModelMap mm){
        boolean result = false;
        result = catalogModel.updateCatalog(catalog);
        if(result){
            return  "redirect:getAllCatalog.htm";
        }else {
            mm.put("message", "Sửa không thành công.");
            return "Admin/UpdateCatalog";
        }
    }
    /**
     * 
     * @return 
     */
    @RequestMapping(value = "initOrder")
    public ModelAndView getOrder(){
        ModelAndView model = new ModelAndView("Admin/Order");
        List<Order> listOrder = orderModel.getAllOrder(); 
        model.getModelMap().put("listOrder", listOrder);
        return  model;
        
    }
    /**
     * 
     * @param id
     * @param mm
     * @return 
     */
    @RequestMapping(value = "updateOrder")
    public String updateOrder(@RequestParam("Id") int id, ModelMap mm){
        boolean result = false;
        result = orderModel.updateOrder(id);
        if(result){
            return "initOrder.htm";
        } else {
            mm.put("message", "Sửa không thành công.");
            return "Admin/Error";
        }
    }
    
    
}
