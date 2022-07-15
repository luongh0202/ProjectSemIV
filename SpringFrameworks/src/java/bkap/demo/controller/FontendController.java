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
     * lấy danh sách toàn bộ sản phẩm
     *
     * @return
     */
    @RequestMapping(value = "getAllProduct")
    public ModelAndView getDataProduct() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        ModelAndView model = new ModelAndView("Fontend/Product");
        int sizeRowofPage = 12;//số sản phâm rtreen 1 trang

        HashMap map1 = productModel.getDataPagination(1, sizeRowofPage);
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();//danh sách danh mục cha hiện thị menu trái

        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        List<Color> listColor = colorModel.getAllColor();//danh sách màu sắc hiên rthij cho phần lọc theo màu sắc
        List<Product> listProductHot = productModel.getProductHot();// danh sách sản phâm nổi bật
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();

        String url = (String) map1.get("url");//chuỗi phân trang
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
     * lấy chuỗi phân trang
     *
     * @param page
     * @return
     */
    @RequestMapping(value = "getDataPagging")
    public ModelAndView getDataProductPagging(@RequestParam("page") String page) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        ModelAndView model = new ModelAndView("Fontend/Product");
        int pageInt = Integer.parseInt(page);
        int sizeRowofPage = 12;// số sản phẩm trên 1 trang
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
     * lấy danh sách sản phẩm theo danh mục sản phẩm ở trang chủ
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getProductByCatalog")
    public ModelAndView getProductByCatalogId(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/Product");
        List<Product> listProduct = productModel.getProductByCatalogId(id);
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        List<Color> listColor = colorModel.getAllColor();//danh sách màu sắc hiên rthij cho phần lọc theo màu sắc
        List<Product> listProductHot = productModel.getProductHot();// danh sách sản phâm nổi bật
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
     * Lấy danh sách sản phẩm theo mã danh mục sản phẩm
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
     * lấy thông tin cho tiết sản phẩm cho trang chi tiết
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "productDetail")
    public ModelAndView productDetail(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/ProductDetail");
        Product product = productModel.getProductById(id);
        List<Product> lsRefe = productModel.getProductRefsren(product);//danh sách sản phẩm liên quan(sản phẩm cùng danh muc)
        List<ImageLink> listImage = productModel.getImageProduct(id);//danh sách ảnh liên quan, ảnh mô tả cho sản phảm
        List<ProductColor> listColor = productModel.getProductColor(id);//màu sắc của sản phẩm
        List<ProductSize> listSize = productModel.getProductSize(id);// danh sách kích thước của sản phẩm
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
     * khởi tạo đối tượng cho trang login
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
     * Lấy lai mật khẩu
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
                EmailUtil.sendMail(email, "Lấy lại mật khẩu", "Bạn vào link này để reset mật khẩu");
                return "Fontend/RecoverPassword";
            } catch (Exception ex) {
                mm.put("message", "Xác nhận không thành công.");
                return "Fontend/Login";
            }
        } else {
            mm.put("message", "Email không đúng.");
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
     * thực hiển kiêm tra dữ liệu để login
     *
     * @param user đối tượng login
     * @param session phiên làm việc
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
            mm.put("message", "Sai thông tin đăng nhập.");
            return "Fontend/Login";
        }
    }

    @RequestMapping(value = "logoutFontend")
    public String logoutFontend(HttpSession session, ModelMap mm) {
        session.removeAttribute("account");
        return "redirect:homeFontend.htm";
    }

    /**
     * khời tạo đối tượng cho trang đăng kí
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
     * thực hiện lấy dữ liệu để đăng kí người dùng
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
            mm.put("message", "Tên đăng nhập đã được dùng. Bạn vui làng điền tên khác để đăng kí.");
            model = new ModelAndView("Fontend/Resgiter");
        } else if (userModel.checkUserEmail(user.getEmail())) {
            mm.put("message", "Email đã được dùng để đăng kí.");
            return new ModelAndView("Fontend/Resgiter");
        } else {

            boolean result = userModel.insertAccount(user);
            if (result) {
                int id = userModel.getUserIdNew();
                packageModel.insertPackage(user.getUserName(), id);
                String content = "<div><p>Tên đăng nhập:</p>" + user.getUserName() + "<br> <p>Email:</p>" + user.getEmail() + "<br> Địa chỉ:" + user.getAddress() + " <br><p>Số điện thoại:</p>" + user.getPhone() + "</div>";
                EmailUtil.sendMail(user.getEmail(), "Website bán quần áo. Xác nhận đăng kí tài khoản.", "Cảm ơn bạn đã đăng kí tài khoản của chúng tôi.Đây là thông tin tài khoản của bạn: " + content);
                session.setAttribute("account", user.getUserName());
            } else {
                model = new ModelAndView("Fontend/Error");
            }
        }
        return model;

    }

    /**
     * hiện thị trang giới thiệu
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
     * hiên thị dữ liệu trang liên hệ
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
            mm.put("tb", "Gửi phản hồi không thành công vui lang thử lại.");
            return "redirect:contact.htm";
        }
    }

    /**
     * xử lí khi click vào button thanh toán
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
            mm.put("tb", "Bạn chưa đăng nhập, đăng nhập để tiếp tục mua hàng.");
            List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
            model.getModelMap().put("listCatalogPost", listCatalogPost);
            User account = new User();
            model.getModelMap().put("account", account);
            model.getModelMap().put("acction", "payment");
            return model;

        }

    }

    /**
     * xứ lí insert dũ liệu trước khi thanh toán
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
     * thực hiện thanh toán
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
        String b = "<table border ='1'><thead><tr><th>Tên sản phẩm</th> <th></th><th>Giá</th><th>Số lượng</th> <th>Tổng</th></tr> </thead> <tbody>";
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
        b = b + "</tbody></table>" + "Tiền ship: 40.000đ <br/>" + "Tổng cộng:" + Common.fomatMonney(getTotal(listCart) + 40000);
        float paymentAmount = Common.convertToFloat((String) session.getAttribute("total"));
        ModelAndView model = null;
        String name = (String) session.getAttribute("account");
        User us = userModel.getUserByUserName(name);
        int orderId = orderModel.getOrderIdNewByUserId(us.getUserId());
        if ("bank".equals(method)) {
            orderModel.updatePaymentMethod(orderId, "Thẻ ngân hàng");
            String returnSt = checkOrder(merchantName, accNumber, accName, paymentAmount);
            String arraySt[] = returnSt.split("#");
            String returnCode = arraySt[0];
            int transactionId = Integer.parseInt(arraySt[1]);
            if (returnCode.equals("00")) {
                String returnCodeFinish = finishOrder(transactionId, merchantName);
                if (returnCodeFinish.equals("00")) {
                    session.removeAttribute("listCart");
                    session.removeAttribute("total");
                    request.setAttribute("messageSuc", "Thanh toán thành công!");
                    model = new ModelAndView("Fontend/PaymentSuccess");
                    EmailUtil.sendMail(us.getEmail(), "Web quần áo. Xác nhận đơn hàng", "Thanh toán thành công cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Nội dung đơn hàng của bạn" + b);

                } else {
                    model = new ModelAndView("Fontend/PaymentFail");
                }

            } else if (returnCode.equals("02")) {
                request.setAttribute("messageBank", "Thông tin tài khoản không đúng");
                model = new ModelAndView("Fontend/CheckOut2");
            } else {
                request.setAttribute("messageBank", "Tài khoản không đủ tiền");
                model = new ModelAndView("Fontend/CheckOut2");
            }

        } else if ("cod".equals(method)) {
            orderModel.updatePaymentMethod(orderId, "Thanh toán trực tiếp khi nhận hàng");
            orderModel.updateOrder(orderId);

            request.setAttribute("messageSuc", "Đặt hàng thành công!");
            EmailUtil.sendMail(us.getEmail(), "Web quần áo. Xác nhận đặt hàng", "Đặt hàng thành công. Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.Đơn hàng của bạn" + b);
            session.removeAttribute("listCart");
            session.removeAttribute("total");
            model = new ModelAndView("Fontend/PaymentSuccess");

        } else if ("package".equals(method)) {
            orderModel.updatePaymentMethod(orderId, "Ví điện tử");
            Packages pa = packageModel.getPackageByUserId(us.getUserId());
            boolean result = packageModel.checkPackage(pa.getPackageName(), paymentAmount);
            if (result) {
                boolean kq = packageModel.finishPackage(name, paymentAmount);
                if (kq) {
                    session.removeAttribute("listCart");
                    session.removeAttribute("total");
                    mm.put("messageSuc", "Cảm ơn bạn đã mua hàng. Chúng tôi sẽ giao hàng trong thời gian sớm nhất");
                    request.setAttribute("email", us.getEmail());

                    EmailUtil.sendMail(us.getEmail(), "Web quần áo. Xác nhận đơn hàng", "Mua hàng thành công. Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.Đơn hnagf cảu bạn." + b);
                    model = new ModelAndView("Fontend/PaymentSuccess");
                } else {
                    model = new ModelAndView("Fontend/Error");
                }
            } else {
                mm.put("messagePackage", "Ví không đủ tiền thanh toán.");
                model = new ModelAndView("Fontend/CheckOut2");
            }
        }

        return model;
    }

    /**
     *
     * Tính tổng tiền trong giỏ hàng
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
     * update lượt view
     *
     * @param id
     */
    @RequestMapping(value = "/updateView")
    public void updateView(@RequestParam("Id") int id) {
        boolean result = false;
        result = productModel.updateView(id);
    }

    /**
     * update lượt mua
     *
     * @param id
     */
    @RequestMapping(value = "/updateBuyItem")
    public void updateBuyItem(@RequestParam("Id") int id) {
        boolean result = false;
        result = productModel.updateBuyItem(id);
    }

    /**
     * tìm kiếm sản phẩm theo tên sản phẩm
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
     * Tìm kiếm sản phẩm theo màu sắc
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
     * Tìm kiếm sản phẩm theo nhà cung cấp
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
     * tìm kiểm sản phẩm theo giá từ a đến b
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
     * Lấy danh sách sản phẩm khuyến mãi
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
     * TRang tin tức
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
     * lấy danh sách tin tức theo mã tin tức
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
     * Lấy thêm thông tin chi tiết
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
     * Trang thông tin tài khoản người dùng
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
            mm.put("tb", "Bạn chưa đăng nhập, đăng nhập để tiếp tục.");
            User account = new User();
            model.getModelMap().put("account", account);
            model.getModelMap().put("action", "myAccount");
            return model;
        }

    }

    /**
     * Xử li khi người người muốn sửa thông tin
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
     * Sửa thông tin người dùng
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
     * Xử lí khi nạp tiền vào ví
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
            mm.put("tb", "Bạn chưa đăng nhập, đăng nhập để tiếp tục tạo ví tiền.");
            User account = new User();
            model.getModelMap().put("account", account);
            model.getModelMap().put("acction", "addPackage");
        }

        return model;
    }

    /**
     * Xem lịch sử đơn hàng
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
            mm.put("tb", "Bạn chưa đăng nhập, đăng nhập để xem lịch sủ mua hàng.");
            User account = new User();
            model.getModelMap().put("account", account);
            model.getModelMap().put("acction", "history");

        }
        return model;
    }

    /**
     * Lấy đơn hàng chi tiết
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
     * Nạp tiền vào ví
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
            mm.put("message", "Nạp tiền thành công");

            return "redirect: initAddPackage.htm";
        } else {
            mm.put("message", "Mã thẻ không hợp lệ");

            return "redirect: initAddPackage.htm";
        }
    }

    /**
     * Giỏ hàng
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
            mm.put("message", "Chưa có sản phẩm trong giỏ hàng");
        } else {
            model.getModelMap().put("list", listCart);
        }

        return model;
    }

    /**
     * Kiểm tra thông tin tài khoản ngân hàng khi thanh toán trực tuyến
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
     * Tiến hành thanh toán
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
