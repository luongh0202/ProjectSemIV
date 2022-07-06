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
    <script src="/SpringFramework/jsp/Admin/js/jquery-2.1.4.min.js" type="text/javascript"></script>
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

                        <li><span>Thanh toán</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-account">
                <div class="container"> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3">
                        <h1>${messageSuc} </h1>
                        <h3>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</h3> <br/>
                        <a class="btn blue" href="<%=request.getContextPath()%>/homeFontend.htm">Tiếp tục mua hàng</a>
        
                    </div>
                </div>
            </section>


            <script>
                function showRecoverPasswordForm() {
                    document.getElementById('recover_password').style.display = 'block';
                    document.getElementById('login').style.display = 'none';
                }

                function hideRecoverPasswordForm() {
                    document.getElementById('recover_password').style.display = 'none';
                    document.getElementById('login').style.display = 'block';
                }

                // Allow deep linking to the recover password form
                if (window.location.hash == '#recover') {
                    showRecoverPasswordForm()
                }


            </script> 


        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
