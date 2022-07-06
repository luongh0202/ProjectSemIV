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
        function validate(){
            
            
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

                        <li><span>Thay đổi mật khẩu</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-account">
                <div class="container"> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3">
                        <h2 class="page-title">Thay đổi mật khẩu</h2>
                      
                    <f:form accept-charset='UTF-8' action="changePassword.htm" id='customer_register' commandName="resgiter" onsubmit="return validate()">
                            <input name='FormType' type='hidden' value='customer_register' />
                            <input name='utf8' type='hidden' value='true' />
                             
                            <div class="userform">
                                <div class="form-group message">
                                    ${message}
                                </div>
                              
                                <div class="form-group">
                                    <label>Mật khẩu cũ <span class="required">*</span></label>
                                    <f:input type="text" name="passwordOld" class="input-control type_1" id="userName" path="userName" />
                                </div>
                                <div class="form-group">
                                    <label>Mật khẩu mới <span class="required">*</span></label>
                                    <f:input type="password" name="passwordNew" class="input-control type_1" id="password" path="password" />
                                </div>
                              
                                
                                <div class="form-group">
                                    <label>Xác nhận mật khẩu <span class="required">*</span></label>
                                    <f:input type="text" name="passwordNewRe" class="input-control type_1" id="email" path="email" />
                                </div>
                               
                                                     
                                <button type="submit" class="button blue">Lưu</button> 
                            </div>
                        </f:form>
                    </div>
                </div>
            </section> 
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
