<%-- 
    Document   : Index
    Created on : Jun 5, 2017, 9:26:03 AM
    Author     : LuongHoang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <jsp:include page="Head.jsp"></jsp:include>

        <body>
            <div class="fullLoading" style="display:none">
                <div class="cssload-ball"></div>
            </div>
        <jsp:include page="Menu.jsp"></jsp:include>
        <jsp:include page="Header.jsp"></jsp:include>
        <jsp:include page="Slide.jsp"></jsp:include>  

        <c:forEach items="${listCatalog}" var="catalog">
            <section class="big-collection s${catalog.displayNumber}" id="s${catalog.displayNumber}">

                <div class="container">
                    <div class="collection-area">
                        <div class="row">
                            <div class="col-md-4 col-lg-3">
                                <div class="bc-menu">
                                    <h2 class="bc-title">${catalog.catalogName}</h2>
                                    <ul class="list-unstyled tab-navigation tab-index" data-display="6" role="tablist" id="catalog">
                                        <c:forEach  items="${map.get(catalog.catalogId)}" var="child">
                                            <li role="presentation"  ><a href="#" data-collection="quan-nam" class="${child.catalogId}" id="${catalog.displayNumber}" aria-controls="taba1" role="tab" data-toggle="tab">${child.catalogName} </a></li>
                                            </c:forEach>
                                    </ul>

                                    <div class="banner use-lazy hidden-xs hidden-sm">

                                        <a href="getProductByCatalog.htm?Id=${catalog.catalogId}">
                                            <img src="/SpringFrameworks/jsp/Fontend/images/${catalog.images}" data-original="/SpringFrameworks/jsp/Fontend/images/${catalog.images}" class="lazy img-fix1" alt="Đồ nam">

                                        </a>

                                    </div>

                                </div>
                            </div>
                            <div class="col-md-8 col-lg-9">
                                <div class="row">
                                    <div class="tab-content" id="taba${catalog.displayNumber}">              

                                        <div class="tab-pane fade in active"  role="tabpanel">				  
                                            <c:forEach  items="${mapPr.get(catalog.catalogId)}" var="pr">      

                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                                                    <c:choose>
                                                    <c:when test="${pr.discount== 0}">    
                                             
                                                        <div class="product-grid  product-ajax-cart">

                                                            <div class="product-img">
                                                                <a href="productDetail.htm?Id=${pr.productId}" title="${pr.productName}">

                                                                    <img src="/SpringFrameworks/jsp/Fontend/images/${pr.images}" data-original="/SpringFrameworks/jsp/Fontend/images/${pr.images}" alt="${pr.productName}" class="lazy img-product-ajax-cart primary-img img-fix">
                                                                    <noscript><img src="/SpringFrameworks/jsp/Fontend/images/${pr.images}" alt="${pr.productName}" class="img-fix"></noscript>      

                                                                    <img src="/SpringFrameworks/jsp/Fontend/images/${pr.imageHover}" data-original="/SpringFrameworks/jsp/Fontend/images/${pr.imageHover}" alt="${pr.productName}" class="lazy secondary-img img-fix">

                                                                </a>
                                                            </div>
                                                            <h3 class="title-product-ajax-cart"><a href="productDetail.htm?Id=${pr.productId}" title="${pr.productName}">${pr.productName}</a></h3>
                                                            <div class="price"> 
                                                                <span class="price-product-ajax-cart">${pr.priceOutput}₫</span>
                                                            </div>
                                                            <form class="actions form-ajax-action clearfix" method="get" action="addCart.htm?Id=${pr.productId}" enctype="multipart/form-data">

                                                                <input type="hidden" name="quantity" value="1">
                                                                 <input type="hidden" name="Id" value="${pr.productId}">
                                                                <button class="btn-transparent pull-left" type="submit">Cho vào giỏ</button>
                                                                

                                                            </form>
                                                        </div>

                                                    </c:when>
                                                        <c:otherwise>

                                                        <div class="product-grid  product-ajax-cart">

                                                            <div class="level-pro-sale"><span>sale</span></div>

                                                            <div class="product-img">
                                                                <a href="productDetail.htm?Id=${pr.productId}" title="${pr.productName}">

                                                                    <img src="/SpringFrameworks/jsp/Fontend/images/${pr.images}" data-original="/SpringFrameworks/jsp/Fontend/images/${pr.images}" alt="${pr.productName}" class="lazy img-product-ajax-cart primary-img img-fix">


                                                                    <img src="/SpringFrameworks/jsp/Fontend/images/${pr.imageHover}" data-original="/SpringFrameworks/jsp/Fontend/images/${pr.imageHover}" alt="${pr.productName}" class="lazy secondary-img img-fix">


                                                                </a>
                                                            </div>
                                                            <h3 class="title-product-ajax-cart"><a href="/products/ao-denim-asos" title="${pr.productName}">${pr.productName}</a></h3>
                                                            <div class="price"><del>${pr.priceOutput}đ</del> 
                                                                <span class="price-product-ajax-cart">${pr.priceDiscount}đ</span>
                                                            </div>
                                                            <form class="actions form-ajax-action clearfix" method="get" action="addCart.htm?Id=${pr.productId}" enctype="multipart/form-data">

                                                                <input type="hidden" name="quantity" value="1">
                                                                 <input type="hidden" name="Id" value="${pr.productId}">
                                                                <button class="btn-transparent pull-left" type="submit">Cho vào giỏ</button>
                                                                

                                                            </form>
                                                        </div>

                                                        </c:otherwise>

                                                   
                                                    </c:choose>
                                                </div>

                                                </c:forEach>
                                       




                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
        </c:forEach>



        <div class="nav-fixed-left hidden-xs hidden-sm" id="scrollspy">
            <ul class="nav nav-pills nav-stacked">    

                <li class="first">
                    <a href="#s1" data-href="#s1">
                        <img src="/SpringFrameworks/jsp/Fontend/images/icon_nav_1.png" alt="">        
                    </a>
                    <span class="tooltip">Đồ nam</span>
                </li>   


                <li class="second">
                    <a href="#s2" data-href="#s2">
                        <img src="/SpringFrameworks/jsp/Fontend/images/icon_nav_2.png" alt="">        
                    </a>
                    <span class="tooltip">Đồ nữ</span>
                </li>


                <li class="third">
                    <a href="#s3" data-href="#s3">
                        <img src="/SpringFrameworks/jsp/Fontend/images//icon_nav_3.png" alt="">        
                    </a>
                    <span class="tooltip">Đồ trẻ em</span>
                </li>


                <li class="fourth">
                    <a href="#s4" data-href="#s4">
                        <img src="/SpringFrameworks/jsp/Fontend/images/icon_nav_4.png" alt="">        
                    </a>
                    <span class="tooltip">Giày nữ</span>
                </li>


                <li class="fiveth">
                    <a href="#s5" data-href="#s5">
                        <img src="/SpringFrameworks/jsp/Fontend/images/icon_nav_5.png" alt="">        
                    </a>
                    <span class="tooltip">Giày nam</span>
                </li>



                <li class="sixth">
                    <a href="#s6" data-href="#s6">
                        <img src="/SpringFrameworks/jsp/Fontend/images/icon_nav_6.png" alt="">        
                    </a>
                    <span class="tooltip">Túi xách</span>
                </li>


                <li class="seventh">
                    <a href="#s7" data-href="#s7">
                        <img src="/SpringFrameworks/jsp/Fontend/images/icon_nav_7.png" alt="">        
                    </a>
                    <span class="tooltip">Phụ kiện</span>
                </li>

            </ul>
        </div>


        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
