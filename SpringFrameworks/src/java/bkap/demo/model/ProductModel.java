/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.ImageLink;
import bkap.demo.entities.Product;
import bkap.demo.entities.ProductColor;
import bkap.demo.entities.ProductSize;
import bkap.demo.utils.Common;
import bkap.demo.utils.ConnectDB;
import bkap.demo.utils.Pagination;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author LuongHoang
 */
public class ProductModel {

    public HashMap getDataPagination(int page, int pageSize) {
        HashMap map1 = Pagination.getDataForPagination(page, pageSize, "Product", "ProductId", "getDataPagging.htm");
        return map1;
    }
   /**
    * Lấy danh sách tất cả sản phẩm
    * @return 
    */
    public List<Product> getAllProduct() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllProduct()}");
            rs = calla.executeQuery();
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
                 product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
  /**
   * Lấy thông tin sản phẩm theo mã sản phẩm
   * @param id
   * @return 
   */
    public Product getProductById(int id) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        Product product = new Product();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" {call getProductById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setCatalogId(rs.getInt("CatalogId"));
                product.setProductContent(rs.getString("ProductContent"));
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
                product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return product;
    }
    /**
     * Lấy danh sách sản phẩm liên quan hiển thị ở trang xem sản phẩm chi tiết
     * @param pro
     * @return 
     */
    public List<Product> getProductRefsren(Product pro) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductReferen(?,?)}");
            calla.setInt(1, pro.getProductId());
            calla.setInt(2, pro.getCatalogId());
            rs = calla.executeQuery();
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
                 product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Lấy danh sách ảnh của sản phẩm theo mã sản phẩm
     * @param id
     * @return 
     */
    public List<ImageLink> getImageProduct(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        List<ImageLink> list = new ArrayList<ImageLink>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getImageProduct(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                ImageLink imageLink = new ImageLink();
                imageLink.setImageLinkId(rs.getInt("ImageLinkId"));
                imageLink.setProductId(rs.getInt("ProductId"));
                imageLink.setImageLinkName(rs.getString("ImageLinkName"));
                imageLink.setStatus(rs.getBoolean("Status"));
                list.add(imageLink);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Lấy danh sách kích thước của sản phẩm theo mã sản phẩm
     * @param id
     * @return 
     */
    public List<ProductSize> getProductSize(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        List<ProductSize> listSize = new ArrayList<ProductSize>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductSize(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                ProductSize pSize = new ProductSize();
                pSize.setProductSizeId(rs.getInt("ProductSizeId"));
                pSize.setSizeId(rs.getInt("SizeId"));
                pSize.setProductId(rs.getInt("ProductId"));
                pSize.setSizeName(rs.getString("SizeName"));
                pSize.setStatus(rs.getBoolean("Status"));
                listSize.add(pSize);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return listSize;
    }
    /**
     * Lấy danh sách màu của sản phẩm theo mã sản phẩm
     * @param id
     * @return 
     */
    public List<ProductColor> getProductColor(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        List<ProductColor> listColor = new ArrayList<ProductColor>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductColor(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                ProductColor pColor = new ProductColor();
                pColor.setProductColorId(rs.getInt("ProductColorId"));
                pColor.setColorId(rs.getInt("ColorId"));
                pColor.setProductId(rs.getInt("ProductId"));
                pColor.setColorName(rs.getString("ColorName"));
                pColor.setNatation(rs.getString("Natation"));
                pColor.setStatus(rs.getBoolean("Status"));
                listColor.add(pColor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return listColor;
    }
    /**
     * Lấy danh sách sản phẩm theo mã danh mục sản phẩm hiển thị ở trang chủ
     * @param id
     * @return 
     */
    public List<Product> getProductByCatalog(int id) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductByCatalog(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
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
                product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Lấy danh sách sản phảm theo mã danh mục sản phẩm
     * @param id
     * @return 
     */
    public List<Product> getProductByCatalogId(int id) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductByCatalogId(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
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
                 product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Thêm mới sản phẩm
     * @param product
     * @return 
     */
    public boolean insertProduct(Product product) {
        SimpleDateFormat fomat = new SimpleDateFormat("yyyy-mm-dd");
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" {call insertProduct(?,?,?,?,?,?,?,?,?,?,?)}");
            calla.setString(1, product.getProductName());
            calla.setInt(2, product.getCatalogId());
            calla.setString(3, product.getProductContent());
            calla.setString(4, product.getProductContentDetail());
            calla.setString(5, product.getImages());
            calla.setString(6, product.getImageHover());
            calla.setFloat(7, Common.convertToFloat(product.getPriceInput()));
            calla.setFloat(8, Common.convertToFloat(product.getPriceOutput()));

            calla.setInt(9, product.getQuantity());
            calla.setInt(10, product.getProviderId());
            calla.setInt(11, product.getDiscount());

            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Sửa thông tin sản phẩm theo mã sản phẩm
     * @param product
     * @return
     * @throws ParseException 
     */
    public boolean updateProduct(Product product) throws ParseException {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateProduct(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            calla.setInt(1, product.getProductId());
            calla.setString(2, product.getProductName());
            calla.setInt(3, product.getCatalogId());
            calla.setString(4, product.getProductContent());
            calla.setString(5, product.getProductContentDetail());
            calla.setString(6, product.getImages());
            calla.setString(7, product.getImageHover());
            calla.setFloat(7, Common.convertToFloat(product.getPriceInput()));
            calla.setFloat(8, Common.convertToFloat(product.getPriceOutput()));

            calla.setInt(10, product.getQuantity());
            calla.setInt(11, product.getProviderId());
            calla.setInt(12, product.getDiscount());
            calla.setBoolean(13, product.isStatus());
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Xóa thông tin sản phẩm theo mã sản phẩm
     * @param id
     * @return 
     */
    public boolean deleteProduct(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call deleteProduct(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(CatalogModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    /**
     * Lấy danh sách sản phẩm mới
     * @return 
     */
    public List<Product> getProductNew() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductNew()}");

            rs = calla.executeQuery();
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
                product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Cập nhập trường xem sản phẩm theo mã sản phẩm
     * @param id
     * @return 
     */
    public boolean updateView(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;

        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateView(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Cập nhật luwotj mua sản phẩm theo mã sản phẩm
     * @param id
     * @return 
     */
    public boolean updateBuyItem(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;

        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateBuyItem(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    /**
     * Tìm kiểm sản phẩm theo tên sản phẩm
     * @param name
     * @return 
     */
    public List<Product> serachProduct(String name) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call searchProduct(?)}");
            calla.setString(1, name);
            rs = calla.executeQuery();
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
              product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Tìm kiếm sản phẩm theo mã nhà cung cấp
     * @param id
     * @return 
     */
    public List<Product> searchProductByProvider(int id) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call searchProductByProvider(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
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
                product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Tìm kiếm sản phẩm theo mã màu sắc
     * @param id
     * @return 
     */
    public List<Product> searchProductByColor(int id) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call searchProductByColor(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
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
                 product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Tìm kiếm sản phẩm theo khoảng giá từ start đến end
     * @param start
     * @param end
     * @return 
     */
    public List<Product> searchProductByPrice(float start, float end) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call searchProductByPrice(?,?)}");
            calla.setFloat(1, start);
            calla.setFloat(2, end);
            rs = calla.executeQuery();
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
                 product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    
    /**
     * Lấy danh sách sản phẩm hot
     * @return 
     */
    public List<Product> getProductHot() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductHot()}");
            rs = calla.executeQuery();
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
                product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput") * (float)(100 - rs.getInt("Discount")) / 100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Lấy danh sách sản phẩm khuyến mãi
     * @return 
     */
    public List<Product> getProductShare() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductShare()}");

            rs = calla.executeQuery();
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
                product.setPriceDiscount(Common.formatNumber(rs.getFloat("PriceOutput")*(float)(100) - rs.getInt("Discount")/100));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    /**
     * Lấy id của sản phẩm mới nhất
     * @return 
     */
     public int getProductIdNew(){
      Connection conn = null;
      CallableStatement calla = null;
      int result = 0;
         try {
             conn = ConnectDB.openConnect();
             calla = conn.prepareCall("{ call getProductIdNew(?)}");
             calla.registerOutParameter(1, Types.INTEGER);
             calla.executeUpdate();
             result = calla.getInt(1);
         } catch (SQLException ex) {
             Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
         } finally{
            ConnectDB.closeConnect(conn, calla);
         }
         return result;
      
    }
     /**
      * Thêm mới ảnh của sản phẩm
      * @param imageLink
      * @return 
      */
     public boolean insertImageLink(ImageLink imageLink){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
         try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertImageLink(?,?)}");
            calla.setInt(1, imageLink.getProductId());
            calla.setString(2, imageLink.getImageLinkName());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
     }
}
