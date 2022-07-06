<%-- 
    Document   : Index
    Created on : Jun 5, 2017, 9:26:03 AM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <jsp:include page="Head.jsp"></jsp:include>
    <link href="/SpringFramework/jsp/Admin/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
     <link href="/SpringFramework/jsp/Admin/css/sweetalert.css" rel="stylesheet" type="text/css"/>
    <script src="/SpringFramework/jsp/Admin/js/sweetalert.min.js" type="text/javascript"></script>
     
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

                        <li><span>Chi tiết đơn hàng</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-account">
                <div class="container"> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3">
                        <h2 class="page-title">Chi tiết đơn hàng</h2>
                       
                      <table id="order" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                               <table id="orderDetail" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                <thead>
                                                <th>Mã hóa đơn</th>
                                                <th>Sản phẩm</th>    
                                                <th></th>
                                                <th>Số lượng</th>
                                                 <th>Tổng tiền</th>   
                                                
                                                <th></th>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="orderDetail" items="${listOrderDetail}">
                                                    <tr>
                                                        <td>${orderDetail.orderId}</td>
                                                        <td>${orderDetail.productName}</td>
                                                        <td>${orderDetail.note}</td>
                                                        <td>${orderDetail.quantity}</td>
                                                        <td>${orderDetail.amount}</td>
                                                      
                                                       
                                                    </tr>  
                                                </c:forEach>
                                            </tbody>
                                        </table>   
                    </div>
                </div>
            </section> 
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
