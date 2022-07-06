<%-- 
    Document   : Banner
    Created on : Jun 9, 2017, 5:35:58 PM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en"> 
    <jsp:include page="Head.jsp"></jsp:include>
    <script>
        function validate(){
            
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var content = document.getElementById("content").value;
        if(name != "" && email != "" && content != ""){
            alert("Cảm bạn đã đóng góp ý kiến");
            return true;
        }  else  {
            if(name == ""){
                
                alert("Bạn chưa nhập tên.");
                document.getElementById("name").focus();
                return false;
            }
              if(email == ""){
                
                alert("Bạn chưa nhập email.");
                document.getElementById("email").focus();
                return false;
            }
              if(content == ""){               
                alert("Bạn chưa nhập nội dung.");
                document.getElementById("content").focus();
                return false;
            }
        }
            
        }
    </script>
        <body>
            <div class="fullLoading" style="display:none">
                <div class="cssload-ball"></div>
            </div>
        <jsp:include page="Menu.jsp"></jsp:include>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="breadcrumb">
                <div class="container">
                    <ul class="list-unstyled">
                        <li><a href="homeFontend.htm">Trang chủ</a></li>
                        <li class="divide"><i class="fa fa-angle-right"></i></li>

                        <li><span>Liên hệ</span></li>

                    </ul>
                </div>
            </div>

            <section class="page-contact">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-8 col-md-push-4 col-lg-9 col-lg-push-3">
                            <h1 class="page-title">Liên hệ</h1>
                            <div id="map">
                                
                                
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="entry-content">
                                        <p><strong>Văn phòng đại diện</strong>: Minh Khai - Hai Bà Trưng - Hà Nội</p>

                                        <p><strong>Showroom 1</strong>: Đội Cấn, Ba Đình, Hà Nội</p>

                                        <p><strong>Showroom 2</strong>: Ngã Tư Sở, Thanh Xuân, Hà Nội</p>

                                        <p><strong>Số điện thoại</strong>: 01627 453 860</p>

                                        <p><strong>Email</strong>: vuongngocdoan@gmail.com</p>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                <f:form accept-charset='UTF-8' action='confirmFeeback.htm' id='contact' commandName="feeback" onsubmit="return validate()">
                                        <input name='FormType' type='hidden' value='contact' />
                                        <input name='utf8' type='hidden' value='true' />
                                       
                                         <div class="form-group">                            
                                         ${tb}

                                        </div>
                                        <div class="form-group">                            
                                            <f:input type="text" id="name" class="input-control" placeholder="Họ và tên..."  path="name" />

                                        </div>
                                        <div class="form-group">

                                            <f:input type="email" id="email" class="input-control" placeholder="Email..." path="email" />
                                        </div>
                                        <div class="form-group">

                                            <f:textarea id="content" class="input-control" placeholder="Lời nhắn..."  path="content"></f:textarea>
                                        </div>


                                        <button type="submit" class="button transparent">Gửi lời nhắn</button>

                                    </f:form>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-md-pull-8 col-lg-3 col-lg-pull-9">
                            <div class="widget_collection"> 

                                <div class="main-category has-icon">
                                    <h2><i class="fa fa-bars"></i> Danh mục sản phẩm</h2>            
                                    <!-- Mobile Category -->  

                                    <!-- Desktop Category -->
                                    <ul class="list-unstyled hidden-md hidden-lg mobile-category mobile-menu dropList" id="mobile-category" style="display:none">

                                    <c:forEach items="${listCatalog}" var="catalog">
                                        <li>

                                            <a href="" >${catalog.catalogName}</a>

                                        </li>



                                    </c:forEach>


                                </ul>

                                <ul class="list-unstyled hidden-xs hidden-sm desktop-category">
                                    <c:forEach items="${listCatalog}" var="catalog">

                                        <li class="has-subcate has-banner">
                                         <a href="getProductByCatalog.htm?Id=${catalog.catalogId}">${catalog.catalogName}</a>

                                        </li>


                                    </c:forEach>

                                </ul>
                            </div>
                          
                        </div>
                        <script src='/SpringFrameworks/jsp/Fonted/js/search_filter.js' type='text/javascript'></script>
                      
                        <script>
                                        var selectedSortby;
                                        var collection_id;
                                        var selectedViewData = "data";
                                        var filter = new Bizweb.SearchFilter();
                                        window.inPageCollection = true;
                                        collection_id = "437151";
                                        filter.addValue("collection", "collections", "437151", "AND");</script>
                        <div class="widget_collection">
                            <h2>Sản phẩm nổi bật</h2>
                            <ul class="list-unstyled list-products">
                                <c:forEach items="${listProductHot}" var="hot">
                                    <li>
                                        <a class="image" href="productDetail.htm?Id=${hot.productId}" onclick="updateView(${hot.productId})">

                                            <img src="/SpringFrameworks/jsp/Fontend/images/${hot.images}" title="${hot.productName}" alt="${hot.productName}">

                                        </a>
                                        <div class="info">
                                            <h3 title="${hot.productName}"><a href="productDetail.htm?Id=${hot.productId}" onclick="updateView(${hot.productId})">${hot.productName}</a></h3>
                                            <p class="price">

                                                <span>${hot.priceOutput}đ</span>

                                            </p>
                                        </div>
                                    </li>

                                </c:forEach>

                            </ul>        
                        </div>

                    </div>

                </div>
        </section> 

        <jsp:include page="Footer.jsp"></jsp:include>



        <script>
                    $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
                    var topLinklists = $('.top-linklists').html();
                    $('#top-linklists-mobile').html(topLinklists);
            })
        </script>


        <script src='/SpringFrameworks/jsp/Fontend/js/jquery.lazyload.min.js' type='text/javascript'></script> 

        <script src='/SpringFrameworks/jsp/Fontend/js/plugin_necessary.js' type='text/javascript'></script>
        <script src='/SpringFrameworks/jsp/Fontend/js/main.js' type='text/javascript'></script>
    </body>
</html>