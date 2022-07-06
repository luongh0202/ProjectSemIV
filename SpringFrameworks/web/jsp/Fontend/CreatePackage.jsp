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
     <script>
        function validate(){
            var packageName = document.getElementById("packageName").value;
           
            if( packageName != "" ){
                    return true;
                
            } else {
                  if( packageName == ""){
                    alert("Bạn phải nhập tên ví tiền.");
                    document.getElementById("packageName").focus();
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

                        <li><span>Đăng kí thẻ nạp</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-account">
                <div class="container"> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3">
                        <h2 class="page-title">Đăng ký</h2>
                        <p>Đăng ký thẻ nạp để mua hàng dễ hơn</p>
                    <f:form accept-charset='UTF-8' action="createPackage.htm" id='customer_register' commandName="package" onsubmit="return validate()">
                            <input name='FormType' type='hidden' value='customer_register' />
                            <input name='action' type='hidden' value='package' />
                            <input name='utf8' type='hidden' value='true' />
                             
                            <div class="userform">
                                <div class="form-group message">
                                    ${message}
                                </div>
                              
                                <div class="form-group">
                                    <label>Tên ví tiền: <span class="required">*</span></label>
                                    <f:input type="text" name="packageName" class="input-control type_1" id="packageName" path="packageName" />
                                </div>
                                                 
                                <button type="submit" class="button blue">Đăng ký</button> <a href="initAddPackage.htm" class="pull-right">Bạn đã có ví tiền</a>
                            </div>
                        </f:form>
                    </div>
                </div>
            </section> 
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
