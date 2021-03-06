/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.controller;

import bkap.demo.entities.Banner;
import bkap.demo.entities.Card;
import bkap.demo.entities.Catalog;
import bkap.demo.entities.CatalogPost;
import bkap.demo.entities.Color;
import bkap.demo.entities.Feeback;
import bkap.demo.entities.Function;
import bkap.demo.entities.Group;
import bkap.demo.entities.ImageLink;
import bkap.demo.entities.Order;
import bkap.demo.entities.OrderDetail;
import bkap.demo.entities.Packages;
import bkap.demo.entities.PaymentType;
import bkap.demo.entities.Post;
import bkap.demo.entities.Product;
import bkap.demo.entities.Provider;
import bkap.demo.entities.Size;
import bkap.demo.entities.User;
import bkap.demo.model.BannerModel;
import bkap.demo.model.CardModel;
import bkap.demo.model.CatalogModel;
import bkap.demo.model.ColorModel;
import bkap.demo.model.FeebackModel;
import bkap.demo.model.FunctionModel;
import bkap.demo.model.GroupModel;
import bkap.demo.model.OrderModel;
import bkap.demo.model.PackageModel;
import bkap.demo.model.PaymentTypeModel;
import bkap.demo.model.PostModel;
import bkap.demo.model.ProductModel;
import bkap.demo.model.ProviderModel;
import bkap.demo.model.SizeModel;
import bkap.demo.model.UserModel;
import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
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
public class BackendController {
    private ColorModel colorModel;
    private ProductModel productModel;
    private CardModel cardModel;
    private SizeModel sizeModel;
    private FunctionModel functionModel;
    private UserModel userModel;
    private GroupModel groupModel;
    private ProviderModel providerModel;
    private PaymentTypeModel paymentTypeModel;
    private PackageModel packageModel;
    private CatalogModel catalogModel;
    private PostModel postModel;
    private BannerModel bannerModel;
    private OrderModel orderModel;
    private FeebackModel feebackModel;
    public BackendController(){
        colorModel = new ColorModel();
        productModel = new ProductModel();
        cardModel = new CardModel();
        sizeModel = new SizeModel();
        functionModel = new FunctionModel();
        userModel = new UserModel();
        
        paymentTypeModel = new PaymentTypeModel();
        packageModel = new PackageModel();
        groupModel = new GroupModel();
        catalogModel = new CatalogModel();
        providerModel = new ProviderModel();
        postModel = new PostModel();
        bannerModel = new BannerModel();
        orderModel = new OrderModel();
        feebackModel = new FeebackModel();
    }
     
    
    
