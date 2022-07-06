<%-- 
    Document   : Banner
    Created on : Jun 9, 2017, 5:35:58 PM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bkap.demo.utils.Common"%>
<!doctype html>
<html lang="en"> 
    <jsp:include page="Head.jsp"></jsp:include>
    
    <style>
.pagination1 {
    display: inline-block;
}

.pagination1 a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination1 a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination1 a:hover:not(.active) {background-color: #ddd;}
</style>
    <body>
        <div class="fullLoading" style="display:none">
            <div class="cssload-ball"></div>
        </div>
    <jsp:include page="Menu.jsp"></jsp:include>
    <jsp:include page="Header.jsp"></jsp:include>
    <script src="/SpringFrameworks/jsp/Fontend/js/update.js" type="text/javascript"></script>

        <div class="breadcrumb">
            <div class="container">
                <ul class="list-unstyled">
                    <li><a href="homeFontend.htm">Trang chủ</a></li>
                    <li class="divide"><i class="fa fa-angle-right"></i></li>

                    <li><span>Tất cả sản phẩm</span></li>

                </ul>
            </div>
        </div>

        <section class="collection collection-grid">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-9 col-md-push-4 col-lg-push-3">

                        <div class="page-title" style="background-image:url('/SpringFrameworks/jsp/Fontend/images/bg-collection.jpg')">        
                            <h1>Tất cả sản phẩm</h1>
                        </div>

                   
                        
                        <div id="data">
                   <div class="collectionDisplay" >


                            <div class="row wrap-prod-grid">
                                <c:forEach items="${listProduct}" var="product">

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                                                    <c:choose>
                                                    <c:when test="${product.discount== 0}">    
                                             
                                                        <div class="product-grid  product-ajax-cart">

                                                            <div class="product-img">
                                                                <a href="productDetail.htm?Id=${product.productId}" title="${product.productName}">

                                                                    <img src="/SpringFrameworks/jsp/Fontend/images/${product.images}" data-original="/SpringFrameworks/jsp/Fontend/images/${product.images}" alt="${product.productName}" class="lazy img-product-ajax-cart primary-img img-fix">
                                                                    <noscript><img src="/SpringFrameworks/jsp/Fontend/images/${product.images}" alt="${product.productName}" class="img-fix"></noscript>      

                                                                    <img src="/SpringFrameworks/jsp/Fontend/images/${product.imageHover}" data-original="/SpringFrameworks/jsp/Fontend/images/${product.imageHover}" alt="${product.productName}" class="lazy secondary-img img-fix">

                                                                </a>
                                                            </div>
                                                            <h3 class="title-product-ajax-cart"><a href="productDetail.htm?Id=${product.productId}" title="${product.productName}">${product.productName}</a></h3>
                                                            <div class="price"> 
                                                                <span class="price-product-ajax-cart">${product.priceOutput}₫</span>
                                                            </div>
                                                            <form class="actions form-ajax-action clearfix" method="get" action="addCart.htm" enctype="multipart/form-data">

                                                                <input type="hidden" name="quantity" value="1">
                                                                  <input type="hidden" name="Id" value="${product.productId}">
                                                                <button class="btn-transparent pull-left" type="submit">Cho vào giỏ</button>
                                                                

                                                            </form>
                                                        </div>

                                                    </c:when>
                                                        <c:otherwise>

                                                        <div class="product-grid  product-ajax-cart">

                                                            <div class="level-pro-sale"><span>sale</span></div>

                                                            <div class="product-img">
                                                                <a href="productDetail.htm?Id=${product.productId}" title="${product.productName}">

                                                                    <img src="/SpringFrameworks/jsp/Fontend/images/${product.images}" data-original="/SpringFrameworks/jsp/Fontend/images/${product.images}" alt="${product.productName}" class="lazy img-product-ajax-cart primary-img img-fix">


                                                                    <img src="/SpringFrameworks/jsp/Fontend/images/${product.imageHover}" data-original="/SpringFrameworks/jsp/Fontend/images/${product.imageHover}" alt="${product.productName}" class="lazy secondary-img img-fix">


                                                                </a>
                                                            </div>
                                                            <h3 class="title-product-ajax-cart"><a href="/products/ao-denim-asos" title="${product.productName}">${product.productName}</a></h3>
                                                            <div class="price"><del>${product.priceOutput}đ</del> 
                                                                <span class="price-product-ajax-cart">${product.priceDiscount}đ</span>
                                                            </div>
                                                            <form class="actions form-ajax-action clearfix" method="get" action="addCart.htm" enctype="multipart/form-data">

                                                                <input type="hidden" name="quantity" value="1">
                                                                  <input type="hidden" name="Id" value="${product.productId}">
                                                                <button class="btn-transparent pull-left" type="submit">Cho vào giỏ</button>
                                                                                                                          </form>
                                                        </div>

                                                        </c:otherwise>

                                                   
                                                    </c:choose>
                                                </div>
                                </c:forEach>

                            </div> 
                            <div class="bn">
                            <div class="pagination1">
                               ${url}

                            </div>
                                </div>



                        </div>
                            
                        </div>
  
                    </div>
          
                    <div class="col-xs-12 col-sm-12 col-md-4 col-md-pull-8 col-lg-3 col-lg-pull-9">
                        <div class="widget_collection"> 

                            <div class="main-category has-icon">
                                <h2><i class="fa fa-bars"></i> Danh mục sản phẩm</h2>            

                                <!-- Desktop Category -->
                              

                                <ul class="list-unstyled hidden-xs hidden-sm desktop-category" id="pro">
                                <c:forEach items="${listCatalog}" var="catalog">

                                    <li class="has-subcate has-banner">
                                        <a href="#" class="${catalog.catalogId}">${catalog.catalogName}</a>
                                        <input type="hidden" class="form-control pro"  name="prof" value="${catalog.catalogId}">
                                       
                                    </li>


                                </c:forEach>

                                </ul>
                            </div>
                          
                        </div>
                        <script src='/SpringFrameworks/jsp/Fontend/js/search_filter.js' type='text/javascript'></script>
                      <jsp:include page="SearchProduct.jsp"></jsp:include>
                        <script>
                        var selectedSortby;
                        var collection_id;
                        var selectedViewData = "data";
                        var filter = new Bizweb.SearchFilter();
                        window.inPageCollection = true;

                        collection_id = "437151";
                        filter.addValue("collection", "collections", "437151", "AND");


                        </script>

                        


                        <div class="widget_collection">
                            <h2>Sản phẩm nổi bật</h2>
                            <ul class="list-unstyled list-products">
                                <c:forEach items="${listProductHot}" var="hot">
                                <li>
                                    <a class="image" href="productDetail.htm?Id=${hot.productId}" onclick="updateView(${hot.productId})">

                                        <img src="/SpringFrameworks/jsp/Fontend/images/${hot.images}" title="${hot.productName}" alt="${hot.productName}">

                                    </a>
                                    <div class="info">
                                        <h3 title="${hot.productName}"><a href="productDetail.htm?Id=${hot.productId}">${hot.productName}</a></h3>
                                        <p class="price">

                                            <span>${hot.priceOutput}đ</span>

                                        </p>
                                    </div>
                                </li>

                                </c:forEach>

                            </ul>        
                        </div>


                    </div>
                </div>
            </div>
        </section> 

        <jsp:include page="Footer.jsp"></jsp:include>



        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                var topLinklists = $('.top-linklists').html();
                $('#top-linklists-mobile').html(topLinklists);
            })
        </script>


        <script src='/SpringFrameworks/jsp/Fontend/js/jquery.lazyload.min.js' type='text/javascript'></script> 

        <script src='/SpringFrameworks/jsp/Fontend/js/plugin_necessary.js' type='text/javascript'></script>
        <script src='/SpringFrameworks/jsp/Fontend/js/main.js' type='text/javascript'></script>
    </body>
</html>