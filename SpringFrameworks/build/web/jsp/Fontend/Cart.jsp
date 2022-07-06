<%-- 
    Document   : Index
    Created on : Jun 5, 2017, 9:26:03 AM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <jsp:include page="Head.jsp"></jsp:include>
        <body>
            <div class="fullLoading" style="display:none">
                <div class="cssload-ball"></div>
            </div>
        <jsp:include page="Header.jsp"></jsp:include>

            <div class="breadcrumb">
                <div class="container">
                    <ul class="list-unstyled">
                        <li><a href="/">Trang chủ</a></li>
                        <li class="divide"><i class="fa fa-angle-right"></i></li>

                        <li><span>Giỏ hàng</span></li>

                    </ul>
                </div>
            </div>
            <section class="page-cart"> 
                <div class="container">
                    <h1 class="page-title">Giỏ hàng</h1>
                <c:if test="${listCart == null}">
                    <h4> Không có sản phẩm trong giỏ hàng</h4>
                </c:if>
                <c:if test="${listCart !=  null}">
                    <c:if test="${listCart.size() == 0}">
                        <h4> Không có sản phẩm trong giỏ hàng</h4>
                    </c:if>
                    <c:if test="${listCart.size() > 0}">
                    <form action="update.htm" enctype="multipart/form-data">
                        <div class="table-responsive">
                            <table class="table table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:100px;text-align:center;">Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th></th>
                                        <th style="width:150px">Giá lẻ</th>
                                        <th style="width:100px">Số lượng</th>
                                        <th style="width:150px">Tổng cộng</th>
                                        <th style="width:50px">Xóa</th>
                                    </tr>                  
                                </thead>
                                <tbody>
                                <c:forEach items="${listCart}" var="cart">
                                    <tr>
                                        <td>
                                            <a href="productDetail.htm?${cart.product.productId}">

                                                <img title="${cart.product.productName}" src="/SpringFrameworks/jsp/Fontend/images/${cart.product.images}" class="img-fix3" >

                                            </a>
                                        </td>
                                        <td><a href="productDetail.htm?Id=${cart.product.productId}">${cart.product.productName}</a></td>
                                        <td>${cart.note}</td>
                                        <c:choose>
                                                    <c:when test="${product.discount== 0}">    
                                        <td>${cart.product.priceOutput}₫</td>
                                        <td><input  type="number" value="${cart.quantity}" min="1" class="input-control type_1" name="quantity" id="quantity"></td>
                                        <td> <fmt:formatNumber type="number"  maxFractionDigits="3" value='${Float.parseFloat(cart.product.priceOutput.replaceAll("[.]",""))*cart.quantity}' /></td></td>
                                        <td><a href="<%=request.getContextPath()%>/remove.htm?Id=${cart.product.productId}" data-toggle="tooltip" data-placement="top" title="Xóa"><i class="fa fa-trash" onclick="return confirm('Bạn muốn xóa?')"></i></a></td>
                                        </c:when>
                                        <c:otherwise>
                                             <td>${cart.product.priceDiscount}₫</td>
                                        <td><input  type="number" value="${cart.quantity}" min="1" class="input-control type_1" name="quantity" id="quantity"></td>
                                        <td>
                                            <fmt:formatNumber type="number"  maxFractionDigits="3" value='${Float.parseFloat(cart.product.priceDiscount.replaceAll("[.]",""))*cart.quantity}' /></td>
                                        <td><a href="<%=request.getContextPath()%>/remove.htm?Id=${cart.product.productId}" data-toggle="tooltip" data-placement="top" title="Xóa"><i class="fa fa-trash" onclick="return confirm('Bạn muốn xóa?')"></i></a></td>
                                        </c:otherwise>
                                        </c:choose>
                                        </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <div class="button-cart">
                            <button class="button blue" type="submit" name="update">Cập nhật</button>
                            <a href="getAllProduct.htm" class="button transparent">Tiếp tục mua hàng</a>
                        </div>
                    </form>
                    
                    <div class="cart_total">
                        <h2>Tổng cộng</h2>
                        <table class="total-table">
                            <tr>
                                <td>Tạm tính</td>
                                <td>${total}₫</td>
                            </tr>                                    
                        </table>
                        <a href="initPayment.htm" class="button blue">Tiến hành thanh toán</a>
                    </div>
                         </c:if>
                </c:if>

                </div>
            </section>  



        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
