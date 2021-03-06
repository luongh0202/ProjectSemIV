/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.controller;

import bkap.demo.entities.Card;
import bkap.demo.entities.Cart;
import bkap.demo.entities.Catalog;
import bkap.demo.entities.CatalogPost;
import bkap.demo.entities.Color;
import bkap.demo.entities.Feeback;
import bkap.demo.entities.ImageLink;
import bkap.demo.entities.Order;
import bkap.demo.entities.OrderDetail;
import bkap.demo.entities.Packages;
import bkap.demo.entities.Payment;
import bkap.demo.entities.Post;
import bkap.demo.entities.Product;
import bkap.demo.entities.ProductColor;
import bkap.demo.entities.ProductSize;
import bkap.demo.entities.Provider;
import bkap.demo.entities.User;
import bkap.demo.model.CardModel;
import bkap.demo.model.CatalogModel;
import bkap.demo.model.ColorModel;
import bkap.demo.model.FeebackModel;
import bkap.demo.model.OrderModel;
import bkap.demo.model.PackageModel;
import bkap.demo.model.PostModel;
import bkap.demo.model.ProductModel;
import bkap.demo.model.ProviderModel;
import bkap.demo.model.UserModel;
import bkap.demo.utils.Common;
import bkap.demo.utils.ConnectDB;
import bkap.demo.utils.EmailUtil;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import javax.servlet.http.HttpSession;
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
public class FontendController {

    private ProductModel productModel;
    private CatalogModel catalogModel;
    private UserModel userModel;
    private ProviderModel providerModel;
    private ColorModel colorModel;
    private PostModel postModel;
    private OrderModel orderModel;
    private FeebackModel feebackModel;
    private PackageModel packageModel;
    private CardModel cardModel;

    public FontendController() {
        productModel = new ProductModel();
        catalogModel = new CatalogModel();
        userModel = new UserModel();
        providerModel = new ProviderModel();
        colorModel = new ColorModel();
        postModel = new PostModel();
        orderModel = new OrderModel();
        feebackModel = new FeebackModel();
        packageModel = new PackageModel();
        orderModel = new OrderModel();
        cardModel = new CardModel();
    }

    /**
     * l???y danh s??ch to??n b??? s???n ph???m
     *
     * @return
     */
    @RequestMapping(value = "getAllProduct")
    public ModelAndView getDataProduct() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        ModelAndView model = new ModelAndView("Fontend/Product");
        int sizeRowofPage = 12;//s??? s???n ph??m rtreen 1 trang

        HashMap map1 = productModel.getDataPagination(1, sizeRowofPage);
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();//danh s??ch danh m???c cha hi???n th??? menu tr??i

        List<Provider> listProvider = providerModel.getAllProvider();//danh s??ch nh?? cung c???p hi???n th??? cho ph???n l???c theo th????ng hi???u
        List<Color> listColor = colorModel.getAllColor();//danh s??ch m??u s???c hi??n rthij cho ph???n l???c theo m??u s???c
        List<Product> listProductHot = productModel.getProductHot();// danh s??ch s???n ph??m n???i b???t
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();