    /**
     * L???y to??n to??n b??? m??u s???c
     * @return trang Color.jsp
     */
    @RequestMapping(value = "getAllColor" )
    public ModelAndView getAllColor(){
        ModelAndView model = new ModelAndView("Admin/Color");
        List<Color> list = colorModel.getAllColor();
        model.getModelMap().put("listColor", list);
        return model;
    }
    /**
     * x??? l?? s??? ki???n khi click th??m m???i m??u s???c
     * @return Trang th??m m???i
     */
    @RequestMapping(value="initInsertColor")
    public ModelAndView initInsertColor(){
        ModelAndView model = new ModelAndView("Admin/InsertColor");
        Color color = new Color();
        model.getModelMap().put("newColor", color);
        return model;
    }
    /**
     * Th??m m???i m??u s???c
     * @param color ?????i t?????ng th??m m???i
     * @param mm ?????i t?????ng modelmap
     * @return Chu???i url 
     */
    @RequestMapping(value = "insertColor")
    public String insertColor(@ModelAttribute("newColor") Color color, ModelMap mm){
        if(colorModel.checkColorName(color.getColorName())){
            mm.put("message", "T??n m??u ???? t???n t???i. M???i b???n ch???n t??n kh??c.");
            return "Admin/InsertColor";
        } else {
            boolean result = false;
            result = colorModel.insertColor(color);
            if(result){
                return "redirect:getAllColor.htm";
            } else{
                mm.put("message", "Th??m m???i m??u kh??ng th??nh c??ng.");
                return "Admin/InsertColor";
            }
        }
        
    }
    /**
     * X??? l?? khi click s???a m??u s???c
     * @param id m?? m??u c???n s???a th??ng tin
     * @return 
     */
    @RequestMapping(value = "initUpdateColor")
    public ModelAndView initUpdateColor(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin//UpdateColor");
        Color color = colorModel.getColorById(id);
        model.addObject("updateColor", color);
        return model;
    }
    /**
     * S???a m??u s???c
     * @param color ?????i t?????ng color c???n s???a
     * @param mm ?????i tr?????ng modelmap
     * @return chu???i url
     */
    @RequestMapping(value = "updateColor")
    public String updateColor(@ModelAttribute("updateColor") Color color, ModelMap mm){
        if(colorModel.checkExistsColorName(color)){
            mm.put("message", "T??n m??u b??? tr??ng.");
            return  "Admin/UpdateColor";
        } else {
             boolean result = false;
            result = colorModel.updateColor(color);
            if(result){
                return "redirect:getAllColor.htm";
            } else {
                mm.put("message", "S???a m??u kh??ng th??nh c??ng.");
                return "Admin/UpdateColor";
            }
        }
    }
    /**
     * X??a m??u s???c
     * @param id m?? color c???n x??a
     * @return 
     */
    @RequestMapping(value = "deleteColor")
    public String deleteColor(@RequestParam("Id") int id){
        boolean result = false;
        result = colorModel.deleteColor(id);
        if(result){
            return "redirect:getAllColor.htm";
        } else {
            return "Admin/Error";
        }
    }
    /**
     * L???y to??n b??? danh s??ch s???n ph???m 
     * @return trang Product.jsp
     */
    @RequestMapping(value = "getAllProductBackend")
    public ModelAndView getAllProduct(){
        ModelAndView model = new ModelAndView("Admin/Product");
        List<Product> list = productModel.getAllProduct();
        model.getModelMap().put("listProduct", list);
        return model;
    }
    /**
     * 
     * @return 
     */
    @RequestMapping(value = "initInsertProduct")
    public ModelAndView initInsertProduct(){
        ModelAndView model = new ModelAndView("Admin/InsertProduct");
        Product product = new Product();
        List<Provider> listProvider = providerModel.getAllProvider();
        List<Catalog> listCatalog = catalogModel.getAllCatalog();
        model.getModelMap().put("newProduct", product);
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProvider", listProvider);
        return model;
    }
    /**
     * Th??m m???i s???n ph???m
     * @param product ?????i t?????ng s???n ph???m c???n th??m
     * @param mm ?????i t?????ng model map
     * @param request ?????i t?????ng request
     * @return 
     */
    @RequestMapping(value = "insertProduct")
    public String insertProduct(@ModelAttribute("/*newProduct") Product product, ModelMap mm,HttpServletRequest request){
     
        List<String> img = new ArrayList<String>();
       
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
                    if("images".equals(fileItem.getFieldName())){
                        product.setImages(fileItem.getName());
                    } else if("imageHover".equals(fileItem.getFieldName())){
                         product.setImageHover(fileItem.getName());
                    } else if("imageLink".equals(fileItem.getFieldName())){
                     
                        img.add(fileItem.getName());
                    }
                        
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }else{
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                     if(name.equals("productName")) {
                        product.setProductName(value);
                    } else if(name.equals("productContent")){
                        product.setProductContent(value);
                    } else if (name.equals("productContentDetail")){
                        product.setProductContentDetail(value);
                    } else if(name.equals("priceInput")){
                        product.setPriceInput(value);
                    }else if(name.equals("priceOutput")){
                        product.setPriceOutput(value);
                    }else if(name.equals("providerId")){
                        product.setProviderId(Integer.parseInt(value));
                    }else if(name.equals("catalogId")){
                        product.setCatalogId(Integer.parseInt(value));
                    }else if(name.equals("discount")){
                        product.setDiscount(Integer.parseInt(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        boolean check = productModel.insertProduct(product);
        
        if (check) {
            int id = productModel.getProductIdNew();
            for (String img1 : img) {
                 ImageLink imageLink = new ImageLink();
                 imageLink.setProductId(id);
                 imageLink.setImageLinkName(img1);
                 productModel.insertImageLink(imageLink);
            }
            return "redirect:getAllProductBackend.htm";
        } else {
            mm.put("message", "Th??m m???i kh??ng th??nh c??ng");
            return "Fontend/InsertProduct";
        }
    
    
    }
    /**
     * X??? l?? khi click v??o s???a s???n ph???m
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdateProduct")
    public ModelAndView initUpdateProduct(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/UpdateProduct");
        Product product = productModel.getProductById(id);
           List<Provider> listProvider = providerModel.getAllProvider();
        List<Catalog> listCatalog = catalogModel.getAllCatalog();
        
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listProvider", listProvider);
        model.getModelMap().put("updateProduct", product);
        return model;
    }
   /**
    *  s???a th??ng tin s???n ph???m
    * @param product
    * @param mm
    * @return
    * @throws ParseException 
    */
    @RequestMapping(value = "updateProduct")
    public String updateProduct(@ModelAttribute("updateProduct") Product product, ModelMap mm) throws ParseException{
        boolean result;
        result = productModel.updateProduct(product);
        if(result){
            return "redirect:getAllProductBackend.htm";
        } else{
            mm.put("message","S???a kh??ng th??nh c??ng");
            return "redirect:initUpdateProduct.htm";
        }
    
    }
    /**
     * xem chi ti???t s???n ph???m
     * @param id
     * @return 
     */
    @RequestMapping(value = "viewProduct")
    public ModelAndView viewProduct(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/ProductDetail");
        Product product = productModel.getProductById(id);
        model.getModelMap().put("product", product);
        return model;
    }
    /**
     * l???y danh s??ch size
     * @return 
     */
      @RequestMapping(value = "getAllSize")
    public ModelAndView getAllSize(){
        ModelAndView model = new ModelAndView("Admin/Size");
        List<Size> list = sizeModel.getAllSize();
        model.getModelMap().put("listSize", list);
        return model;
    }
    /**
     * X??? l?? khi click v??o th??m m???i k??ch th?????c
     * @return 
     */
    @RequestMapping(value = "initInsertSize")
    public ModelAndView initInsertSize(){
        ModelAndView model = new ModelAndView("Admin/InsertSize");
        Size size = new Size();
        model.getModelMap().put("newSize", size);
        return model;
    }
    /**
     * Th??m m???i k??ch th?????c
     * @param size
     * @param mm
     * @return 
     */
    @RequestMapping(value = "insertSize")
    public String insertSize(@ModelAttribute("newSize") Size size, ModelMap mm){
       if(sizeModel.checkSizeName(size.getSizeName())){
            mm.put("message", "T??n size ???? t???n t???i. M???i b???n ch???n t??n kh??c.");
            return "Admin/InsertSize";
        } else {
            boolean result = false;
            result = sizeModel.insertSize(size);
            if(result){
                return "redirect:getAllSize.htm";
            } else{
                mm.put("message", "Th??m m???i k??ch th?????c kh??ng th??nh c??ng.");
                return "Admin/InsertSize";
            }
        }
        
    }
    /**
     * X??? l?? khi click v??o s???a k??ch th?????c
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdateSize")
    public ModelAndView initUpdateSize(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/UpdateSize");
        Size size = sizeModel.getSizeById(id);
        model.getModelMap().put("updateSize", size);
        return model;
        
    }
    /**
     * S???a th??ng tin k??ch th?????c s???n ph???m
     * @param size
     * @param mm
     * @return 
     */
     @RequestMapping(value = "updateSize")
    public String updateSize(@ModelAttribute("updateSize") Size size, ModelMap mm){
        if(sizeModel.checkExistsSizeName(size)){
            mm.put("message", "K??ch th?????c ???? t???n t???i.");
            return "Admin/UpdateSize";
        } else {
             boolean result = sizeModel.updateSize(size);
        if(result){
            return "redirect:getAllSize.htm";
        }else{
            mm.put("message", "S???a kh??ng th??nh c??ng");
            return "Admin/UpdateSize";
        }
        
        }   
    }
    /**
     * X??a th??ng tin k??ch th?????c s???n ph???m
     * @param id
     * @return 
     */
       @RequestMapping(value = "deleteSize")
    public String deleteSize(@RequestParam("Id") int id){
        boolean result = false;
        result = sizeModel.deleteSize(id);
        if(result){
            return "redirect:getAllSize.htm";
        } else {
            return "Admin/Error";
        }
    }
    /**
     * L???y danh s??ch th??? n???p
     * @param session
     * @return 
     */
     @RequestMapping(value = "getAllCard")
    public ModelAndView getAllCard(HttpSession session) {
        ModelAndView model ;
        if(CheckUrl.check(session)){
            model = new ModelAndView("Admin/Card");
            CardModel cardModel = new CardModel();
            List<Card> listCard= cardModel.getAllCard();
            model.addObject("listCard", listCard);
        }else {
                model = new ModelAndView("Admin/Login");
                User user =new User();
                model.getModelMap().put("user", user);
           }
        
        return model;
        
    }
    /**
     * X??? l?? khi click v??o th??m m???i th??? n???p
     * @param session
     * @return 
     */
    @RequestMapping(value = "initInsertCard")
    public ModelAndView initInsertCard(HttpSession session){
        ModelAndView model;
        if(CheckUrl.check(session)){
            model = new ModelAndView("Admin/InsertCard");
            Card Card = new Card();
            model.addObject("newCard", Card);
        } else {
                model = new ModelAndView("Admin/Login");
                User user =new User();
                model.getModelMap().put("user", user);
           }
       
        return model;               
    }
    /**
     * Th??m m???i th??? n???p
     * @param card
     * @param mm
     * @param session
     * @return 
     */
    @RequestMapping(value = "insertCard")
    public String insertCard(@ModelAttribute("newCard") Card card, ModelMap mm, HttpSession session){
        CardModel cardModel = new CardModel();
        if (CheckUrl.check(session)) {
            if (cardModel.checkCardSeri(card.getCardSeri())) {
                mm.put("message", "S??? seri ???? t???n t???i.M???i b???n ch???n s??? kh??c.");
                return "Admin/InsertCard";
            } else if (cardModel.checkCardNumber(card.getCardNumber())) {
                mm.put("message", "S??? th??? ???? t???n t???i.M???i b???n ch???n s??? kh??c.");
                return "Admin/InsertCard";
            } else {
                boolean result = false;
                result = cardModel.insertCard(card);
                if (result) {
                    return "redirect:getAllCard.htm";
                } else {
                    mm.put("message", "Th??m m???i th??? kh??ng th??nh c??ng.");
                    return "Admin/InsertCard";
                }
            }
        } else {
            return "redirect:initBackendLogin.htm";
        }
    }
    /**
     * X??? l?? khi click v??o s???a th??? n???p
     * @param id
     * @param session
     * @return 
     */
    @RequestMapping(value = "initUpdateCard")
    public ModelAndView initUpdateCard(@RequestParam("Id") int id,HttpSession session){
        CardModel cardModel = new CardModel();
        ModelAndView model ;
        if(CheckUrl.check(session)){
            model = new ModelAndView("Admin/UpdateCard");
            Card card = cardModel.getCardById(id);
            model.addObject("updateCard", card);
        }else {
              model = new ModelAndView("Admin/Login");
              User user =new User();
              model.getModelMap().put("user", user);
        }
        return model;
    }
    /**
     * S???a th??? n???p
     * @param card
     * @param mm
     * @param session
     * @return 
     */
    @RequestMapping(value = "updateCard")
    public String updateCard(@ModelAttribute("updateCard") Card card, ModelMap mm,HttpSession session){
        CardModel cardModel = new CardModel();
        if (CheckUrl.check(session)) {
            if (cardModel.checkExistsCardSeri(card)) {
                mm.put("message", "S??? seri b??? tr??ng.");
                return "Admin/UpdateCard";
            } if (cardModel.checkExistsCardNumber(card)) {
                mm.put("message", "S??? th??? b??? tr??ng.");
                return "Admin/UpdateCard";
            } else {
                boolean result = false;
                result = cardModel.updateCard(card);
                if (result) {
                    return "redirect:getAllCard.htm";
                } else {
                    mm.put("message", "S???a th??? kh??ng th??nh c??ng.");
                    return "Admin/UpdateCard";
                }
            }

        } else {
            return "redirect:initBackendLogin";
        }

    }
    /**
     * X??a th??? n???p
     * @param id
     * @param session
     * @return 
     */
    @RequestMapping(value = "deleteCard")
    public String deleteCard(@RequestParam("Id") int id,HttpSession session){
        CardModel cardModel = new CardModel();
        boolean result = false;
        if (CheckUrl.check(session)) {
            result = cardModel.deleteCard(id);
            if (result) {
                return "redirect:getAllCard.htm";
            } else {
                return "Error";
            }
        } else {
            return "redirect:initBackendLogin.htm";
        }

    }
    /**
     * L???y danh s??ch ch???c n??ng
     * @return 
     */
     @RequestMapping(value = "getAllFunction")
    public ModelAndView getAllFunction(){
        ModelAndView model = new ModelAndView("Admin/Function");
        List<Function> listFunction = functionModel.getAllFunction();
        model.addObject("listFunction", listFunction);
        return model;
    }
      @RequestMapping(value = "initInsertFunction")
    public ModelAndView initInsertFunction(){
        ModelAndView model = new ModelAndView("Admin/InsertFunction");
        Function function = new Function();
        model.addObject("newFunction", function);
        return model;
    }
    
      /**
       * X??? l?? khi click v??o th??m m???i ch???c n??ng
       * @param id
       * @return 
       */
     @RequestMapping(value = "initUpdateFunction")
    public ModelAndView initUpdateFunction(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/UpdateFunction");
        Function function = functionModel.getFunctionById(id);
        model.addObject("updateFunction", function);
        return model;
    }
    /**
     * TH??m m???i ch???c n??ng
     * @param function
     * @param mm
     * @return 
     */
    @RequestMapping(value="insertFunction")
    public String insertFunction(@ModelAttribute("newFunction") Function function, ModelMap mm){
        if(functionModel.checkFunctionName(function.getFunctionName())){
            mm.put("message", "T??n ch???c n??ng ???? t???n t???i.");
            return "Admin/InsertFunction";
        } else {
             boolean result = functionModel.insertFunction(function);
            System.out.println("ket qua:" + result);
            if(result){
                return "redirect:getAllFunction.htm";
            }else {
                mm.put("message", "Th??m m???i kh??ng th??nh c??ng.");
                return "Admin/InsertFunction";
            }
        }
       
    }
    /**
     * S???a th??ng tin ch???c n??ng
     * @param function
     * @param mm
     * @return 
     */
   
     @RequestMapping(value="updateFunction")
    public String updateFunction(@ModelAttribute("updateFunction") Function function, ModelMap mm){
        if(functionModel.checkFunctionName(function.getFunctionName())){
            mm.put("message", "T??n ch???c n??ng b??? tr??ng.");
            return "Admin/UpdateFunction";
        } else {
            boolean result = functionModel.updateFunction(function);
            if(result){
                return "redirect:getAllFunction.htm";
            }else {
                mm.put("message", "S???a kh??ng th??nh c??ng.");
                return "Admin/UpdateFunction";
            }
        }
        
    }
    /**
     * X??a th??ng tin ch???c n??ng
     * @param id
     * @return 
     */
    @RequestMapping(value="deleteFunction")
    public String deleteFunction(@RequestParam("Id") int id){
        boolean result = functionModel.deleteFunction(id);
        if(result){
            return "redirect:getAllFunction.htm";
        }else {
            return "Error";
        }
    } 
    /**
     * l???y danh s??ch ng?????i d??ng
     * @return 
     */
     @RequestMapping(value = "getAllUser")
    public ModelAndView getAllUser() {
        ModelAndView model = new ModelAndView("Admin/User");
        List<User> listUser = userModel.getAllUser();
        model.addObject("listUser", listUser);
        return model;
    }
    /**
     * X??? l?? khi click v??o th??m m???i ng?????i d??ng
     * @return 
     */
    @RequestMapping(value = "initInsertUser")
    public ModelAndView initInsertUser() {
        ModelAndView model = new ModelAndView("Admin/InsertUser");
        User user = new User();
        List<Group> listGroup = groupModel.getAllGroup();
        model.getModelMap().put("newUser", user);
        model.getModelMap().put("listGroup", listGroup);
        return model;
    }
    /**
     * Th??m m???i ng?????i d??ng
     * @param user
     * @param mm
     * @return 
     */
    @RequestMapping(value = "insertUser")
    public String insertUser(@ModelAttribute("newUser") User user, ModelMap mm) {
        if(userModel.checkUserName(user.getUserName())){
            mm.put("message", "User ???? t???n t???i.");
            return  "Admin/InsertUser";
        } else if(userModel.checkUserEmail(user.getEmail())){
            mm.put("message", "Email ???? ???????c ????ng k??.");
            return  "Admin/InsertUser";
        } else {
             boolean result = userModel.insertUser(user);
            if (result) {
                 int id = userModel.getUserIdNew();
                 packageModel.insertPackage(user.getUserName(), id);
                return "redirect:getAllUser.htm";
            } else {
                mm.put("message", "Th??m m???i kh??ng th??nh c??ng.");
                return "Admin/InsertUser";
            }
        }
       
    }
    /**
     * X??? l?? khi click v??o s???a th??ng tin ng?????i d??ng
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdateUser")
    public ModelAndView initUpdateUser(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Admin/UpdateUser");
        User user = userModel.getUserById(id);

        List<Group> listGroup = groupModel.getAllGroup();
        model.getModelMap().put("updateUser", user);
        model.getModelMap().put("listGroup", listGroup);
        return model;
    }
    /**
     * s???a th??ng tin ng?????i d??ng
     * @param user
     * @param mm
     * @return 
     */
    @RequestMapping(value = "updateUser")
    public String updateUser(@ModelAttribute("updateUser") User user, ModelMap mm) {
        if(userModel.checkExistsUserName(user)){
            mm.put("message","T??n ????ng nh???p ???? ???????c d??ng ????? ????ng k??.");
            return "Admin/UpdateUser";
        } else if(userModel.checkExistsUserEmail(user)){
            mm.put("message","Email ???? ???????c d??ng ????? ????ng k??");
            return "Admin/UpdateUser";
        } else{
            boolean result = userModel.updateUser(user);
            if (result) {
                return "redirect:getAllUser.htm";
            } else {
                mm.put("message", "S???a kh??ng th??nh c??ng.");
                return "redirect:initUpdateUser.htm";
            }
        }
       
    }
    /**
     * x??a th??ng tin ng?????i d??ng
     * @param id
     * @return 
     */
    @RequestMapping(value = "deleteUser")
    public String deleteUser(@RequestParam("Id") int id) {
        boolean result = userModel.deleteUser(id);
        if (result) {
            return "redirect:getAllUser.htm";
        } else {
            return "Error";
        }
    }
    /**
     * L???y danh s??ch nh?? cung c???p
     * @return 
     */
    @RequestMapping(value = "getAllProvider")
    public ModelAndView getAllProvider() {
        ModelAndView model = new ModelAndView("Admin/Provider");
        List<Provider> listProvider = providerModel.getAllProvider();
        model.addObject("listProvider", listProvider);
        return model;
    }
    /**
     * X??? l?? khi click v??o th??m m???i nh?? cung c???p
     * @return 
     */
    @RequestMapping(value = "initInsertProvider")
    public ModelAndView initInsertProvider() {
        ModelAndView model = new ModelAndView("Admin/InsertProvider");
        Provider provider = new Provider();
        List<Group> listGroup = groupModel.getAllGroup();
        model.getModelMap().put("newProvider", provider);
        model.getModelMap().put("listGroup", listGroup);
        return model;
    }
    /**
     * Th??m m???i nh?? cung c???p
     * @param provider
     * @param mm
     * @return 
     */
    @RequestMapping(value = "insertProvider")
    public String insertProvider(@ModelAttribute("newProvider") Provider provider, ModelMap mm) {
        if(providerModel.checkProviderName(provider.getProviderName())){
            mm.put("message", "Provider ???? t???n t???i.");
            return  "Admin/InsertProvider";
        } else if(providerModel.checkProviderEmail(provider.getEmail())){
            mm.put("message", "Email ???? ???????c ????ng k??.");
            return  "Admin/InsertProvider";
        } else {
             boolean result = providerModel.insertProvider(provider);
            if (result) {
                return "redirect:getAllProvider.htm";
            } else {
                mm.put("message", "Th??m m???i kh??ng th??nh c??ng.");
                return "Admin/InsertProvider";
            }
        }
       
    }
    /**
     * X??? l?? khi click v??o s???a th??ng tin nh?? cung c???p 
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdateProvider")
    public ModelAndView initUpdateProvider(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Admin/UpdateProvider");
        Provider provider = providerModel.getProviderById(id);

        List<Group> listGroup = groupModel.getAllGroup();
        model.getModelMap().put("updateProvider", provider);
        model.getModelMap().put("listGroup", listGroup);
        return model;
    }
    /**
     * S???a th??ng tin nh?? cung c???p 
     * @param provider
     * @param mm
     * @return 
     */
    @RequestMapping(value = "updateProvider")
    public String updateProvider(@ModelAttribute("updateProvider") Provider provider, ModelMap mm) {
        if(providerModel.checkExistsProviderName(provider)){
            mm.put("message","T??n ????ng nh???p ???? ???????c d??ng ????? ????ng k??.");
            return "Admin/UpdateProvider";
        } else if(providerModel.checkExistsProviderEmail(provider)){
            mm.put("message","Email ???? ???????c d??ng ????? ????ng k??");
            return "Admin/UpdateProvider";
        } else{
            boolean result = providerModel.updateProvider(provider);
            if (result) {
                return "redirect:getAllProvider.htm";
            } else {
                mm.put("message", "S???a kh??ng th??nh c??ng.");
                return "Admin/UpdateProvider";
            }
        }
       
    }
    /**
     * X??a th??ng tin nh?? cung c???p 
     * @param id
     * @return 
     */
    @RequestMapping(value = "deleteProvider")
    public String deleteProvider(@RequestParam("Id") int id) {
        boolean result = providerModel.deleteProvider(id);
        if (result) {
            return "redirect:getAllProvider.htm";
        } else {
            return "Admin/Error";
        }
    }
    /**
     * L???y danh s??ch h??nh th???c thanh to??n
     * @return 
     */
    @RequestMapping(value = "getAllPaymentType" )
    public ModelAndView getAllPaymentType(){
        ModelAndView model = new ModelAndView("Admin/PaymentType");
        List<PaymentType> list = paymentTypeModel.getALlPaymentType();
        model.getModelMap().put("listPaymentType", list);
        return model;
    }
    /**
     * X??? l?? khi click v??o th??m m???i h??nh th???c thanh to??n
     * @return 
     */
    @RequestMapping(value="initInsertPaymentType")
    public ModelAndView initInsertPaymentType(){
        ModelAndView model = new ModelAndView("Admin/InsertPaymentType");
        PaymentType paymentType = new PaymentType();
        model.getModelMap().put("newPaymentType", paymentType);
        return model;
    }
    /**
     * Th??m m???i h??nh th???c thanh to??n
     * @param paymentType
     * @param mm
     * @return 
     */
      @RequestMapping(value = "insertPaymentType")
    public String insertPaymentType(@ModelAttribute("newPaymentType") PaymentType paymentType, ModelMap mm){
        if(paymentTypeModel.checkPaymentTypeName(paymentType.getPaymentTypeName())){
            mm.put("message", "T??n m??u ???? t???n t???i. M???i b???n ch???n t??n kh??c.");
            return "Admin/InsertPaymentType";
        } else {
            boolean result = false;
            result = paymentTypeModel.insertPaymentType(paymentType);
            if(result){
                return "redirect:getAllPaymentType.htm";
            } else{
                mm.put("message", "Th??m m???i m??u kh??ng th??nh c??ng.");
                return "Admin/InsertPaymentType";
            }
        }
        
    }
    /**
     * X??? l?? khi click v??o s???a th??ng tin h??nh th???c thanh to??n
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdatePaymentType")
    public ModelAndView initUpdatePaymentType(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin//UpdatePaymentType");
        PaymentType paymentType = paymentTypeModel.getPaymentTypeById(id);
        model.addObject("updatePaymentType", paymentType);
        return model;
    }
    /**
     * s???a th??ng tin h??nh th???c thanh to??n
     * @param paymentType
     * @param mm
     * @return 
     */
    @RequestMapping(value = "updatePaymentType")
    public String updatePaymentType(@ModelAttribute("updatePaymentType") PaymentType paymentType, ModelMap mm){
        if(paymentTypeModel.checkExistsPaymentTypeName(paymentType)){
            mm.put("message", "T??n m??u b??? tr??ng.");
            return  "Admin/UpdatePaymentType";
        } else {
             boolean result = false;
            result = paymentTypeModel.updatePaymentType(paymentType);
            if(result){
                return "redirect:getAllPaymentType.htm";
            } else {
                mm.put("message", "S???a m??u kh??ng th??nh c??ng.");
                return "Admin/UpdatePaymentType";
            }
        }
    }
    /**
     * X??a th??ng tin h??nh th???c thanh to??n
     * @param id
     * @return 
     */
    @RequestMapping(value = "deletePaymentType")
    public String deletePaymentType(@RequestParam("Id") int id){
        boolean result = false;
        result = paymentTypeModel.deletePaymentType(id);
        if(result){
            return "redirect:getAllPaymentType.htm";
        } else {
            return "Admin/Error";
        }
    }
    /**
     * L???y danh s??ch vi ti???n
     * @return 
     */
     @RequestMapping(value = "getAllPackage")
    public ModelAndView getAllPackage(){
        ModelAndView model = new ModelAndView("Admin/Package");
        List<bkap.demo.entities.Packages> listPackage = packageModel.getAllPackage();
        model.addObject("listPackage", listPackage);
        return model;
    }
    /**
     * X??? l?? khi click v??o th??m m???i v?? ti???n
     * @return 
     */
      @RequestMapping(value = "initInsertPackage")
    public ModelAndView initInsertPackage(){
        ModelAndView model = new ModelAndView("Admin/InsertPackage");
        bkap.demo.entities.Packages pa = new Packages();
        List<User> listUser = userModel.getAllUser();
        model.addObject("newPackage", pa);
        model.getModelMap().put("listUser", listUser);
        return model;
    }
    /**
     * Th??m m???i v?? ti???n
     * @param pa
     * @param mm
     * @return 
     */
    @RequestMapping(value="insertPackage")
    public String insertPackage(@ModelAttribute("newPackage") bkap.demo.entities.Packages pa, ModelMap mm){
        if(packageModel.checkPackageName(pa.getPackageName())){
              mm.put("message","V?? ???? t???n t???i.");
              return "Admin/InsertPackage";
        }else{
            boolean result = packageModel.insertPackageF(pa);
            System.out.println("ket qua:" + result);
            if(result){
                return "redirect:getAllPackage.htm";
            }else {
                mm.put("message", "Th??m m???i kh??ng th??nh c??ng.");
                return "Admin/InsertPackage";
            }
        }
       
    }
    /**
     * X??? l?? khi click v??o s???a th??ng tin v?? ti???n
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdatePackage")
    public ModelAndView initUpdatePackage(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/UpdatePackage");
        bkap.demo.entities.Packages pa = packageModel.getPackageById(id);
         List<User> listUser = userModel.getAllUser();
        model.getModelMap().put("listUser", listUser);
        model.addObject("updatePackage", pa);
        return model;
    }
    /**
     * S???a th??ng tin v?? ti???n
     * @param pa
     * @param mm
     * @return 
     */
     @RequestMapping(value="updatePackage")
    public String updatePackage(@ModelAttribute("updatePackage") bkap.demo.entities.Packages pa, ModelMap mm){
        if(packageModel.checkExistsPackageName(pa)){
            mm.put("message", "T??n v?? b??? tr??ng.");
            return "Admin/UpdatePackage";
        } else{
            boolean result = packageModel.updatePackage(pa);
            if(result){
                return "redirect:getAllPackage.htm";
            }else {
                mm.put("message", "S???a kh??ng th??nh c??ng.");
                return "redirect:initInsertPackage.htm";
            }
        }
        
    }
    /**
     * X??a th??ng tin v?? ti???n
     * @param id
     * @return 
     */
    @RequestMapping(value="deletePackage")
    public String deletePackage(@RequestParam("Id") int id){
        boolean result = packageModel.deletePackage(id);
        if(result){
            return "redirect:getAllPackage.htm";
        }else {
            return "Admin/Error";
        }
    } 
    /**
     * L???y danh s??ch nh??m ng?????i d??ng
     * @return 
     */
    @RequestMapping(value = "getAllGroup")
    public ModelAndView getAllGroup(){
        ModelAndView model = new ModelAndView("Admin/Group");
         GroupModel GroupModel = new GroupModel();
        List<Group> listGroup = GroupModel.getAllGroup();
        model.addObject("listGroup", listGroup);
        return model;
    }
    /**
     * X??? l?? khi click v??o th??m m???i nh??m ng?????i d??ng
     * @return 
     */
      @RequestMapping(value = "initInsertGroup")
    public ModelAndView initInsertGroup(){
        ModelAndView model = new ModelAndView("Admin/InsertGroup");
        Group group = new Group();
        model.addObject("newGroup", group);
        return model;
    }
    /**
     * Th??m m???i nh??m ng?????i d??ng
     * @param group
     * @param mm
     * @return 
     */
    @RequestMapping(value="insertGroup")
    public String insertGroup(@ModelAttribute("newGroup") Group group, ModelMap mm){
        if(groupModel.checkGroupName(group.getGroupName())){
            mm.put("message", "T??n ch???c n??ng ???? t???n t???i.");
            return "Admin/InsertGroup";
        } else {
             boolean result = groupModel.insertGroup(group);
            System.out.println("ket qua:" + result);
            if(result){
                return "redirect:getAllGroup.htm";
            }else {
                mm.put("message", "Th??m m???i kh??ng th??nh c??ng.");
                return "Admin/InsertGroup";
            }
        }
       
    }
    /**
     * X??? l?? khi click v??o s???a nh??m ng?????i d??ng
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdateGroup")
    public ModelAndView initUpdateGroup(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/UpdateGroup");
        Group group = groupModel.getGroupById(id);
        model.getModelMap().put("updateGroup", group);
        return model;
    }
    /**
     * S???a nh??m ng?????i d??ng
     * @param group
     * @param mm
     * @return 
     */
     @RequestMapping(value="updateGroup")
    public String updateGroup(@ModelAttribute("updateGroup") Group group, ModelMap mm){
        if(groupModel.checkGroupName(group.getGroupName())){
            mm.put("message", "T??n ch???c n??ng b??? tr??ng.");
            return "Admin/UpdateGroup";
        } else {
            boolean result = groupModel.updateGroup(group);
            if(result){
                return "redirect:getAllGroup.htm";
            }else {
                mm.put("message", "S???a kh??ng th??nh c??ng.");
                return "Admin/UpdateGroup";
            }
        }
        
    }
    /**
     * X??a nh??m ng?????i d??ng
     * @param id
     * @return 
     */
    @RequestMapping(value="deleteGroup")
    public String deleteGroup(@RequestParam("Id") int id){
        boolean result = groupModel.deleteGroup(id);
        if(result){
            return "redirect:getAllGroup.htm";
        }else {
            return "Admin/Error";
        }
    }
    /**
     * L???y danh s??ch tin t???c
     * @return 
     */
    @RequestMapping(value = "getAllPost")
    public ModelAndView getAllPost(){
        ModelAndView model = new ModelAndView("Admin/Post");
        List<Post> listPost = postModel.getAllPost();
        model.getModelMap().put("listPost", listPost);
        return model;
    }
    /**
     * L???y danh sach b??i tin
     * @return 
     */
    @RequestMapping(value = "initInsertPost")
    public ModelAndView initInsertPost(){
        ModelAndView model = new ModelAndView("Admin/InsertPost");
        Post post = new Post();
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("newPost", post);
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        return model;
    }
    /**
     * Insert b??i tin
     * @param post
     * @param mm
     * @param request
     * @return 
     */
    @RequestMapping(value = "insertPost")
    public String insertPost(@ModelAttribute("newPost") Post post, ModelMap mm,HttpServletRequest request){
      
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
                    post.setImages(fileItem.getName());
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }else{
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                     if(name.equals("postTitle")) {
                        post.setPostTitle(value);
                    } else if(name.equals("content")){
                       post.setContent(value);
                    }  else if(name.equals("contentDetail")){
                       post.setContentDetail(value);
                    }else if (name.equals("catalogPostId")){
                        post.setCatalogPostId(Integer.parseInt(value));
                    } else if(name.equals("displayNumber")){
                        post.setDisplayNumber(Integer.parseInt(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
       boolean result = false;
        result = postModel.insertPost(post);
        if(result){
             return "redirect:getAllPost.htm";
        } else{
            mm.put("message", "Th??m m???i kh??ng th??nh c??ng");
            return "Admin/InsertPost";
        }
    }
    /**
     * x??? l?? khi click v??o s???a b??i tin
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdatePost")
     public ModelAndView initUpdatePost(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/UpdatePost");
        Post post = postModel.getPostById(id);
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("updatePost", post);
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        return model;
    }
     /**
      * s???a b??i tin
      * @param post
      * @param mm
      * @return 
      */
    @RequestMapping(value = "updatePost")
    public String updatePost(@ModelAttribute("updatePost") Post post, ModelMap mm){
        boolean result = false;
        result = postModel.updatePost(post);
        if(result){
             return "redirect:getAllPost.htm";
        } else{
            mm.put("message", "S???a kh??ng th??nh c??ng");
            return "Admin/UpdatePost";
        }
        
    }
    /**
     * X??a b??i tin
     * @param id
     * @return 
     */
    @RequestMapping(value = "deletePost")
    public String deletePost(@RequestParam("Id") int id) {
        boolean result = postModel.deletePost(id);
        if (result) {
            return "redirect:getAllPost.htm";
        } else {
            return "Admin/Error";
        }
    }
    /**
     * L???y danh s??ch banner
     * @return 
     */
     @RequestMapping(value = "getAllBanner")
    public ModelAndView getAllBanner(){
        ModelAndView model = new ModelAndView("Admin/Banner");
        List<Banner> listBanner = bannerModel.getAllBanner();
        model.getModelMap().put("listBanner", listBanner);
        return model;
    }
    /**
     * X??? l?? kh click v??o th??m m???i banner
     * @return 
     */
    @RequestMapping(value = "initInsertBanner")
    public ModelAndView initInsertBanner(){
        ModelAndView model = new ModelAndView("Admin/InsertBanner");
        Banner banner = new Banner();
        model.getModelMap().put("newBanner", banner);
        return model;
    }
    /**
     * th??m m???i banner
     * @param banner
     * @param mm
     * @param request
     * @return 
     */
    @RequestMapping(value = "insertBanner")
    public String insertBanner(@ModelAttribute("newBanner") Banner banner, ModelMap mm, HttpServletRequest request){
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
                    banner.setImages(fileItem.getName());
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }else{
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if(name.equals("displayNumber")){
                        banner.setDisplayNumber(Integer.parseInt(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
         boolean result = bannerModel.insertBanner(banner);
        if(result){
             return "redirect:getAllBanner.htm";
        } else{
            mm.put("message", "Th??m m???i kh??ng th??nh c??ng");
            return "Admin/InsertBanner";
        }
        
    }
    /**
     * X??? l?? khi click v??o s???a banner
     * @param id
     * @return 
     */
    @RequestMapping(value = "initUpdateBanner")
     public ModelAndView initUpdateBanner(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/UpdateBanner");
        Banner banner = bannerModel.getBannerById(id);     
        model.getModelMap().put("updateBanner", banner);
        return model;
    }
     /**
      * S???a banner
      * @param banner
      * @param mm
      * @return 
      */
    @RequestMapping(value = "updateBanner")
    public String updatePost(@ModelAttribute("updateBanner") Banner banner, ModelMap mm){
        boolean result = false;
        result = bannerModel.updateBanner(banner);
        if(result){
             return "redirect:getAllBanner.htm";
        } else{
            mm.put("message", "S???a kh??ng th??nh c??ng");
            return "Admin/UpdateBanner";
        }
        
    }
    /**
     * X??a banner
     * @param id
     * @return 
     */
    @RequestMapping(value = "deleteBanner")
    public String deleteBanner(@RequestParam("Id") int id) {
        boolean result = bannerModel.deleteBanner(id);
        if (result) {
            return "redirect:getAllBanner.htm";
        } else {
            return "Admin/Error";
        }
    }
    /**
     * L???y danh s??ch ????n h??ng
     * @return 
     */
    @RequestMapping(value = "getAllOrder")
    public ModelAndView getAllOrder(){
        ModelAndView model = new ModelAndView("Admin/Order");
        List<Order> listOrder = orderModel.getAllOrder();
        model.getModelMap().put("listOrder", listOrder);
        return model;
    }
    /**
     * l???y danh s??ch chi ti???t ????n h??ng chi ti???t theo m?? ????n h??ng
     * @param id
     * @return 
     */
     @RequestMapping(value = "orderDetail")
    public ModelAndView orderDetail(@RequestParam("Id") int id){
        ModelAndView model = new ModelAndView("Admin/OrderDetail");
        List<OrderDetail> listOrder = orderModel.getOderDetailById(id);
        model.getModelMap().put("listOrderDetail", listOrder);
        return model;
    }
    /**
     * X??c nh???n ????n h??ng
     * @param id
     * @return 
     */
    @RequestMapping(value = "confirmOrder")
    public String confirmOrder(@RequestParam("Id") int id){
       orderModel.confirmOrder(id);
       return "redirect:getAllOrder.htm"; 
    }
    /**
     * L???y danh s??ch ph???n h???i
     * @return 
     */
      @RequestMapping(value = "getAllFeeback")
    public ModelAndView getAllFeeback(){
        ModelAndView model = new ModelAndView("Admin/Feeback");
        List<Feeback> listFeeback = feebackModel.getAllFeeback();
        model.getModelMap().put("listFeeback", listFeeback);
        return model;
    }
    /**
     * X??c nh???n ph???n h???i
     * @param id
     * @return 
     */
      @RequestMapping(value = "updateFeeback")
    public String updateFeeback(@RequestParam("Id") int id){
       feebackModel.updateFeeback(id);
       return "redirect:getAllFeeback.htm"; 
    }
}
