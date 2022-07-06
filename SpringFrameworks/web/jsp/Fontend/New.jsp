<%-- 
    Document   : Index
    Created on : Jun 5, 2017, 9:26:03 AM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <jsp:include page="Head.jsp"></jsp:include>
        <body>
            <div class="fullLoading" style="display:none">
                <div class="cssload-ball"></div>
            </div>
        <jsp:include page="Header.jsp"></jsp:include>


            <div class="breadcrumb">
                <div class="container">
                    <ul class="list-unstyled">
                        <li><a href="homeFontend.htm">Trang chủ</a></li>
                        <li class="divide"><i class="fa fa-angle-right"></i></li>

                        <li><a href="getPost.htm">Tất cả tin tức</a></li>
                        <li class="divide"><i class="fa fa-angle-right"></i></li>


                    </ul>
                </div>
            </div>
            <section class="page-blog">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-8 col-md-push-4 col-lg-9 col-lg-push-3">
                            <h1 class="page-title">Tất cả tin tức</h1>


                        <c:forEach items="${listPost}" var="post">

                            <div class="post">

                                <a href="/SpringFrameworks/jsp/Fontend/images/${post.images}" class="post-img">

                                    <img src="/SpringFrameworks/jsp/Fontend/images/${post.images}" data-original="/SpringFrameworks/jsp/Fontend/images/${post.images}" alt="${post.postTitle}" class="lazy">
                                    

                                </a>

                                <div class="post-info">
                                    <h2><a href="getPostDetail.htm?Id=${post.postId}">${post.postTitle}</a></h2>
                                    <div class="entry-meta-small">
                                        <div class="post-date">
                                            ${post.created}      
                                        </div>
                                        <div class="post-author">Đăng bởi: TuyenNT</div>
                                    </div>
                                    <div class="entry-summary">
                                        <p><p>${post.content}</p></p>
                                        <a href="getPostDetail.htm?Id=${post.postId}"><b><i class="fa fa-caret-right"></i> Xem thêm</b></a>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>

                             



                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-md-pull-8 col-lg-3 col-lg-pull-9">
                            <div class="blog_sidebar">

                                <div class="widget_blog">
                                    <h2>Danh mục tin tức</h2>
                                    <ul class="list-unstyled linklists">
                                    <c:forEach items="${listCatalogPost}" var="catalogPost">

                                        <li><a href="getPostByCatalogId.htm?Id=${catalogPost.catalogPostId}" title="${catalogPost.catalogPostName}">${catalogPost.catalogPostName}</a></li>

                                    </c:forEach>

                                    </ul>
                                </div>





                                <div class="widget_blog">
                                    <h2>Bài viết khác</h2>
                                    <ul class="list-unstyled list-post">
                                    <c:forEach items="${listPostNew}" var="postNew">

                                        <li>
                                            <a href="getPostDetail.htm?Id=${postNew.postId}" class="img">

                                                <img src="/SpringFrameworks/jsp/Fontend/images/${postNew.images}" title="${postNew.postTitle}" alt="${postNew.postTitle}">  

                                            </a>
                                            <div class="small-title">
                                                <h3 title="${postNew.postTitle}"><a href="getPostDetail.htm?Id=${postNew.postId}">${postNew.postTitle}</a></h3>
                                                <p class="date">${postNew.created}</p>
                                            </div>
                                        </li>

                       
                                    </c:forEach>
                                    </ul>
                                </div>


                            
                            <script>
                                Bizweb.Products.showRecentlyViewed({
                                    howManyToShow: 7,
                                    onComplete: function () {
                                        if (jQuery("#recently-viewed-products").children().length > 0) {
                                            jQuery(".recently-viewed-products").show();
                                        }
                                    }
                                });
                            </script> 






                            <div class="widget_blog">
                                <h2>Sản phẩm nổi bật</h2>
                                <ul class="list-unstyled list-products">
                                <c:forEach items="${listProduct}" var="product">

                                    <li>
                                        <a class="image" href="productDetail.htm?Id=${product.productId}">                
                                            <img src="/SpringFrameworks/jsp/Fontend/images/${product.images}" title="${product.productName}" alt="${product.productName}">                
                                        </a>
                                        <div class="info">
                                            <h3 title="${product.productName}"><a href="productDetail.htm?Id=${product.productId}">${product.productName}</a></h3>
                                            <c:choose>
                                                <c:when test="${product.discount == 0}">
                                            <p class="price">

                                                <span>${product.priceOutput}₫</span>

                                            </p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="price"><del>${product.priceOutput}₫</del>

                                                <span>${product.priceDiscount}₫</span>

                                            </p>
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </li>

                                </c:forEach>

                                </ul>
                            </div>  


                      


                        </div>
                    </div>
                </div>
            </div>
        </section>  

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
