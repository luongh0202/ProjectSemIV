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

                        <li><span>Thông tin người dùng</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-account">
                <div class="container"> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3">
                        <h2 class="page-title">Thông tin tài khoản</h2>
                    
                    <f:form accept-charset='UTF-8' action="resgiter.htm" id='customer_register' commandName="myAccount" onsubmit="return validate()">
                            <input name='FormType' type='hidden' value='customer_register' />
                            <input name='utf8' type='hidden' value='true' />
                             
                            <div class="userform">
                                <div class="form-group message">
                                    ${message}
                                </div>
                               <div class="form-group">
                                
                                    <f:input type="hidden" name="userId" class="input-control type_1" id="userId" path="userId" />
                                </div>
                                <div class="form-group">
                                    <label>Tên đăng nhập: <span class="required">*</span></label>
                                    <f:input type="text" name="FirstName" class="input-control type_1" id="userName" path="userName" />
                                </div>
                              
                              
                                
                                <div class="form-group">
                                    <label>Email: <span class="required">*</span></label>
                                    <f:input type="text" name="email" class="input-control type_1" id="email" path="email" />
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ: <span class="required">*</span></label>
                                    <f:input type="text" name="LastName" class="input-control type_1" id="address" path="address" />
                                </div>
                               <div class="form-group">
                                    <label>Số điện thoại: <span class="required">*</span></label>
                                    <f:input type="text" name="LastName" class="input-control type_1" id="phone" path="phone" />
                                </div>    
                                  <div class="form-group">
                                    <label>Ngày tạo: <span class="required">*</span></label>
                                    <f:input type="text" name="created" class="input-control type_1" id="created" path="created" />
                                </div>
                                <a href="initUpdateAccount.htm" class="button blue">Sửa thông tin</a>
                                <a href="initAddPackage.htm" class="button blue">Nạp tiền</a>
                           
                            </div>
                        </f:form>
                    </div>
                </div>
            </section> 
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