        String url = (String) map1.get("url");//chu???i ph??n trang
        List<Product> listProduct = new ArrayList<>();
        try {
            ResultSet rs = (ResultSet) map1.get("rs");
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setCatalogId(rs.getInt("CatalogId"));
                product.setProductContent(rs.getString("ProductContent"));;
                product.setProductContentDetail(rs.getString("ProductContentDetail"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(Common.formatNumber(rs.getFloat("PriceInput")));
                product.setPriceOutput(Common.formatNumber(rs.getFloat("PriceOutput")));
                product.setQuantity(rs.getInt("Quantity"));
                product.setProviderId(rs.getInt("ProviderId"));
                product.setImages(rs.getString("Images"));
                product.setImageHover(rs.getString("ImageHover"));
                product.setDiscount(rs.getInt("Discount"));
                product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float) (100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                listProduct.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Connection conn = (Connection) map1.get("conn");
            CallableStatement callSt = (CallableStatement) map1.get("callSt");
            ConnectDB.closeConnect(conn, callSt);
        }
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProductHot", listProductHot);
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listProvider", listProvider);
        model.getModelMap().put("listColor", listColor);
        model.getModelMap().put("url", url);
        return model;
    }

    /**
     * l???y chu???i ph??n trang
     *
     * @param page
     * @return
     */
    @RequestMapping(value = "getDataPagging")
    public ModelAndView getDataProductPagging(@RequestParam("page") String page) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        ModelAndView model = new ModelAndView("Fontend/Product");
        int pageInt = Integer.parseInt(page);
        int sizeRowofPage = 12;// s??? s???n ph???m tr??n 1 trang
        HashMap map1 = productModel.getDataPagination(pageInt, sizeRowofPage);
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();
        Map<Integer, List<Catalog>> map = new HashMap<Integer, List<Catalog>>();
        for (Catalog lsCatalog : listCatalog) {
            List<Catalog> list = catalogModel.getCatalogChild(lsCatalog.getCatalogId());
            map.put(lsCatalog.getCatalogId(), list);
        }
        String url = (String) map1.get("url");
        List<Product> listProduct = new ArrayList<>();
        try {
            ResultSet rs = (ResultSet) map1.get("rs");
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setCatalogId(rs.getInt("CatalogId"));
                product.setProductContent(rs.getString("ProductContent"));;
                product.setProductContentDetail(rs.getString("ProductContentDetail"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(Common.formatNumber(rs.getFloat("PriceInput")));
                product.setPriceOutput(Common.formatNumber(rs.getFloat("PriceOutput")));
                product.setQuantity(rs.getInt("Quantity"));
                product.setProviderId(rs.getInt("ProviderId"));
                product.setImages(rs.getString("Images"));
                product.setImageHover(rs.getString("ImageHover"));
                product.setDiscount(rs.getInt("Discount"));
                product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float) (100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                listProduct.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            Connection conn = (Connection) map1.get("conn");
            CallableStatement callSt = (CallableStatement) map1.get("callSt");
            ConnectDB.closeConnect(conn, callSt);
        }
        model.getModelMap().put("map", map);
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("url", url);
        return model;
    }

    /**
     * l???y danh s??ch s???n ph???m theo danh m???c s???n ph???m ??? trang ch???
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getProductByCatalog")
    public ModelAndView getProductByCatalogId(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/Product");
        List<Product> listProduct = productModel.getProductByCatalogId(id);
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();
        List<Provider> listProvider = providerModel.getAllProvider();//danh s??ch nh?? cung c???p hi???n th??? cho ph???n l???c theo th????ng hi???u
        List<Color> listColor = colorModel.getAllColor();//danh s??ch m??u s???c hi??n rthij cho ph???n l???c theo m??u s???c
        List<Product> listProductHot = productModel.getProductHot();// danh s??ch s???n ph??m n???i b???t
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        Map<Integer, List<Catalog>> map = new HashMap<Integer, List<Catalog>>();
        for (Catalog lsCatalog : listCatalog) {
            List<Catalog> list = catalogModel.getCatalogChild(lsCatalog.getCatalogId());
            map.put(lsCatalog.getCatalogId(), list);
        }
        model.getModelMap().put("map", map);
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listProductHot", listProductHot);
        model.getModelMap().put("listProvider", listProvider);
        model.getModelMap().put("listColor", listColor);
        return model;
    }

    /**
     * L???y danh s??ch s???n ph???m theo m?? danh m???c s???n ph???m
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getProduct")
    public ModelAndView getProduct(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/Pr");
        List<Product> listProduct = productModel.getProductByCatalogId(id);

        model.getModelMap().put("listProduct", listProduct);
        return model;
    }

    /**
     * l???y th??ng tin cho ti???t s???n ph???m cho trang chi ti???t
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "productDetail")
    public ModelAndView productDetail(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/ProductDetail");
        Product product = productModel.getProductById(id);
        List<Product> lsRefe = productModel.getProductRefsren(product);//danh s??ch s???n ph???m li??n quan(s???n ph???m c??ng danh muc)
        List<ImageLink> listImage = productModel.getImageProduct(id);//danh s??ch ???nh li??n quan, ???nh m?? t??? cho s???n ph???m
        List<ProductColor> listColor = productModel.getProductColor(id);//m??u s???c c???a s???n ph???m
        List<ProductSize> listSize = productModel.getProductSize(id);// danh s??ch k??ch th?????c c???a s???n ph???m
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        model.getModelMap().put("product", product);
        model.getModelMap().put("listImage", listImage);
        model.getModelMap().put("listColor", listColor);
        model.getModelMap().put("listSize", listSize);
        model.getModelMap().put("listRefe", lsRefe);
        return model;
    }

    /**
     * kh???i t???o ?????i t?????ng cho trang login
     *
     * @return
     */
    @RequestMapping(value = "initLoginFontend")
    public ModelAndView initLoginFontend() {
        ModelAndView model = new ModelAndView("Fontend/Login");
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        User user = new User();
        model.getModelMap().put("account", user);
        return model;
    }

    /**
     * L???y lai m???t kh???u
     *
     * @param email
     * @param mm
     * @return
     * @throws MessagingException
     */
    @RequestMapping(value = "recoverPassword")
    public String recoverPassword(@RequestParam("email") String email, ModelMap mm) throws MessagingException {
        ModelAndView model = new ModelAndView("Fontend/Login");
        User user = userModel.getUserByEmail(email);
        if (user != null) {
            try {
                EmailUtil.sendMail(email, "L???y l???i m???t kh???u", "B???n v??o link n??y ????? reset m???t kh???u");
                return "Fontend/RecoverPassword";
            } catch (Exception ex) {
                mm.put("message", "X??c nh???n kh??ng th??nh c??ng.");
                return "Fontend/Login";
            }
        } else {
            mm.put("message", "Email kh??ng ????ng.");
            return "Fontend/Login";
        }

    }

    /**
     *
     * @param password
     * @return
     */
    @RequestMapping(value = "confirmRecoverPassword")
    public ModelAndView confirmRecoverPassword(@RequestParam("password") String password) {
        ModelAndView model = new ModelAndView("");
        return model;
    }

    // 
    /**
     * th???c hi???n ki??m tra d??? li???u ????? login
     *
     * @param user ?????i t?????ng login
     * @param session phi??n l??m vi???c
     * @param mm
     * @return
     */
    @RequestMapping(value = "loginFontend")
    public String loginFontend(@ModelAttribute("account") User user, HttpSession session, ModelMap mm, HttpServletRequest request) {
        boolean result = userModel.checkLogin(user);
        String acction = request.getParameter("acction");
        if (result) {
            session.setAttribute("account", user.getUserName());
            if ("payment".equals(acction)) {
                return "redirect:myCart.htm";
            } else if ("package".equals(acction)) {
                return "redirect:initCreatePackage.htm";
            }
            if ("history".equals(acction)) {
                return "redirect:history.htm";
            } else if ("addPackage".equals(acction)) {
                return "redirect:initAddPackage.htm";
            }
            {
                return "redirect:homeFontend.htm";
            }
        } else {
            mm.put("message", "Sai th??ng tin ????ng nh???p.");
            return "Fontend/Login";
        }
    }

    @RequestMapping(value = "logoutFontend")
    public String logoutFontend(HttpSession session, ModelMap mm) {
        session.removeAttribute("account");
        return "redirect:homeFontend.htm";
    }

    /**
     * kh???i t???o ?????i t?????ng cho trang ????ng k??
     *
     * @return
     */
    @RequestMapping(value = "initResgiter")
    public ModelAndView initResgiterUser() {
        ModelAndView model = new ModelAndView("Fontend/Resgiter");
        User user = new User();
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        model.getModelMap().put("resgiter", user);
        return model;
    }

    /**
     * th???c hi???n l???y d??? li???u ????? ????ng k?? ng?????i d??ng
     *
     * @param user
     * @param mm
     * @param request
     * @param session
     * @return
     * @throws MessagingException
     */
    @RequestMapping(value = "resgiter")
    public ModelAndView resgiterUser(@ModelAttribute("resgiter") User user, ModelMap mm, HttpServletRequest request, HttpSession session) throws MessagingException {
        ModelAndView model = new ModelAndView("Fontend/ConfirmResgiter");
        if (userModel.checkUserName(user.getUserName())) {
            mm.put("message", "T??n ????ng nh???p ???? ???????c d??ng. B???n vui l??ng ??i???n t??n kh??c ????? ????ng k??.");
            model = new ModelAndView("Fontend/Resgiter");
        } else if (userModel.checkUserEmail(user.getEmail())) {
            mm.put("message", "Email ???? ???????c d??ng ????? ????ng k??.");
            return new ModelAndView("Fontend/Resgiter");
        } else {

            boolean result = userModel.insertAccount(user);
            if (result) {
                int id = userModel.getUserIdNew();
                packageModel.insertPackage(user.getUserName(), id);
                String content = "<div><p>T??n ????ng nh???p:</p>" + user.getUserName() + "<br> <p>Email:</p>" + user.getEmail() + "<br> ?????a ch???:" + user.getAddress() + " <br><p>S??? ??i???n tho???i:</p>" + user.getPhone() + "</div>";
                EmailUtil.sendMail(user.getEmail(), "Website b??n qu???n ??o. X??c nh???n ????ng k?? t??i kho???n.", "C???m ??n b???n ???? ????ng k?? t??i kho???n c???a ch??ng t??i.????y l?? th??ng tin t??i kho???n c???a b???n: " + content);
                session.setAttribute("account", user.getUserName());
            } else {
                model = new ModelAndView("Fontend/Error");
            }
        }
        return model;

    }

    /**
     * hi???n th??? trang gi???i thi???u
     *
     * @return
     */
    @RequestMapping(value = "about")
    public ModelAndView aboutFontend() {
        ModelAndView model = new ModelAndView("Fontend/About");
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        List<Provider> listProvider = providerModel.getAllProvider();
        List<Color> listColor = colorModel.getAllColor();
        List<Product> listProductHot = productModel.getProductHot();

        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProductHot", listProductHot);
        model.getModelMap().put("listCatalogPost", listCatalogPost);

        model.getModelMap().put("listProvider", listProvider);
        model.getModelMap().put("listColor", listColor);
        return model;
    }

    /**
     * hi??n th??? d??? li???u trang li??n h???
     *
     * @return
     */
    @RequestMapping(value = "contact")
    public ModelAndView contactFontend() {
        ModelAndView model = new ModelAndView("Fontend/Contact");
        Feeback feeback = new Feeback();
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();

        List<Provider> listProvider = providerModel.getAllProvider();
        List<Color> listColor = colorModel.getAllColor();
        List<Product> listProductHot = productModel.getProductHot();
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProductHot", listProductHot);

        model.getModelMap().put("listProvider", listProvider);
        model.getModelMap().put("listColor", listColor);
        model.getModelMap().put("feeback", feeback);
        return model;
    }

    /**
     *
     * @param feeback
     * @param mm
     * @return
     */
    @RequestMapping(value = "confirmFeeback")
    public String confirmFeeback(@ModelAttribute("feeback") Feeback feeback, ModelMap mm) {
        boolean result = feebackModel.insertFeeback(feeback);
        if (result) {
            return "redirect:contact.htm";
        } else {
            mm.put("tb", "G???i ph???n h???i kh??ng th??nh c??ng vui lang th??? l???i.");
            return "redirect:contact.htm";
        }
    }

    /**
     * x??? l?? khi click v??o button thanh to??n
     *
     * @param session
     * @param mm
     * @return
     */
    @RequestMapping(value = "initPayment")
    public ModelAndView initCheckOut(HttpSession session, ModelMap mm) {
        ModelAndView model;
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        float paymentAmount = (float) getTotal(listCart);
        String name = (String) session.getAttribute("account");
        if (name != null) {
            model = new ModelAndView("Fontend/CheckOut");
            List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
            model.getModelMap().put("listCatalogPost", listCatalogPost);
            User user = userModel.getUserByUserName(session.getAttribute("account").toString());
            Payment payment = new Payment();
            model.getModelMap().put("us", user);
            model.getModelMap().put("payment", payment);
            model.getModel().put("total", Common.formatNumber(paymentAmount));

            return model;
        } else {
            model = new ModelAndView("Fontend/Login");
            mm.put("tb", "B???n ch??a ????ng nh???p, ????ng nh???p ????? ti???p t???c mua h??ng.");
            List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
            model.getModelMap().put("listCatalogPost", listCatalogPost);
            User account = new User();
            model.getModelMap().put("account", account);
            model.getModelMap().put("acction", "payment");
            return model;

        }

    }

    /**
     * x??? l?? insert d?? li???u tr?????c khi thanh to??n
     *
     * @param request
     * @param session
     * @param payment
     * @return
     */
    @RequestMapping(value = "prePayment")
    public ModelAndView prePayment(HttpServletRequest request, HttpSession session, @ModelAttribute("payment") Payment payment) {
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        ModelAndView model;
        String userName = (String) session.getAttribute("account");
        User us = userModel.getUserByUserName(userName);
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        float total = Common.convertToFloat(request.getParameter("total"));

        Order order = new Order();
        order.setTotalAmount(Common.formatNumber(total));
        order.setUserId(us.getUserId());
        boolean result = false;
        if (name != "" && phone != "" && address != "") {
            order.setOrderName(name);
            //order.setOrderNumber();
            order.setPhone(phone);
            order.setAddress(address);
            order.setTotalAmount(Common.formatNumber(total));
            order.setUserId(us.getUserId());
            result = orderModel.insertOrder(order);
        } else {
            order.setOrderName(userName);
            order.setPhone(us.getPhone());
            order.setAddress(us.getAddress());
            order.setEmail(us.getEmail());
            order.setUserId(us.getUserId());
            result = orderModel.insertOrder(order);
        }

        if (result) {
            int orderId = orderModel.getOrderIdNew();
            for (Cart listCart1 : listCart) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(orderId);
                orderDetail.setProductId(listCart1.getProduct().getProductId());
                productModel.updateBuyItem(listCart1.getProduct().getProductId());
                orderDetail.setProductName(listCart1.getProduct().getProductName());
                orderDetail.setNote(listCart1.getNote());
                if (listCart1.getProduct().getDiscount() == 0) {
                    orderDetail.setPrice(listCart1.getProduct().getPriceOutput());
                } else {
                    orderDetail.setPrice(listCart1.getProduct().getPriceDiscount());
                }
                orderDetail.setQuantity(listCart1.getQuantity());
                orderDetail.setAmount(Common.formatNumber(Common.convertToFloat(orderDetail.getPrice()) * listCart1.getQuantity()));
                boolean k = orderModel.insertOrderDetail(orderDetail);
            }

            model = new ModelAndView("Fontend/CheckOut2");
            List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
            model.getModelMap().put("listCatalogPost", listCatalogPost);
            model.getModelMap().put("Id", orderId);
            return model;

        } else {
            return new ModelAndView("Fontend/Error");
        }

    }

    /**
     * th???c hi???n thanh to??n
     *
     * @param payment
     * @param request
     * @param session
     * @param mm
     * @return
     * @throws MessagingException
     */
    @RequestMapping(value = "/payment")
    public ModelAndView payment(@ModelAttribute("payment") Payment payment, HttpServletRequest request, HttpSession session, ModelMap mm) throws MessagingException {
        String merchantName = "WebQuanAo";
        String method = request.getParameter("method");
        String accName = request.getParameter("accountName");
        String accNumber = request.getParameter("accountNumber");
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        String b = "<table border ='1'><thead><tr><th>T??n s???n ph???m</th> <th></th><th>Gi??</th><th>S??? l?????ng</th> <th>T???ng</th></tr> </thead> <tbody>";
        for (Cart listCart1 : listCart) {
            b = b + "<tr> <td>" + listCart1.getProduct().getProductName() + "</td>";
            b = b + " <td>" + listCart1.getNote() + "</td>";
            if (listCart1.getProduct().getDiscount() == 0) {
                b = b + "<td>" + listCart1.getProduct().getPriceOutput() + "</td>";
                b = b + "<td>" + listCart1.getQuantity() + "</td>";
                b = b + "<td>" + Common.fomatMonney(Common.convertToFloat(listCart1.getProduct().getPriceOutput()) * listCart1.getQuantity()) + " </td>";
            } else {
                b = b + "<td>" + listCart1.getProduct().getPriceDiscount() + "</td>";
                b = b + "<td>" + listCart1.getQuantity() + "</td>";
                b = b + "<td>" + Common.fomatMonney(Common.convertToFloat(listCart1.getProduct().getPriceDiscount()) * listCart1.getQuantity()) + "</td>";
            }
            b = b + "</tr>";

        }
        b = b + "</tbody></table>" + "Ti???n ship: 40.000?? <br/>" + "T???ng c???ng:" + Common.fomatMonney(getTotal(listCart) + 40000);
        float paymentAmount = Common.convertToFloat((String) session.getAttribute("total"));
        ModelAndView model = null;
        String name = (String) session.getAttribute("account");
        User us = userModel.getUserByUserName(name);
        int orderId = orderModel.getOrderIdNewByUserId(us.getUserId());
        if ("bank".equals(method)) {
            orderModel.updatePaymentMethod(orderId, "Th??? ng??n h??ng");
            String returnSt = checkOrder(merchantName, accNumber, accName, paymentAmount);
            String arraySt[] = returnSt.split("#");
            String returnCode = arraySt[0];
            int transactionId = Integer.parseInt(arraySt[1]);
            if (returnCode.equals("00")) {
                String returnCodeFinish = finishOrder(transactionId, merchantName);
                if (returnCodeFinish.equals("00")) {
                    session.removeAttribute("listCart");
                    session.removeAttribute("total");
                    request.setAttribute("messageSuc", "Thanh to??n th??nh c??ng!");
                    model = new ModelAndView("Fontend/PaymentSuccess");
                    EmailUtil.sendMail(us.getEmail(), "Web qu???n ??o. X??c nh???n ????n h??ng", "Thanh to??n th??nh c??ng c???m ??n b???n ???? s??? d???ng d???ch v??? c???a ch??ng t??i. N???i dung ????n h??ng c???a b???n" + b);

                } else {
                    model = new ModelAndView("Fontend/PaymentFail");
                }

            } else if (returnCode.equals("02")) {
                request.setAttribute("messageBank", "Th??ng tin t??i kho???n kh??ng ????ng");
                model = new ModelAndView("Fontend/CheckOut2");
            } else {
                request.setAttribute("messageBank", "T??i kho???n kh??ng ????? ti???n");
                model = new ModelAndView("Fontend/CheckOut2");
            }

        } else if ("cod".equals(method)) {
            orderModel.updatePaymentMethod(orderId, "Thanh to??n tr???c ti???p khi nh???n h??ng");
            orderModel.updateOrder(orderId);

            request.setAttribute("messageSuc", "?????t h??ng th??nh c??ng!");
            EmailUtil.sendMail(us.getEmail(), "Web qu???n ??o. X??c nh???n ?????t h??ng", "?????t h??ng th??nh c??ng. C???m ??n b???n ???? s??? d???ng d???ch v??? c???a ch??ng t??i.????n h??ng c???a b???n" + b);
            session.removeAttribute("listCart");
            session.removeAttribute("total");
            model = new ModelAndView("Fontend/PaymentSuccess");

        } else if ("package".equals(method)) {
            orderModel.updatePaymentMethod(orderId, "V?? ??i???n t???");
            Packages pa = packageModel.getPackageByUserId(us.getUserId());
            boolean result = packageModel.checkPackage(pa.getPackageName(), paymentAmount);
            if (result) {
                boolean kq = packageModel.finishPackage(name, paymentAmount);
                if (kq) {
                    session.removeAttribute("listCart");
                    session.removeAttribute("total");
                    mm.put("messageSuc", "C???m ??n b???n ???? mua h??ng. Ch??ng t??i s??? giao h??ng trong th???i gian s???m nh???t");
                    request.setAttribute("email", us.getEmail());

                    EmailUtil.sendMail(us.getEmail(), "Web qu???n ??o. X??c nh???n ????n h??ng", "Mua h??ng th??nh c??ng. C???m ??n b???n ???? s??? d???ng d???ch v??? c???a ch??ng t??i.????n hnagf c???u b???n." + b);
                    model = new ModelAndView("Fontend/PaymentSuccess");
                } else {
                    model = new ModelAndView("Fontend/Error");
                }
            } else {
                mm.put("messagePackage", "V?? kh??ng ????? ti???n thanh to??n.");
                model = new ModelAndView("Fontend/CheckOut2");
            }
        }

        return model;
    }

    /**
     *
     * T??nh t???ng ti???n trong gi??? h??ng
     *
     * @param listCart
     * @return
     */
    public float getTotal(List<Cart> listCart) {
        float total = 0;
        for (Cart c : listCart) {
            if (c.getProduct().getDiscount() == 0) {
                total += c.getQuantity() * Common.convertToFloat(c.getProduct().getPriceOutput());
            } else {
                total += c.getQuantity() * Common.convertToFloat(c.getProduct().getPriceDiscount());
            }

        }
        return total;
    }

    /**
     * update l?????t view
     *
     * @param id
     */
    @RequestMapping(value = "/updateView")
    public void updateView(@RequestParam("Id") int id) {
        boolean result = false;
        result = productModel.updateView(id);
    }

    /**
     * update l?????t mua
     *
     * @param id
     */
    @RequestMapping(value = "/updateBuyItem")
    public void updateBuyItem(@RequestParam("Id") int id) {
        boolean result = false;
        result = productModel.updateBuyItem(id);
    }

    /**
     * t??m ki???m s???n ph???m theo t??n s???n ph???m
     *
     * @param name
     * @return
     */
    @RequestMapping(value = "search.htm")
    public ModelAndView searchProduct(@RequestParam("query") String name) {
        ModelAndView model = new ModelAndView("Fontend/Product");
        List<Product> listProduct = productModel.serachProduct(name);
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();
        List<Provider> listProvider = providerModel.getAllProvider();
        List<Color> listColor = colorModel.getAllColor();
        List<Product> listProductHot = productModel.getProductHot();
        Map<Integer, List<Catalog>> map = new HashMap<Integer, List<Catalog>>();
        for (Catalog lsCatalog : listCatalog) {
            List<Catalog> list = catalogModel.getCatalogChild(lsCatalog.getCatalogId());
            map.put(lsCatalog.getCatalogId(), list);
        }
        model.getModelMap().put("map", map);
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listProductHot", listProductHot);
        model.getModelMap().put("listColor", listColor);
        model.getModelMap().put("listProvider", listProvider);
        return model;
    }

    /**
     * T??m ki???m s???n ph???m theo m??u s???c
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getProductByColor")
    public ModelAndView getProductByColor(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/Pr");
        List<Product> listProduct = productModel.searchProductByColor(id);
        model.getModelMap().put("listProduct", listProduct);
        return model;
    }

    /**
     * T??m ki???m s???n ph???m theo nh?? cung c???p
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getProductByProvider")
    public ModelAndView getProductByProvider(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/Pr");
        List<Product> listProduct = productModel.searchProductByProvider(id);
        model.getModelMap().put("listProduct", listProduct);
        return model;
    }

    /**
     * t??m ki???m s???n ph???m theo gi?? t??? a ?????n b
     *
     * @param priceFrom
     * @param priceTo
     * @return
     */
    @RequestMapping(value = "searchPrice")
    public ModelAndView searchProductByPrice(@RequestParam(value = "priceFrom") String priceFrom, @RequestParam(value = "priceTo") String priceTo) {
        ModelAndView model = new ModelAndView("Fontend/Pr");
        float from = Float.parseFloat(priceFrom);
        float to = Float.parseFloat(priceTo);
        List<Product> listProduct = productModel.searchProductByPrice(from, to);
        model.getModelMap().put("listProduct", listProduct);
        return model;
    }

    /**
     * L???y danh s??ch s???n ph???m khuy???n m??i
     *
     * @return
     */
    @RequestMapping(value = "getProductShare")
    public ModelAndView getProductShare() {
        ModelAndView model = new ModelAndView("Fontend/Product");
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();

        List<Provider> listProvider = providerModel.getAllProvider();
        List<Color> listColor = colorModel.getAllColor();
        List<Product> listProductHot = productModel.getProductHot();
        List<Product> listProduct = productModel.getProductShare();
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProductHot", listProductHot);
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listProvider", listProvider);
        model.getModelMap().put("listColor", listColor);
        return model;
    }

    /**
     * TRang tin t???c
     *
     * @return
     */
    @RequestMapping(value = "getPost")
    public ModelAndView getPost() {
        ModelAndView model = new ModelAndView("Fontend/New");
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        List<Post> listPost = postModel.getAllPost();
        List<Product> listProduct = productModel.getProductHot();
        model.getModel().put("listProduct", listProduct);
        model.getModelMap().put("listCatalogPost", listCatalogPost);

        model.getModelMap().put("listPost", listPost);
        return model;
    }

    /**
     * l???y danh s??ch tin t???c theo m?? tin t???c
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getPostByCatalogId")
    public ModelAndView getPostByCatalogId(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/New");
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        List<Post> listPost = postModel.getAllPostByCatalogPostId(id);
        List<Product> listProduct = productModel.getProductHot();
        List<Post> listPostNew = postModel.getPostNew();
        model.getModelMap().put("listPostNew", listPostNew);
        model.getModel().put("listProduct", listProduct);
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        model.getModelMap().put("listPost", listPost);
        return model;
    }

    /**
     * L???y th??m th??ng tin chi ti???t
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getPostDetail")
    public ModelAndView getPostDetail(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/NewDetail");
        Post post = postModel.getPostById(id);
        List<Product> listProduct = productModel.getProductHot();
        List<Post> listPostNew = postModel.getPostNew();
        List<Post> listPostRef = postModel.getPostRef(id, post.getCatalogPostId());
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        model.getModelMap().put("listPostRef", listPostRef);
        model.getModelMap().put("listPostNew", listPostNew);
        model.getModel().put("listProduct", listProduct);

        model.getModelMap().put("post", post);
        return model;
    }

    /**
     * Trang th??ng tin t??i kho???n ng?????i d??ng
     *
     * @param session
     * @param mm
     * @return
     */
    @RequestMapping(value = "myAccount")
    public ModelAndView myAccount(HttpSession session, ModelMap mm) {
        ModelAndView model;
        String name = (String) session.getAttribute("account");
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        if (name != null) {
            model = new ModelAndView("Fontend/MyAccount");
            User user = userModel.getUserByUserName(name);
            model.getModelMap().put("listCatalogPost", listCatalogPost);
            model.getModelMap().put("myAccount", user);
            return model;
        } else {
            model = new ModelAndView("Fontend/Login");
            mm.put("tb", "B???n ch??a ????ng nh???p, ????ng nh???p ????? ti???p t???c.");
            User account = new User();
            model.getModelMap().put("account", account);
            model.getModelMap().put("action", "myAccount");
            return model;
        }

    }

    /**
     * X??? li khi ng?????i ng?????i mu???n s???a th??ng tin
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "initUpdateAccount")
    public ModelAndView initUpdateAccount(HttpSession session) {
        ModelAndView model = new ModelAndView("Fontend/UpdateAccount");
        String name = (String) session.getAttribute("account");
        User user = userModel.getUserByUserName(name);
        model.getModelMap().put("updateAccount", user);
        return model;
    }

    /**
     * S???a th??ng tin ng?????i d??ng
     *
     * @param user
     * @param mm
     * @param session
     * @return
     */
    @RequestMapping(value = "updateAccount")
    public String updateAccount(@ModelAttribute("updateAccount") User user, ModelMap mm, HttpSession session) {
        boolean result = userModel.updateAccount(user);
        if (result) {
            User us = userModel.getUserByUserName(user.getUserName());
            //session.setAttribute("account", us.getUserName());
            return "redirect:myAccount.htm";
        } else {
            return "Fontend/Error";
        }
    }

    /**
     * X??? l?? khi n???p ti???n v??o v??
     *
     * @param session
     * @param mm
     * @return
     */
    @RequestMapping(value = "intAddPackage")
    public ModelAndView intAddPackage(HttpSession session, ModelMap mm) {
        String name = (String) session.getAttribute("account");
        ModelAndView model;
        if (!"".equals(name)) {
            model = new ModelAndView("Fontend/AddPackage");
            Card card = new Card();
            model.getModelMap().put("card", card);

        } else {
            model = new ModelAndView("Fontend/Login");
            mm.put("tb", "B???n ch??a ????ng nh???p, ????ng nh???p ????? ti???p t???c t???o v?? ti???n.");
            User account = new User();
            model.getModelMap().put("account", account);
            model.getModelMap().put("acction", "addPackage");
        }

        return model;
    }

    /**
     * Xem l???ch s??? ????n h??ng
     *
     * @param session
     * @param mm
     * @return
     */
    @RequestMapping(value = "history.htm")
    public ModelAndView getOrderByUserId(HttpSession session, ModelMap mm) {
        ModelAndView model;
        String name = (String) session.getAttribute("account");
        if (name != null) {
            User us = userModel.getUserByUserName(name);
            model = new ModelAndView("Fontend/ListOrder");
            List<Order> listOrder = orderModel.getOrderByUserId(us.getUserId());
            model.getModelMap().put("listOrder", listOrder);

        } else {
            model = new ModelAndView("Fontend/Login");
            mm.put("tb", "B???n ch??a ????ng nh???p, ????ng nh???p ????? xem l???ch s??? mua h??ng.");
            User account = new User();
            model.getModelMap().put("account", account);
            model.getModelMap().put("acction", "history");

        }
        return model;
    }

    /**
     * L???y ????n h??ng chi ti???t
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getOrderDetail")
    public ModelAndView getOrderDetail(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/OrderDetail");
        List<OrderDetail> listOrderDetail = orderModel.getOderDetailById(id);
        model.getModelMap().put("listOrderDetail", listOrderDetail);
        return model;
    }

    /**
     * N???p ti???n v??o v??
     *
     * @param card
     * @param session
     * @param mm
     * @return
     */
    @RequestMapping(value = "addPackage")
    public String addPackage(@ModelAttribute("card") Card card, HttpSession session, ModelMap mm) {
        String name = (String) session.getAttribute("account");
        User us = userModel.getUserByUserName(name);
        Card ca = cardModel.getCardByCardNumber(card.getCardNumber());
        if (ca != null) {
            Packages pa = packageModel.getPackageByUserId(us.getUserId());
            packageModel.addMoneyPackage(ca.getPriceUnit(), pa.getPackageId());
            mm.put("message", "N???p ti???n th??nh c??ng");

            return "redirect: initAddPackage.htm";
        } else {
            mm.put("message", "M?? th??? kh??ng h???p l???");

            return "redirect: initAddPackage.htm";
        }
    }

    /**
     * Gi??? h??ng
     *
     * @param session
     * @param mm
     * @return
     */
    @RequestMapping(value = "youCart")
    public ModelAndView myCart(HttpSession session, ModelMap mm) {
        ModelAndView model = new ModelAndView("MyCart");
        List<Cart> listCart = (ArrayList<Cart>) session.getAttribute("listCart");
        if (listCart == null) {
            mm.put("message", "Ch??a c?? s???n ph???m trong gi??? h??ng");
        } else {
            model.getModelMap().put("list", listCart);
        }

        return model;
    }

    /**
     * Ki???m tra th??ng tin t??i kho???n ng??n h??ng khi thanh to??n tr???c tuy???n
     *
     * @param merchantName
     * @param accNo
     * @param accName
     * @param playmentAmount
     * @return
     */
    private static String checkOrder(java.lang.String merchantName, java.lang.String accNo, java.lang.String accName, float playmentAmount) {
        ws.PaymentWebservice_Service service = new ws.PaymentWebservice_Service();
        ws.PaymentWebservice port = service.getPaymentWebservicePort();
        return port.checkOrder(merchantName, accNo, accName, playmentAmount);
    }

    /**
     * Ti???n h??nh thanh to??n
     *
     * @param transachtionId
     * @param merchantName
     * @return
     */
    private static String finishOrder(int transachtionId, java.lang.String merchantName) {
        ws.PaymentWebservice_Service service = new ws.PaymentWebservice_Service();
        ws.PaymentWebservice port = service.getPaymentWebservicePort();
        return port.finishOrder(transachtionId, merchantName);
    }

}
