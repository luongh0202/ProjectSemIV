/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.controller;

import bkap.demo.entities.Cart;

import bkap.demo.model.ProductModel;
import bkap.demo.utils.Common;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author LuongHoang
 */
@Controller
public class CartController {

    private ProductModel productModel;

    public CartController() {
        productModel = new ProductModel();
    }

    /**
     * thêm sản phẩm vào giỏ hàng
     * @param id
     * @param quantity
     * @param session
     * @param request
     * @return 
     */

    @RequestMapping(value = "/addCart")
    public ModelAndView addCart(@RequestParam("Id") int id, @RequestParam(value = "quantity", required = false) String quantity,
            HttpSession session, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("Fontend/Cart");
        String note = "";
        if (request.getParameter("option-1") != null && request.getParameter("option-0") != null) {
            note = "Size: " + request.getParameter("option-1") + "; Color: " + request.getParameter("option-0");
        }

        int quan = Integer.parseInt(quantity);
        //lay ds sp của user trong session
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        if (listCart == null) {
            // case chưa có dsach nào add luôn sp vao cart được chọn
            listCart = new ArrayList<>();
            listCart.add(new Cart(productModel.getProductById(id), quan, note));
        } else {
            boolean flag = false;
            for (Cart c : listCart) {
                if (c.getProduct().getProductId() == id) {
                    int a = c.getQuantity();
                    c.setQuantity(a + 1);
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                listCart.add(new Cart(productModel.getProductById(id), quan, note));
            }
        }
        // đưa giỏ hàng lên session
        session.setAttribute("listCart", listCart);
        session.setAttribute("total", Common.formatNumber(getTotal(listCart)));
        return model;
    }
     
    /**
     * Kiểm tra sản phẩm đã có trong giỏ hàng chưa
     * @param id
     * @param session
     * @return 
     */
    private int isExisTing(int id, HttpSession session) {
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        for (int i = 0; i < listCart.size(); i++) {
            if (listCart.get(i).getProduct().getProductId() == id) {
                return i;
            }
        }
        return -1;
    }

    /**
     *   Tính tổng tiền trong giỏ hàng
     * @param listCart
     * @return 
     */
    public float getTotal(List<Cart> listCart) {
        float total = 0;
        if (listCart != null) {
            for (Cart c : listCart) {
                if (c.getProduct().getDiscount() == 0) {
                    total += c.getQuantity() * Common.convertToFloat(c.getProduct().getPriceOutput());
                } else {
                    total += c.getQuantity() * Common.convertToFloat(c.getProduct().getPriceDiscount());
                }

            }
        }

        return total;
    }

    
    /**
     * xóa sản phẩm trong giỏ hàng
     * @param id
     * @param session
     * @return 
     */
    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public ModelAndView remove(@RequestParam("Id") int id, HttpSession session) {
        ModelAndView model = new ModelAndView("Fontend/Cart");

        // lấy dssp session kh
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        if (listCart != null) {
            for (int i = 0; i < listCart.size(); i++) {
                if (listCart.get(i).getProduct().getProductId() == id) {
                    // neu sp ton tai thi remove
                    listCart.remove(i).getProduct().getProductId();
                    break;
                }
            }
        }
        // luu ds sp va tong tien
        session.setAttribute("listCart", listCart);
        session.setAttribute("total", Common.formatNumber(getTotal(listCart)));
        return model;
    }

    /**
     * sửa sản phẩm trong giỏ hàng
     * @param request
     * @param session
     * @return 
     */

    @RequestMapping(value = "/update")
    public ModelAndView update(HttpServletRequest request, HttpSession session) {
        ModelAndView model = new ModelAndView("Fontend/Cart");

        // lay dssp khach hang trong session 
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        // lay danh sach sl san pham muon mua
        String[] arrQuantity = request.getParameterValues("quantity");

        for (int i = 0; i < listCart.size(); i++) {
            listCart.get(i).setQuantity(Integer.parseInt(arrQuantity[i]));

//          
            if (Integer.parseInt(arrQuantity[i]) < 1) {
                listCart.get(i).setQuantity(1);
            }
        }
        // luu ds sp va tong tien
        session.setAttribute("listCart", listCart);
        session.setAttribute("total", Common.formatNumber(getTotal(listCart)));
        return model;
    }

    /**
     *  hiển thị thông tin danh sách sản phẩm trên trang giỏ hàng
     * @param session
     * @return 
     */

    @RequestMapping(value = "myCart")
    public ModelAndView myCart(HttpSession session) {
        ModelAndView model = new ModelAndView("Fontend/Cart");
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        float total = (float) getTotal(listCart);
        
        model.getModelMap().put("total", Common.formatNumber(total));
        
        return model;
    }

}
