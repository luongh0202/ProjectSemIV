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
            var cardNumber = document.getElementById("cardNumber").value;
           
           
            if( cardNumber != ""){
                    return true;
                
            } else {
                  
                    alert("Bạn phải nhập mã thẻ.");
                    document.getElementById("cardNumber").focus();
                    return false;
                
               
              
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

                        <li><span>Nạp thẻ</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-account">
                <div class="container"> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3">
                        <h2 class="page-title">Nạp tiền</h2>
                        <p>Nạp tiền để có thể mua hàng của chúng tôi</p>
                    <f:form accept-charset='UTF-8' action="addPackage.htm" id='customer_register' commandName="card" onsubmit="return validate()">
                            <input name='FormType' type='hidden' value='customer_register' />
                            <input name='utf8' type='hidden' value='true' />
                             
                            <div class="userform">
                                <div class="form-group message">
                                    ${tb}
                                </div>
  
                                <div class="form-group">
                                    <label>Mã thẻ cào: <span class="required">*</span></label>
                                    <f:input type="text" name="cardNumber" class="input-control type_1" id="cardNumber" path="cardNumber" />
                                </div>
                         
                                                     
                                <button type="submit" class="button blue">Tiếp tục</button> 
                            </div>
                        </f:form>
                    </div>
                </div>
            </section> 
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
