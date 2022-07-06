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
     * Lấy toàn toàn bộ màu sắc
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
     * xử lí sự kiện khi click thêm mới màu sắc
     * @return Trang thêm mới
     */
    @RequestMapping(value="initInsertColor")
    public ModelAndView initInsertColor(){
        ModelAndView model = new ModelAndView("Admin/InsertColor");
        Color color = new Color();
        model.getModelMap().put("newColor", color);
        return model;
    }
    /**
     * Thêm mới màu sắc
     * @param color đối tượng thêm mới
     * @param mm đối tượng modelmap
     * @return Chuỗi url 
     */
    @RequestMapping(value = "insertColor")
    public String insertColor(@ModelAttribute("newColor") Color color, ModelMap mm){
        if(colorModel.checkColorName(color.getColorName())){
            mm.put("message", "Tên màu đã tồn tại. Mời bạn chọn tên khác.");
            return "Admin/InsertColor";
        } else {
            boolean result = false;
            result = colorModel.insertColor(color);
            if(result){
                return "redirect:getAllColor.htm";
            } else{
                mm.put("message", "Thêm mới màu không thành công.");
                return "Admin/InsertColor";
            }
        }
        
    }
    /**
     * Xử lí khi click sửa màu sắc
     * @param id mã màu cần sửa thông tin
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
     * Sửa màu sắc
     * @param color đối tượng color cần sửa
     * @param mm đối trượng modelmap
     * @return chuỗi url
     */
    @RequestMapping(value = "updateColor")
    public String updateColor(@ModelAttribute("updateColor") Color color, ModelMap mm){
        if(colorModel.checkExistsColorName(color)){
            mm.put("message", "Tên màu bị trùng.");
            return  "Admin/UpdateColor";
        } else {
             boolean result = false;
            result = colorModel.updateColor(color);
            if(result){
                return "redirect:getAllColor.htm";
            } else {
                mm.put("message", "Sửa màu không thành công.");
                return "Admin/UpdateColor";
            }
        }
    }
    /**
     * Xóa màu sắc
     * @param id mà color cần xóa
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
     * Lấy toàn bộ danh sách sản phẩm 
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
     * Thêm mới sản phẩm
     * @param product đối tượng sản phẩm cần thêm
     * @param mm đối tượng model map
     * @param request đối tượng request
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
            mm.put("message", "Thêm mới không thành công");
            return "Fontend/InsertProduct";
        }
    
    
    }
    /**
     * Xử lí khi click vào sửa sản phẩm
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
    *  sửa thông tin sản phẩm
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
            mm.put("message","Sửa không thành công");
            return "redirect:initUpdateProduct.htm";
        }
    
    }
    /**
     * xem chi tiết sản phẩm
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
     * lấy danh sách size
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
     * Xử lí khi click vào thêm mới kích thước
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
     * Thêm mới kích thước
     * @param size
     * @param mm
     * @return 
     */
    @RequestMapping(value = "insertSize")
    public String insertSize(@ModelAttribute("newSize") Size size, ModelMap mm){
       if(sizeModel.checkSizeName(size.getSizeName())){
            mm.put("message", "Tên size đã tồn tại. Mời bạn chọn tên khác.");
            return "Admin/InsertSize";
        } else {
            boolean result = false;
            result = sizeModel.insertSize(size);
            if(result){
                return "redirect:getAllSize.htm";
            } else{
                mm.put("message", "Thêm mới kích thước không thành công.");
                return "Admin/InsertSize";
            }
        }
        
    }
    /**
     * Xử lí khi click vào sửa kích thước
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
     * Sửa thông tin kích thước sản phẩm
     * @param size
     * @param mm
     * @return 
     */
     @RequestMapping(value = "updateSize")
    public String updateSize(@ModelAttribute("updateSize") Size size, ModelMap mm){
        if(sizeModel.checkExistsSizeName(size)){
            mm.put("message", "Kích thước đã tồn tại.");
            return "Admin/UpdateSize";
        } else {
             boolean result = sizeModel.updateSize(size);
        if(result){
            return "redirect:getAllSize.htm";
        }else{
            mm.put("message", "Sửa không thành công");
            return "Admin/UpdateSize";
        }
        
        }   
    }
    /**
     * Xóa thông tin kích thước sản phẩm
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
     * Lấy danh sách thẻ nạp
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
     * Xử lý khi click vào thêm mới thẻ nạp
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
     * Thêm mới thẻ nạp
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
                mm.put("message", "Số seri đã tồn tại.Mời bạn chọn số khác.");
                return "Admin/InsertCard";
            } else if (cardModel.checkCardNumber(card.getCardNumber())) {
                mm.put("message", "Số thẻ đã tồn tại.Mời bạn chọn số khác.");
                return "Admin/InsertCard";
            } else {
                boolean result = false;
                result = cardModel.insertCard(card);
                if (result) {
                    return "redirect:getAllCard.htm";
                } else {
                    mm.put("message", "Thêm mới thẻ không thành công.");
                    return "Admin/InsertCard";
                }
            }
        } else {
            return "redirect:initBackendLogin.htm";
        }
    }
    /**
     * Xử lí khi click vào sửa thẻ nạp
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
     * Sửa thẻ nạp
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
                mm.put("message", "Số seri bị trùng.");
                return "Admin/UpdateCard";
            } if (cardModel.checkExistsCardNumber(card)) {
                mm.put("message", "Số thẻ bị trùng.");
                return "Admin/UpdateCard";
            } else {
                boolean result = false;
                result = cardModel.updateCard(card);
                if (result) {
                    return "redirect:getAllCard.htm";
                } else {
                    mm.put("message", "Sửa thẻ không thành công.");
                    return "Admin/UpdateCard";
                }
            }

        } else {
            return "redirect:initBackendLogin";
        }

    }
    /**
     * Xóa thẻ nạp
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
     * Lấy danh sách chức năng
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
       * Xử lí khi click vào thêm mới chức năng
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
     * THêm mới chức năng
     * @param function
     * @param mm
     * @return 
     */
    @RequestMapping(value="insertFunction")
    public String insertFunction(@ModelAttribute("newFunction") Function function, ModelMap mm){
        if(functionModel.checkFunctionName(function.getFunctionName())){
            mm.put("message", "Tên chức năng đã tồn tại.");
            return "Admin/InsertFunction";
        } else {
             boolean result = functionModel.insertFunction(function);
            System.out.println("ket qua:" + result);
            if(result){
                return "redirect:getAllFunction.htm";
            }else {
                mm.put("message", "Thêm mới không thành công.");
                return "Admin/InsertFunction";
            }
        }
       
    }
    /**
     * Sửa thông tin chức năng
     * @param function
     * @param mm
     * @return 
     */
   
     @RequestMapping(value="updateFunction")
    public String updateFunction(@ModelAttribute("updateFunction") Function function, ModelMap mm){
        if(functionModel.checkFunctionName(function.getFunctionName())){
            mm.put("message", "Tên chức năng bị trùng.");
            return "Admin/UpdateFunction";
        } else {
            boolean result = functionModel.updateFunction(function);
            if(result){
                return "redirect:getAllFunction.htm";
            }else {
                mm.put("message", "Sửa không thành công.");
                return "Admin/UpdateFunction";
            }
        }
        
    }
    /**
     * Xóa thông tin chức năng
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
     * lấy danh sách người dùng
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
     * Xử lí khi click vào thêm mới người dùng
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
     * Thêm mới người dùng
     * @param user
     * @param mm
     * @return 
     */
    @RequestMapping(value = "insertUser")
    public String insertUser(@ModelAttribute("newUser") User user, ModelMap mm) {
        if(userModel.checkUserName(user.getUserName())){
            mm.put("message", "User đã tồn tại.");
            return  "Admin/InsertUser";
        } else if(userModel.checkUserEmail(user.getEmail())){
            mm.put("message", "Email đã được đăng kí.");
            return  "Admin/InsertUser";
        } else {
             boolean result = userModel.insertUser(user);
            if (result) {
                 int id = userModel.getUserIdNew();
                 packageModel.insertPackage(user.getUserName(), id);
                return "redirect:getAllUser.htm";
            } else {
                mm.put("message", "Thêm mới không thành công.");
                return "Admin/InsertUser";
            }
        }
       
    }
    /**
     * Xử lí khi click vào sửa thông tin người dùng
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
     * sửa thông tin người dùng
     * @param user
     * @param mm
     * @return 
     */
    @RequestMapping(value = "updateUser")
    public String updateUser(@ModelAttribute("updateUser") User user, ModelMap mm) {
        if(userModel.checkExistsUserName(user)){
            mm.put("message","Tên đăng nhập đã được dùng để đăng kí.");
            return "Admin/UpdateUser";
        } else if(userModel.checkExistsUserEmail(user)){
            mm.put("message","Email đã được dùng để đăng kí");
            return "Admin/UpdateUser";
        } else{
            boolean result = userModel.updateUser(user);
            if (result) {
                return "redirect:getAllUser.htm";
            } else {
                mm.put("message", "Sửa không thánh công.");
                return "redirect:initUpdateUser.htm";
            }
        }
       
    }
    /**
     * xóa thông tin người dùng
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
     * Lấy danh sách nhà cung cấp
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
     * Xử lí khi click váo thêm mới nhà cung cấp
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
     * Thêm mới nhà cung cấp
     * @param provider
     * @param mm
     * @return 
     */
    @RequestMapping(value = "insertProvider")
    public String insertProvider(@ModelAttribute("newProvider") Provider provider, ModelMap mm) {
        if(providerModel.checkProviderName(provider.getProviderName())){
            mm.put("message", "Provider đã tồn tại.");
            return  "Admin/InsertProvider";
        } else if(providerModel.checkProviderEmail(provider.getEmail())){
            mm.put("message", "Email đã được đăng kí.");
            return  "Admin/InsertProvider";
        } else {
             boolean result = providerModel.insertProvider(provider);
            if (result) {
                return "redirect:getAllProvider.htm";
            } else {
                mm.put("message", "Thêm mới không thành công.");
                return "Admin/InsertProvider";
            }
        }
       
    }
    /**
     * Xử lí khi click vào sửa thông tin nhà cung cấp 
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
     * Sửa thông tin nhà cung cấp 
     * @param provider
     * @param mm
     * @return 
     */
    @RequestMapping(value = "updateProvider")
    public String updateProvider(@ModelAttribute("updateProvider") Provider provider, ModelMap mm) {
        if(providerModel.checkExistsProviderName(provider)){
            mm.put("message","Tên đăng nhập đã được dùng để đăng kí.");
            return "Admin/UpdateProvider";
        } else if(providerModel.checkExistsProviderEmail(provider)){
            mm.put("message","Email đã được dùng để đăng kí");
            return "Admin/UpdateProvider";
        } else{
            boolean result = providerModel.updateProvider(provider);
            if (result) {
                return "redirect:getAllProvider.htm";
            } else {
                mm.put("message", "Sửa không thánh công.");
                return "Admin/UpdateProvider";
            }
        }
       
    }
    /**
     * Xóa thông tin nhà cung cấp 
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
     * Lấy danh sách hình thức thanh toán
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
     * Xử lí khi click vào thêm mới hình thức thanh toán
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
     * Thêm mới hình thức thanh toán
     * @param paymentType
     * @param mm
     * @return 
     */
      @RequestMapping(value = "insertPaymentType")
    public String insertPaymentType(@ModelAttribute("newPaymentType") PaymentType paymentType, ModelMap mm){
        if(paymentTypeModel.checkPaymentTypeName(paymentType.getPaymentTypeName())){
            mm.put("message", "Tên màu đã tồn tại. Mời bạn chọn tên khác.");
            return "Admin/InsertPaymentType";
        } else {
            boolean result = false;
            result = paymentTypeModel.insertPaymentType(paymentType);
            if(result){
                return "redirect:getAllPaymentType.htm";
            } else{
                mm.put("message", "Thêm mới màu không thành công.");
                return "Admin/InsertPaymentType";
            }
        }
        
    }
    /**
     * Xử lí khi click vào sửa thông tin hình thức thanh toán
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
     * sửa thông tin hình thức thanh toán
     * @param paymentType
     * @param mm
     * @return 
     */
    @RequestMapping(value = "updatePaymentType")
    public String updatePaymentType(@ModelAttribute("updatePaymentType") PaymentType paymentType, ModelMap mm){
        if(paymentTypeModel.checkExistsPaymentTypeName(paymentType)){
            mm.put("message", "Tên màu bị trùng.");
            return  "Admin/UpdatePaymentType";
        } else {
             boolean result = false;
            result = paymentTypeModel.updatePaymentType(paymentType);
            if(result){
                return "redirect:getAllPaymentType.htm";
            } else {
                mm.put("message", "Sửa màu không thành công.");
                return "Admin/UpdatePaymentType";
            }
        }
    }
    /**
     * Xóa thông tin hình thức thanh toán
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
     * Lấy danh sách vi tiền
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
     * Xử lí khi click vào thêm mới ví tiền
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
     * Thêm mới ví tiền
     * @param pa
     * @param mm
     * @return 
     */
    @RequestMapping(value="insertPackage")
    public String insertPackage(@ModelAttribute("newPackage") bkap.demo.entities.Packages pa, ModelMap mm){
        if(packageModel.checkPackageName(pa.getPackageName())){
              mm.put("message","Ví đã tồn tại.");
              return "Admin/InsertPackage";
        }else{
            boolean result = packageModel.insertPackageF(pa);
            System.out.println("ket qua:" + result);
            if(result){
                return "redirect:getAllPackage.htm";
            }else {
                mm.put("message", "Thêm mới không thành công.");
                return "Admin/InsertPackage";
            }
        }
       
    }
    /**
     * Xử lí khi click vào sửa thông tin ví tiền
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
     * Sửa thông tin ví tiền
     * @param pa
     * @param mm
     * @return 
     */
     @RequestMapping(value="updatePackage")
    public String updatePackage(@ModelAttribute("updatePackage") bkap.demo.entities.Packages pa, ModelMap mm){
        if(packageModel.checkExistsPackageName(pa)){
            mm.put("message", "Tên ví bị trùng.");
            return "Admin/UpdatePackage";
        } else{
            boolean result = packageModel.updatePackage(pa);
            if(result){
                return "redirect:getAllPackage.htm";
            }else {
                mm.put("message", "Sửa không thành công.");
                return "redirect:initInsertPackage.htm";
            }
        }
        
    }
    /**
     * Xóa thông tin ví tiền
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
     * Lấy danh sách nhóm người dùng
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
     * Xử lí khi click vào thêm mới nhóm người dùng
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
     * Thêm mới nhóm người dùng
     * @param group
     * @param mm
     * @return 
     */
    @RequestMapping(value="insertGroup")
    public String insertGroup(@ModelAttribute("newGroup") Group group, ModelMap mm){
        if(groupModel.checkGroupName(group.getGroupName())){
            mm.put("message", "Tên chức năng đã tồn tại.");
            return "Admin/InsertGroup";
        } else {
             boolean result = groupModel.insertGroup(group);
            System.out.println("ket qua:" + result);
            if(result){
                return "redirect:getAllGroup.htm";
            }else {
                mm.put("message", "Thêm mới không thành công.");
                return "Admin/InsertGroup";
            }
        }
       
    }
    /**
     * Xử lí khi click vào sửa nhóm người dùng
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
     * Sửa nhóm người dùng
     * @param group
     * @param mm
     * @return 
     */
     @RequestMapping(value="updateGroup")
    public String updateGroup(@ModelAttribute("updateGroup") Group group, ModelMap mm){
        if(groupModel.checkGroupName(group.getGroupName())){
            mm.put("message", "Tên chức năng bị trùng.");
            return "Admin/UpdateGroup";
        } else {
            boolean result = groupModel.updateGroup(group);
            if(result){
                return "redirect:getAllGroup.htm";
            }else {
                mm.put("message", "Sửa không thành công.");
                return "Admin/UpdateGroup";
            }
        }
        
    }
    /**
     * Xóa nhóm người dùng
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
     * Lấy danh sách tin tức
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
     * Lấy danh sach bài tin
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
     * Insert bài tin
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
            mm.put("message", "Thêm mới không thành công");
            return "Admin/InsertPost";
        }
    }
    /**
     * xử lí khi click vào sửa bài tin
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
      * sửa bài tin
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
            mm.put("message", "Sửa không thành công");
            return "Admin/UpdatePost";
        }
        
    }
    /**
     * Xóa bài tin
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
     * Lấy danh sách banner
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
     * Xử lí kh click vào thêm mới banner
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
     * thêm mới banner
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
            mm.put("message", "Thêm mới không thành công");
            return "Admin/InsertBanner";
        }
        
    }
    /**
     * Xử lí khi click vào sửa banner
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
      * Sửa banner
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
            mm.put("message", "Sửa không thành công");
            return "Admin/UpdateBanner";
        }
        
    }
    /**
     * Xóa banner
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
     * Lấy danh sách đơn hàng
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
     * lấy danh sách chi tiết đơn hàng chi tiết theo mã đơn hàng
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
     * Xác nhận đơn hàng
     * @param id
     * @return 
     */
    @RequestMapping(value = "confirmOrder")
    public String confirmOrder(@RequestParam("Id") int id){
       orderModel.confirmOrder(id);
       return "redirect:getAllOrder.htm"; 
    }
    /**
     * Lấy danh sách phản hồi
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
     * Xác nhận phản hồi
     * @param id
     * @return 
     */
      @RequestMapping(value = "updateFeeback")
    public String updateFeeback(@RequestParam("Id") int id){
       feebackModel.updateFeeback(id);
       return "redirect:getAllFeeback.htm"; 
    }
}
