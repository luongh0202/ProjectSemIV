<%-- 
    Document   : InsertCatalog
    Created on : Jun 9, 2017, 6:30:29 AM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <jsp:include page="Head.jsp"></jsp:include>

        <link href="/SpringFrameworks/jsp/Admin/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="/SpringFrameworks/jsp/Admin/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="/SpringFrameworks/jsp/Admin/js/tinymce/tinymce.min.js" type="text/javascript" charset="utf-8" ></script>
        <script src="/SpringFrameworks/jsp/ckeditor/ckeditor.js" type="text/javascript"></script>
        <script src="/SpringFrameworks/jsp/ckfinder/ckfinder.js" type="text/javascript"></script>
     
        <body class="no-skin">
        <jsp:include page="Header.jsp"></jsp:include>

            <div class="main-container" id="main-container">
                <script type="text/javascript">
                    try {
                        ace.settings.check('main-container', 'fixed')
                    } catch (e) {
                    }
                </script>

            <jsp:include page="Menu.jsp"></jsp:include>


                <div class="main-content">
                    <div class="main-content-inner">
                        <div class="breadcrumbs" id="breadcrumbs">
                            <script type="text/javascript">
                                try {
                                    ace.settings.check('breadcrumbs', 'fixed')
                                } catch (e) {
                                }
                            </script>

                            <ul class="breadcrumb">
                                <li>
                                    <i class="ace-icon fa fa-home home-icon"></i>
                                    <a href="homeBackend.htm">Trang ch???</a>
                                </li>
                                <li class="active">Qu???n l?? s???n ph???m</li>
                            </ul><!-- /.breadcrumb -->


                        </div>

                        <div class="page-content">

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h4>Qu???n l?? s???n ph???m <small>  >> S???a th??ng tin s???n ph???m</small></h4>
                                            <div class="clearfix"></div>
                                        <f:form class="form-horizontal form-label-left" action="updateProduct.htm" commandName="updateProduct" onsubmit="return validate()">
                                               <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">M?? s???n ph???m <span >*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="productId" class="form-control col-md-7 col-xs-12" path="productId" readonly="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">T??n s???n ph???m <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="productName" class="form-control col-md-7 col-xs-12" path="productName" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">M?? t??? <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:textarea type="text" id="productContent"  class="form-control col-md-7 col-xs-12" path="productContent" /> 
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">M?? t??? chi ti???t <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:textarea id="productContentDetail"  class="form-control col-md-7 col-xs-12" path="productContentDetail"></f:textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">???nh ch??nh<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input id="images"  type="text" class="form-control col-md-7 col-xs-12" path="images" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">???nh ph???<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input id="imagesHover" type="text" class="form-control col-md-7 col-xs-12" path="imageHover" />
                                                </div>
                                            </div>
                                                    <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">S??? l?????ng <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="quantity" class="form-control col-md-7 col-xs-12" path="quantity" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Gi?? nh???p <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="priceInput" class="form-control col-md-7 col-xs-12" path="priceInput" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Gi?? b??n<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="priceOutput" class="form-control col-md-7 col-xs-12" path="priceOutput" />
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Gi??m gi?? <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="discount" class="form-control col-md-7 col-xs-12" path="discount" />
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Nh?? cung c???p<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:select id="providerId" class="form-control col-md-7 col-xs-12" path="providerId" >

                                                        <c:forEach items="${listProvider}" var="provider">
                                                            <f:option value="${provider.providerId}" >${provider.providerName}</f:option>
                                                        </c:forEach>
                                                    </f:select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">M?? danh m???c <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:select id="catalogId" class="form-control col-md-7 col-xs-12" path="catalogId" >

                                                        <c:forEach items="${listCatalog}" var="catalog">
                                                            <f:option value="${catalog.catalogId}" >${catalog.catalogName}</f:option>
                                                        </c:forEach>
                                                    </f:select>
                                                </div>
                                            </div>

                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                  
                                                    <button class="btn btn-primary" type="button" onclick="history.go(-1)">Quay l???i</button>
                                                    <button type="submit" class="btn btn-success">L??u</button>
                                                </div>
                                            </div>

                                        </f:form>
                                    </div>
                                </div>
                            </div>

                        </div><!-- /.row -->
                    </div><!-- /.page-content -->
                </div>
            </div><!-- /.main-content -->
              <script type="text/javascript">
 
            var editor = CKEDITOR.replace( 'productContentDetail' );
            var editor1 = CKEDITOR.replace('ProductContent');
            CKFinder.setupCKEditor(editor,'jsp/ckfinder/');
            CKFinder.setupCKEditor(editor1,'jsp/ckfinder/');
            
 
        </script>    
            <jsp:include page="Footer.jsp"></jsp:include>

        </div><!-- /.main-container -->

    </body>
</html>

