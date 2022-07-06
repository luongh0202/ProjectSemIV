/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.model;

import bkap.demo.entities.CatalogPost;
import bkap.demo.entities.Post;
import bkap.demo.utils.ConnectDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LuongHoang
 */
public class PostModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public List<Post> getAllPost(){
        
        Connection conn= null;
        CallableStatement calla = null;
        List<Post> list = new ArrayList<Post>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllPost()}");          
            rs =  calla.executeQuery();
            while(rs.next()){
                Post post = new Post();
                post.setPostId(rs.getInt("PostId"));
                post.setPostTitle(rs.getString("PostTitle"));
                post.setCatalogPostId(rs.getInt("CatalogPostId"));
                post.setContent(rs.getString("Content"));
                post.setContentDetail(rs.getString("ContentDetail"));
                post.setImages(rs.getString("Images"));
                if (rs.getDate("Created") != null) {
                    post.setCreated(fomat.format(rs.getDate("Created")));
                }
                post.setStatus(rs.getBoolean("Status"));
                list.add(post);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
         return list;
    }
    public List<Post> getPostNew(){
        
        Connection conn= null;
        CallableStatement calla = null;
        List<Post> list = new ArrayList<Post>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getPostNew()}");          
            rs =  calla.executeQuery();
            while(rs.next()){
                Post post = new Post();
                post.setPostId(rs.getInt("PostId"));
                post.setPostTitle(rs.getString("PostTitle"));
                post.setCatalogPostId(rs.getInt("CatalogPostId"));
                post.setContent(rs.getString("Content"));
                post.setContentDetail(rs.getString("ContentDetail"));
                post.setImages(rs.getString("Images"));
                if (rs.getDate("Created") != null) {
                    post.setCreated(fomat.format(rs.getDate("Created")));
                }
                post.setStatus(rs.getBoolean("Status"));
                list.add(post);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
         return list;
    }
     public List<Post> getPostRef(int id, int idCa){
        
        Connection conn= null;
        CallableStatement calla = null;
        List<Post> list = new ArrayList<Post>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getPostRef(?,?)}");    
            calla.setInt(1, id);
            calla.setInt(2, idCa);
            rs =  calla.executeQuery();
            while(rs.next()){
                Post post = new Post();
                post.setPostId(rs.getInt("PostId"));
                post.setPostTitle(rs.getString("PostTitle"));
                post.setCatalogPostId(rs.getInt("CatalogPostId"));
                post.setContent(rs.getString("Content"));
                post.setContentDetail(rs.getString("ContentDetail"));
                post.setImages(rs.getString("Images"));
                if (rs.getDate("Created") != null) {
                    post.setCreated(fomat.format(rs.getDate("Created")));
                }
                post.setStatus(rs.getBoolean("Status"));
                list.add(post);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
         return list;
    }
    public boolean insertPost(Post post){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
          
        try {   
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertPost(?,?,?,?,?,?)}");
            calla.setString(1, post.getPostTitle());
            calla.setString(2, post.getContent());
            calla.setString(3, post.getContentDetail());
            calla.setString(4, post.getImages());
            calla.setInt(5, post.getCatalogPostId());
            calla.setInt(6, post.getDisplayNumber());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
   public boolean updatePost(Post post){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
          
        try {   
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updatePost(?,?,?,?,?,?,?,?)}");
            calla.setInt(1, post.getPostId());
            calla.setString(2, post.getPostTitle());
            calla.setString(3, post.getContent());
            calla.setString(4, post.getContentDetail());
            calla.setString(5, post.getImages());
            calla.setInt(6, post.getCatalogPostId());
            calla.setInt(7, post.getDisplayNumber());
            calla.setBoolean(8, post.isStatus());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
   }
   public boolean deletePost(int id){
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call deletePost(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
   }
   public Post getPostById(int id){
         Connection conn = null;
         CallableStatement calla = null;
         ResultSet rs ;
         Post post = new Post();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getPostById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while(rs.next()){
                post.setPostId(rs.getInt("PostId"));
                post.setPostTitle(rs.getString("PostTitle"));
                post.setCatalogPostId(rs.getInt("CatalogPostId"));
                post.setContent(rs.getString("Content"));
                post.setContentDetail(rs.getString("ContentDetail"));
                post.setImages(rs.getString("Images"));
                if (rs.getDate("Created") != null) {
                    post.setCreated(fomat.format(rs.getDate("Created")));
                }
                post.setStatus(rs.getBoolean("Status"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return post;
   }
   public List<CatalogPost> getAllCatalogPost(){
       Connection conn = null;
       CallableStatement calla = null;
       ResultSet rs;
       List<CatalogPost> list = new ArrayList<CatalogPost>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllCatalogPost()}");
            rs = calla.executeQuery();
            while (rs.next()) {
                CatalogPost catalogPost = new CatalogPost();
                catalogPost.setCatalogPostId(rs.getInt("CatalogPostId"));
                catalogPost.setCatalogPostName(rs.getString("CatalogPostName"));
                catalogPost.setStatus(rs.getBoolean("Status"));
                list.add(catalogPost);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
   }
     public List<Post> getAllPostByCatalogPostId(int id){
        
        Connection conn= null;
        CallableStatement calla = null;
        List<Post> list = new ArrayList<Post>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllPostByCatalogPostId(?)}");    
            calla.setInt(1, id);
            rs =  calla.executeQuery();
            while(rs.next()){
                Post post = new Post();
                post.setPostId(rs.getInt("PostId"));
                post.setPostTitle(rs.getString("PostTitle"));
                post.setCatalogPostId(rs.getInt("CatalogPostId"));
                post.setContent(rs.getString("Content"));
                post.setContentDetail(rs.getString("ContentDetail"));
                post.setImages(rs.getString("Images"));
                if (rs.getDate("Created") != null) {
                    post.setCreated(fomat.format(rs.getDate("Created")));
                }
                post.setStatus(rs.getBoolean("Status"));
                list.add(post);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PostModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectDB.closeConnect(conn, calla);
        }
         return list;
    }
}
