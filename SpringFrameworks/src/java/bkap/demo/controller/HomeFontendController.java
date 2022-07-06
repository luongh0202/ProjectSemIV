/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.controller;

import bkap.demo.entities.Banner;
import bkap.demo.entities.Catalog;
import bkap.demo.entities.CatalogPost;
import bkap.demo.entities.Product;
import bkap.demo.model.BannerModel;
import bkap.demo.model.CatalogModel;
import bkap.demo.model.PostModel;
import bkap.demo.model.ProductModel;
import bkap.demo.model.UserModel;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author LuongHoang
 */
@Controller
public class HomeFontendController {

    private ProductModel productModel;
    private CatalogModel catalogModel;
    private UserModel userModel;
    private BannerModel bannerModel;
    private PostModel postModel;

    public HomeFontendController() {
        productModel = new ProductModel();
        catalogModel = new CatalogModel();
        userModel = new UserModel();
        bannerModel = new BannerModel();
        postModel = new PostModel();
    }

    /**
     * Hiện thị thông tin ở trang chủ
     *
     * @return
     */
    @RequestMapping(value = "homeFontend")
    public ModelAndView homeFontend() {
        ModelAndView model = new ModelAndView("Fontend/Index");
        List<Catalog> listCatalog = catalogModel.getCatalogRoot();
        Map<Integer, List<Catalog>> map = new HashMap<Integer, List<Catalog>>();
        Map<Integer, List<Product>> mapPr = new HashMap<Integer, List<Product>>();
        List<Banner> listBanner = bannerModel.getBanner();
        for (Catalog lsCatalog : listCatalog) {
            List<Catalog> list = catalogModel.getCatalogChild(lsCatalog.getCatalogId());
            List<Product> listPr = productModel.getProductByCatalog(catalogModel.getCatalogChildFirst(lsCatalog.getCatalogId()));
            map.put(lsCatalog.getCatalogId(), list);
            mapPr.put(lsCatalog.getCatalogId(), listPr);
        }
        List<CatalogPost> listCatalogPost = postModel.getAllCatalogPost();
        model.getModelMap().put("listCatalogPost", listCatalogPost);
        model.getModelMap().put("map", map);
        model.getModelMap().put("mapPr", mapPr);
        model.getModelMap().put("listCatalog", listCatalog);
        model.getModelMap().put("listBanner", listBanner);
        return model;
    }

    /**
     * Lấy danh sách danh mục con theo mã danh mục cha
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getChild")
    public ModelAndView getChild(@RequestParam("CatalogId") int id) {
        ModelAndView model = new ModelAndView("Fontend/Index");
        List<Catalog> list = catalogModel.getCatalogChild(id);
        model.getModelMap().put("lsChild", list);
        return model;
    }

    /**
     * Lấy danh sách sản phẩm theo mã danh mục
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getProductByCatalogId")
    public ModelAndView getProductByCatalog(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("Fontend/IndexDetail");
        List<Product> lsProduct = productModel.getProductByCatalog(id);
        model.getModelMap().put("lsProduct", lsProduct);
        return model;
    }

}
