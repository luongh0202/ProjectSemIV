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
        <script src="/SpringFrameworks/jsp/Admin/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/SpringFrameworks/jsp/Admin/js/jquery.min.js" type="text/javascript"></script>
    <script src="/SpringFrameworks/jsp/Admin/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="/SpringFrameworks/jsp/Admin/js/dataTables.jqueryui.js" type="text/javascript"></script>
    <link href="/SpringFrameworks/jsp/Admin/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <link href="/SpringFrameworks/jsp/Admin/css/dataTables.jqueryui.css" rel="stylesheet" type="text/css"/>
    <script src="/SpringFrameworks/jsp/Admin/js/count.js" type="text/javascript"></script>
      <script type="text/javascript">
    $(document).ready(function () {
        $('#order').dataTable({
           "pagingType": "full_numbers",
           "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
         });
    });
</script>

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

                        <li><span>Lịch sử mua hàng</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-account">
                <div class="container"> 
                
                        <h2 class="page-title">Danh sách đơn hàng</h2>
                       
                    <table id="order" class="table table-striped table-bordered" >
                                              <thead>
                                                <tr>
                                                
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên đơn hàng</th>
                                                  

                                                  
                                                    <th>Tổng tiền</th>
                                                    <th>Phương thức thanh toán</th>
                                                     <th>Ngày tạo</th>
                                                    <th>Ngày thanh toán</th>
                                                    <th class="hidden-480">Trạng thái</th>

                                                    <th></th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${listOrder}" var="order">
                                                <tr>
                                                
                                                    <td>
                                                        ${order.orderId}
                                                    </td>
                                                    <td>${order.orderName}</td>
                 
                                                    <td class="hidden-480">
                                                      ${order.totalAmount}
                                                    </td>
                                                       <td>${order.paymentMethod}</td>
                                                     <td>${order.created}</td>
                                                   <td>${order.paymentDate}</td>
                                                     <c:if test="${order.status == 1 }">
                                                    <td>
                                                      Đã thanh toán
                                                    </td>
                                                    </c:if>
                                                     <c:if test="${order.status == 2}">
                                                    <td>
                                                      Chưa thanh toán
                                                    </td>
                                                    </c:if>
                                                     <c:if test="${order.status == 3}">
                                                    <td>
                                                      Hoàn thành
                                                    </td>
                                                    </c:if>
                                                     
                                                    <td>
                                                        <div class="hidden-sm hidden-xs action-buttons">
                                                            <a class="blue" href="getOrderDetail.htm?Id=${order.orderId}" title="Xem chi tiết">
                                                                <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                            </a>

                                                           
                                                        </div>

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                                
                                            </tbody>
                                        </table>   
                    </div>
          
            </section> 
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
