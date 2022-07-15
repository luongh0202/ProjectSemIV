<%-- 
    Document   : Header
    Created on : Jun 5, 2017, 9:18:04 AM
    Author     : LuongHoang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header">
    <div class="top-header">
        <div class="container">
            <div class="header-panel-mobile four-elem clearfix">
                <a href="javascript:void(0);" id="LeftPush"><i class="fa fa-bars"></i></a>
                <a href="javascript:void(0);" class="dropDownButton" data-target="#user-link"><i class="fa fa-user"></i></a>
                <a href="youCart.htm" class="cart-mobile">
                    <i class="ico-cart sprite"></i>
                    <span class="mini-cart-count"><%=request.getSession().getAttribute("listCart")%>.size()</span>
                </a>
                <a href="javascript:void(0);" class="dropDownButton" data-target="#top-linklists-mobile"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></a>
                <ul class="list-unstyled top-linklists-mobile dropList" id="top-linklists-mobile" style="display:none"></ul>
                <ul class="list-unstyled top-linklists-mobile dropList" id="user-link" style="display:none">
                    <li><a href="initLoginFontend.htm">Đăng nhập</a></li>
                    <li><a href="initResgiter.htm">Đăng ký</a></li>
                </ul>
            </div>
            <ul class="list-unstyled top-linklists hidden-xs hidden-sm">
                <li><a target="_blank" href="/PaymentDemo/getAllAccount.htm">Ngân hàng</a></li>
                <li><a target="_blank" href="homeBackend.htm">Quản trị Website</a></li>                 
                <li><a href="getProductShare.htm">Khuyến mại</a></li>          
                <li><a href="getAllProduct.htm">Sản phẩm</a></li>
                <% if (session.getAttribute("account") == null) { %>
                <li><a href="initLoginFontend.htm">Đăng nhập</a></li>
                <li><a href="initResgiter.htm">Đăng ký</a></li>
                <% } else {%>
                <li><a href="logoutFontend.htm">Đăng xuất</a></li>
                <% } %>

                <li><a href="myAccount.htm">Tài khoản</a></li>
                <li><a href="history.htm">Lịch sử đơn hàng</a></li>      
            </ul>
        </div>
    </div>
    <div class="bottom-header">
        <div class="background"></div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-4 col-lg-3">

                    <h1 class="logo">
                        new-boutique
                        <div class="wrap-logo">
                            <img src="/SpringFrameworks/jsp/Fontend/images/logo.png" alt="new-boutique" class="img-fix1">
                        </div>
                    </h1>
                </div>
                <div class="hidden-xs hidden-sm col-md-7 col-lg-8">
                    <ul class="list-unstyled main-nav">
                        <li class="active "><a href="homeFontend.htm">Trang chủ</a></li>
                        <li class="  has-mega">
                            <a href="getAllProduct.htm">Sản phẩm</a>
                        </li>
                        <li class="  has-sub">
                            <a href="getPost.htm">Tin tức</a>
                            <ul class="list-unstyled level1">
                                <c:forEach items="${listCatalogPost}" var="catalogPost">
                                    <li><a href="getPostByCatalogId.htm?Id=${catalogPost.catalogPostId}">${catalogPost.catalogPostName}</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li class=" "><a href="about.htm">Giới thiệu</a></li>
                        <li class=" last"><a href="contact.htm">Liên hệ</a></li>
                    </ul>
                </div>
                <div class="col-md-1 col-lg-1 hidden-xs hidden-sm header-action-btn">
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#search-modal" class="btn-search"><i class="ico-search sprite"></i></a>

                    <a href="myCart.htm" class="btn-mini-cart"><i class="ico-cart sprite" data-count="${listCart.size()}"></i></a>
                </div>
            </div>
            <div class="search-mobile hidden-md hidden-lg">
                <form action="searchProduct.htm" method="get">
                    <input type="text" class="input-control" name="query" placeholder="Nhập từ khóa để tìm kiếm...">
                    <button><i class="ico-search sprite"></i></button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="search-modal" role="dialog" aria-lebelledby="Search">
        <div class="modal-container">
            <form action="./search.htm" method="get">
                <input type="text" class="input-control" name="query" placeholder="Nhập từ khóa để tìm kiếm sản phẩm...">
                <button><i class="ico-search sprite"></i></button>
            </form>
        </div>
    </div>

</header>
