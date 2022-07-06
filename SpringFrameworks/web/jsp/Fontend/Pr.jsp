<%-- 
    Document   : Pr
    Created on : Jun 15, 2017, 9:33:06 PM
    Author     : LuongHoang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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