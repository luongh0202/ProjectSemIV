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
  <!-- Mobile Category -->
  <a href="javascript:void(0);" class="btn-dropdown dropDownButton hidden-md hidden-lg" data-target="#mobile-category">Danh mục sản phẩm</a>
    <ul class="list-unstyled hidden-md hidden-lg mobile-category mobile-menu dropList" id="mobile-category" style="display:none">
      
        
        <li>
            <c:forEach items="${listCatalog}" var="catalog">
          <a href="getProductByCatalog.htm?Id=${catalog.catalogId}" >${catalog.catalogName}</a>
          
          <ul class="list-unstyled" style="display:none">
              <c:forEach  items="${map.get(catalog.catalogId)}" var="child">
              <li>
                 
                <a href="getProductByCatalog.htm?Id=${catalog.catalogId}">${child.catalogName}</a>
              </li>
              </c:forEach>
                
          </ul>
        </li>
                          
      
        
        </c:forEach>
                   
      
    </ul>
    <!-- Desktop Category -->
    <ul class="list-unstyled hidden-xs hidden-sm desktop-category">
      
        
    <c:forEach items="${listCatalog}" var="catalog">
         
        <li class="has-subcate has-banner">
          <a href="getProductByCatalog.htm?Id=${catalog.catalogId}">${catalog.catalogName}</a>
          
          
          <div class="subcate row">
            <div class="background"></div>
            
            <div class="col-md-12 col-lg-9">
              <div class="row">
                  
		 <c:forEach  items="${map.get(catalog.catalogId)}" var="child">		  
                  <div class="col-md-4">
                    <h3 class="text-overflow" title="${child.catalogName}"><a href="getProductByCatalog.htm?Id=${child.catalogId}">${child.catalogName}</a></h3>

                  </div>
                 </c:forEach>

              </div>
            </div>
            
          </div>
		  
        </li>
        
      
    </c:forEach>
      
    </ul>
</div>
<script>
  $(document).ready(function(){
    
    $('.desktop-category>li:eq(0)').children('.subcate').append('<div class="hidden-md col-lg-3 no-padding"><a href="/do-nam"><img src="/SpringFrameworks/jsp/Fontend/images/banner-subcate-1.jpg" class="img-fix1" alt="Banner 1"></a></div>');
    
    
    $('.desktop-category>li:eq(1)').children('.subcate').append('<div class="hidden-md col-lg-3 no-padding"><a href="/do-nu"><img src="/SpringFrameworks/jsp/Fontend/images/banner-subcate-2.jpg" class="img-fix1" alt="Banner 2"></a></div>');
    
    
    $('.desktop-category>li:eq(2)').children('.subcate').append('<div class="hidden-md col-lg-3 no-padding"><a href="/do-tre-em"><img src="/SpringFrameworks/jsp/Fontend/images/banner-subcate-3.jpg" class="img-fix1" alt=""></a></div>');
    
    
    $('.desktop-category>li:eq(3)').children('.subcate').append('<div class="hidden-md col-lg-3 no-padding"><a href="/giay-nam"><img src="/SpringFrameworks/jsp/Fontend/images/banner-subcate-4.jpg" class="img-fix1" alt=""></a></div>');
    
    
    $('.desktop-category>li:eq(4)').children('.subcate').append('<div class="hidden-md col-lg-3 no-padding"><a href="/giay-nu"><img src="/SpringFrameworks/jsp/Fontend/images/banner-subcate-5.jpg" class="img-fix1" alt=""></a></div>');
    
    
    $('.desktop-category>li:eq(5)').children('.subcate').append('<div class="hidden-md col-lg-3 no-padding"><a href="/phu-kien"><img src="/SpringFrameworks/jsp/Fontend/images/banner-subcate-6.jpg" class="img-fix1" alt=""></a></div>');
    
    
    $('.desktop-category>li:eq(6)').children('.subcate').append('<div class="hidden-md col-lg-3 no-padding"><a href="/tui-xach"><img src="image/banner-subcate-7.jpg" class="img-fix1" alt=""></a></div>');
    
    
    
    
  });
</script>
      </div>
    
      
    
    </div>
  </div>
</section>
