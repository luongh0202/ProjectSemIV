<%-- 
    Document   : MyCart
    Created on : Aug 5, 2017, 5:07:04 PM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
    </head>
    <body>
        <h1>Thông tin giỏ hàng</h1>
         <table class="table table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:100px;text-align:center;">Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th style="width:150px">Giá lẻ</th>
                                        <th style="width:100px">Số lượng</th>
                                        <th style="width:150px">Tổng cộng</th>
                                       
                                    </tr>                  
                                </thead>
                                <tbody>
                                    <c:choose>
                                <c:when test="${listCart != null}">
                                <c:forEach items="${listCart})%>" var="cart">
                                    <tr>
                                        <td>
                                            <a href="productDetail.htm?${cart.product.productId}">

                                                <img title="${cart.product.productName}" src="/SpringFrameworks/jsp/Fontend/images/${cart.product.images}" class="img-fix3" >

                                            </a>
                                        </td>
                                        <td><a href="productDetail.htm?Id=${cart.product.productId}">${cart.product.productName}</a></td>
                                        <c:choose>
                                                    <c:when test="${product.discount== 0}">    
                                        <td>${cart.product.priceOutput}₫</td>
                                        <td><input  type="number" value="${cart.quantity}" min="1" class="input-control type_1" name="quantity" id="quantity"></td>
                                        <td><b>${Float.parseFloat(cart.product.priceOutput.replaceAll("[.]",""))*cart.quantity}₫</b></td>
                                        <td><a href="<%=request.getContextPath()%>/remove.htm?Id=${cart.product.productId}" data-toggle="tooltip" data-placement="top" title="Xóa"><i class="fa fa-trash" onclick="return confirm('Bạn muốn xóa?')"></i></a></td>
                                        </c:when>
                                        <c:otherwise>
                                             <td>${cart.product.priceDiscount}₫</td>
                                        <td><input  type="number" value="${cart.quantity}" min="1" class="input-control type_1" name="quantity" id="quantity"></td>
                                        <td><b>${Float.parseFloat(cart.product.priceDiscount.replaceAll("[.]",""))*cart.quantity}₫</b></td>
                                      
                                        </c:otherwise>
                                        </c:choose>
                                        </tr>
                                </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    
                                </c:otherwise>
                                    </c:choose>
                                        <tr>
                                            ${message}
                                        </tr>

                                </tbody>
                            </table>
    </body>
</html>