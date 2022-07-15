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
        <link href="/SpringFramework/jsp/Admin/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="/SpringFramework/jsp/Admin/js/sweetalert.min.js" type="text/javascript"></script>

        <script>
            function validate() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                if (username != "" && password != "") {
                    return true;
                } else {
                    if (username == "") {
                        alert("Ban phai nhap ten dang nhap.");
                        document.getElementById("username").focus();
                        return false;

                    }
                    if (password == "") {

                        alert("Ban phai nhap mat khau.");
                        document.getElementById("password").focus();
                        return false;
                    }
                }
            }
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

                        <li><span>Đăng nhập tài khoản</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-account">
                <div class="container"> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3">
                        <div id="login">
                            <div>
                            ${tb}
                        </div>
                        <h2 class="page-title">Đăng nhập</h2>
                        <p>Đăng nhập để nhận những ưu đãi đặc biệt từ cửa hàng chúng tôi.</p>
                        <f:form  action="loginFontend.htm" id='customer_login' commandName="account" onsubmit="return validate()" >
                            <input name='FormType' type='hidden' value='customer_login' />
                            <input name='acction' type='hidden' value='${acction}' />
                            <input name='utf8' type='hidden' value='true' />

                            <div class="userform">
                                <div class="form-group">
                                    <div class="message">
                                        ${message}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Tên đăng nhập: <span class="required">*</span></label>
                                    <f:input type="text" class="input-control type_1" id="username" path="userName"/>
                                </div>
                                <div class="form-group">
                                    <label>Mật khẩu: <span class="required">*</span></label>
                                    <f:input type="password" class="input-control type_1" id="password" path="password" />
                                </div>
                                <div class="form-group">

                                    <a href="initResgiter.htm" class="pull-right"> Đăng ký tài khoản</a>
                                </div>
                                <button class="button blue">Đăng nhập</button>
                            </div>
                        </f:form>
                    </div>
                    <div id="recover_password" style="display: none;">
                        <h2 class="page-title">Lấy lại mật khẩu</h2>
                        <p>Điền địa chỉ email bạn đã đăng ký vào ô bên dưới để chúng tôi xác nhận và gửi yêu cầu đổi mật khẩu cho bạn.</p>
                        <form accept-charset='UTF-8' action='recover.htm' id='recover_customer_password' >
                            <input name='FormType' type='hidden' value='recover_customer_password' />
                            <input name='utf8' type='hidden' value='true' />              


                            <div class="userform">
                                <div class="form-group">
                                    <label>Email: <span class="required">*</span></label>
                                    <input type="email" name="email" class="input-control type_1">
                                </div>
                                <div class="form-group clearfix">         
                                    <a href="javascript:;" class="pull-right" onclick="hideRecoverPasswordForm();
                                            return false;">Quay lại</a>
                                    <input type="submit" class="button blue pull-left" value="Gửi">
                                </div>
                            </div>  
                        </form>
                    </div>
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
