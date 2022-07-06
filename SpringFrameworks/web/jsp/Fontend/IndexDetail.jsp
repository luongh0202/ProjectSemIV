<%-- 
    Document   : IndexDetail
    Created on : Jun 5, 2017, 10:45:35 AM
    Author     : LuongHoang
--%>

<%@page import="bkap.demo.utils.Common"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="/SpringFrameworks/jsp/Fontend/js/update.js" type="text/javascript"></script>

<div class="tab-pane fade in active"  role="tabpanel">				  
    <c:forEach  items="${lsProduct}" var="pr">      

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
                                                            <form class="actions form-ajax-action clearfix" method="get" action="addCart.htm" enctype="multipart/form-data">

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

