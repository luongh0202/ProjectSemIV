<%-- 
    Document   : Slide
    Created on : Jun 5, 2017, 10:08:02 AM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <section class="main-top">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
        <div class="main-category has-icon">
  <h2 class="hidden-xs hidden-sm"><i class="fa fa-bars"></i> Danh mục sản phẩm</h2>            

    <!-- Desktop Category -->
    <ul class="list-unstyled hidden-xs hidden-sm desktop-category">
      
        
    <c:forEach items="${listCatalog}" var="catalog">
         
        <li class="has-subcate has-banner">
          <a href="getProductByCatalog.htm?Id=${catalog.catalogId}">${catalog.catalogName}</a>
 
        </li>
        
      
    </c:forEach>
      
    </ul>
</div>

      </div>
      <div class="col-xs-12 col-sm-12 col-md-8 col-lg-7 no-padding-md no-padding-lg ml-negative-md ml-negative-lg">
        <div class="slideshow">
            <c:forEach items="${listBanner}" var="banner">
          <a href="#">
            <img src="/SpringFrameworks/jsp/Fontend/images/${banner.images}" alt="Slideshow" class="img-fix1">
          </a>
          
            </c:forEach>
        
          
          
          
          
        </div>
      </div>
      
      <div class="col-lg-2 no-padding-lg hidden-xs hidden-sm hidden-md">          
        <a href="/dep-nu">
        <img src="/SpringFrameworks/jsp/Fontend/images/right-banner.jpg" class="img-fix1" alt="Dép nữ">
        </a>          
      </div>
      
    </div>
  </div>
</section>
