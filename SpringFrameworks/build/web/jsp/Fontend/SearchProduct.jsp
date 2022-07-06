<%-- 
    Document   : SearchProduct
    Created on : Jun 15, 2017, 9:25:48 PM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="/SpringFrameworks/jsp/js/jquery-2.1.3.min.js" type="text/javascript"></script>
<script src="/SpringFrameworks/jsp/js/update.js" type="text/javascript"></script>
<div class="filter-container">


    <div class="filtersTool filterCheckbox filterPrice widget_collection">
        <h2>Lọc theo giá</h2>
        <div class="filterToolGroup">
            <br>
            <div class="form-horizontal" >
                <div class="form-group">
                    <label class="col-sm-2 control-label">Từ</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control from" id="priceFrom" name="priceFrom" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Đến</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control to" id="priceTo" name="priceTo">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary" onclick="searchProduct();" >Tìm kiếm</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="filtersTool filterColor widget_collection" id="color">
        <h2>Bộ lọc màu</h2>
        <div class="filterToolGroup">
            <ul class="list-unstyled">

                <c:forEach items="${listColor}" var="color">
                    <li class="color">                      
                      
                        <a class="${color.colorId}"> 
                            <label for="filter-${color.colorName}" style="background-color:${color.natation};" data-toggle="tooltip" data-placement="top" title="${color.colorName}">${color.colorName}
                                   </label></a>
                    </li>
                </c:forEach>



            </ul>
        </div>
    </div>

    <div class="filtersTool filterCheckbox widget_collection">
        <h2>Lọc theo thương hiệu</h2>
        <div class="filterToolGroup">
            <ul class="list-unstyled clearfix" id="provider">
                <c:forEach items="${listProvider}" var="provider">
                    <li class="checkbox clearfix">
                       
                        <a href="#" class="${provider.providerId}"><span>${provider.providerName}</span></a>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>
</div>