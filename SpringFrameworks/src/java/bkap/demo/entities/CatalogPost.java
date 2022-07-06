/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.entities;

/**
 *
 * @author LuongHoang
 */
public class CatalogPost {
    private int catalogPostId;
    private String catalogPostName;
    private boolean status;

    public int getCatalogPostId() {
        return catalogPostId;
    }

    public void setCatalogPostId(int catalogPostId) {
        this.catalogPostId = catalogPostId;
    }

    public String getCatalogPostName() {
        return catalogPostName;
    }

    public void setCatalogPostName(String catalogPostName) {
        this.catalogPostName = catalogPostName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
