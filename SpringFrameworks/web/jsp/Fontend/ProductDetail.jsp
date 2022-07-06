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

                        <li><a href="getAllProduct.htm">Tất cả sản phẩm</a></li>
                        <li class="divide"><i class="fa fa-angle-right"></i></li>
                        <li><span>${product.productName}</span></li>

                    </ul>
                </div>
            </div>
            <section class="product-single">


                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="product-image">
                                <div class="featured-image" style="text-align: center;">

                                    <a href="/SpringFrameworks/jsp/Fontend/images/${product.images}">
                                    <img id="product-featured-image" src="/SpringFrameworks/jsp/Fontend/images/${product.images}" data-zoom-image="/SpringFrameworks/jsp/Fontend/images/${product.images}" class="img-fix" alt="${product.productName}">
                                </a>              
                            </div>
                            <div class="thumbnail-images" id="thumbmail-images">
                                <c:forEach items="${listImage}" var="image">
                                    <div class="thumb-img">
                                        <a href="javascript:void(0);" data-image="/SpringFrameworks/jsp/Fontend/images/${image.imageLinkName}" data-zoom-image="/SpringFrameworks/jsp/Fontend/images/${image.imageLinkName}">
                                            <img src="/SpringFrameworks/jsp/Fontend/images/${image.imageLinkName}" class="img-fix2" alt="">
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <h1 itemprop="name">${product.productName}</h1>


                        <c:choose >
                            <c:when test="${product.discount == 0}">
                            <p class="product-price">
                                <span>${product.priceOutput} đ</span>
                                <del></del>
                            </p>
                        </c:when>
                        <c:otherwise>
                             <p class="product-price">
                                <span>${product.priceDiscount}đ </span>
                                <del></del>
                            </p>
                        </c:otherwise>
                        </c:choose>

                        <p class="product-vendor">Nhà sản xuất: Asos</p>
                        <div class="short-desc" itemprop="description">
                            ${product.productContent}
                        </div>
                        <form action="addCart.htm" enctype="multipart/form-data" class="product-form product-actions">


                          <script>$(window).load(function () {
                         $('.selector-wrapper:eq(0)').hide();
                        });</script>
                        <c:if test="${ not empty listColor}">
                            <div class="swatch swatchProdDetail clearfix" data-option-index="0">
                                <div class="header">Màu sắc</div>
                                <c:forEach items="${listColor}" var="color">

                               <div data-value="${color.colorName}" class="prodDetailSwatchElement swatch-element color xam available">

                                    <div class="tooltip">${color.colorName}</div>

                                    <input id="${color.colorName}" type="radio" name="option-0" value="${color.colorName}"   />

                                    <label for="${color.colorName}" style="background-color: ${color.natation}">
                                        <img class="crossed-out" src="/SpringFrameworks/jsp/Fontend/images/soldout.png" />
                                    </label>

                                </div>
   
                            </c:forEach>




                            </div>
                        </c:if>


                           <c:if test="${ not empty listSize}">
                            <div class="swatch swatchProdDetail clearfix" data-option-index="1">
                                <div class="header">Kích thước</div>
                                <c:forEach items="${listSize}" var="size">
                                    <div data-value="${size.sizeName}" class="prodDetailSwatchElement swatch-element x available">

                                        <input id="${size.sizeName}" type="radio" name="option-1" value="${size.sizeName}"   />

                                        <label for="${size.sizeName}">
                                            ${size.sizeName}
                                            <img class="crossed-out" src="/SpringFrameworks/jsp/Fontend/images/soldout.png" />
                                        </label>

                                    </div>
                                </c:forEach>




                            </div>
                           </c:if>
                            <div class="group">
                                <input type="number" name ="quantity" id="quantity" min="1" value="1" class="input-control quantity type_1">
                                <input type="hidden" name ="Id" id="Id" min="1" value="${product.productId}" >
                                <a href="javascript:void(0);" style="display:none" class="contactWithShop product-contactWithShop blue button" data-code="Quần short bò"> Liên hệ</a>
                                <button  type="submit" class="button blue">Cho vào giỏ hàng</button>


                            </div>
                        </form>

                    </div>
                </div>
                <div class="product-tabs">
                    <ul class="list-unstyled navtabs">
                        <li role="presentation" class="active"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Mô tả sản phẩm</a></li>


                        <li role="presentation"><a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">Chính sách đổi trả</a></li>

                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="tab1">
                            <div class="entry-content">
                                ${product.productContentDetail}


                            </div>
                        </div>


                        <div role="tabpanel" class="tab-pane fade" id="tab3"><div style="line-height:24px">
                                <b>1. Đổi trả theo nhu cầu khách hàng (đổi trả hàng vì không ưng ý)</b>
                                <br>
                                Tất cả mặt hàng đã mua đều có thể hoàn trả trong vòng 30 ngày kể từ ngày nhận hàng (trừ khi có quy định gì khác). Chúng tôi chỉ chấp nhận đổi trả cho các sản phẩm còn nguyên điều kiện ban đầu, còn hóa đơn mua hàng & sản phẩm chưa qua sử dụng, bao gồm:
                                <br>
                                - Còn nguyên đóng gói và bao bì không bị móp rách
                                <br>
                                - Đầy đủ các chi tiết, phụ kiện
                                <br>
                                - Tem / phiếu bảo hành, tem thương hiệu, hướng dẫn kỹ thuật và các quà tặng kèm theo (nếu có) v.v… phải còn đầy đủ và nguyên vẹn
                                <br>
                                - Không bị dơ bẩn, trầy xước, hư hỏng, có mùi lạ hoặc có dấu hiệu đã qua qua sử dụng
                                <br>
                                <b>2. Đổi trả không vì lý do chủ quan từ khách hàng</b>
                                <br>
                                2.1. Hàng giao không mới, không nguyên vẹn, sai nội dung hoặc bị thiếu
                                <br>
                                Chúng tôi khuyến khích quý khách hàng phải kiểm tra tình trạng bên ngoài của thùng hàng và sản phẩm trước khi thanh toán để đảm bảo rằng hàng hóa được giao đúng chủng loại, số lượng, màu sắc theo đơn đặt hàng và tình trạng bên ngoài không bị tác động.
                                <br>
                                Nếu gặp trường hợp này, Quý khách vui lòng từ chối nhận hàng và/hoặc báo ngay cho bộ phận hỗ trợ khách hàng để chúng tôi có phương án xử lí kịp thời. (Xin lưu ý những bước kiểm tra sâu hơn như dùng thử sản phẩm chỉ có thể được chấp nhận sau khi đơn hàng được thanh toán đầy đủ).
                                <br>
                                Trong trường hợp khách hàng đã thanh toán, nhận hàng và sau đó phát hiện hàng hóa không còn mới nguyên vẹn, sai nội dung hoặc thiếu hàng, xin vui lòng chụp ảnh sản phẩm gửi về hộp thư của chúng tôi để được chúng tôi hỗ trợ các bước tiếp theo như đổi/trả hàng hoặc gửi sản phẩm còn thiếu đến quý khách…
                                <br>
                                Sau 48h kể từ ngày quý khách nhận hàng, chúng tôi có quyền từ chối hỗ trợ cho những khiếu nại theo nội dung như trên.
                                <br>
                                2.2. Hàng giao bị lỗi
                                <br>
                                Khi quý khách gặp trục trặc với sản phẩm đặt mua của chúng tôi, vui lòng thực hiện các bước sau đây:
                                <br>
                                - Bước 1: Kiểm tra lại sự nguyên vẹn của sản phẩm, chụp lại ảnh sản phẩm xuất hiện lỗi
                                <br>
                                - Bước 2: Quý khách liên hệ với trung tâm chăm sóc khách hàng của chúng tôi để được xác nhận
                                <br>
                                - Bước 3: Trong vòng 30 ngày kể từ ngày nhận hàng, nếu quý khách được xác nhận từ trung tâm chăm sóc khách hàng rằng sản phẩm bị lỗi kỹ thuật, quý khách vui lòng truy cập ngay Hướng dẫn đổi trả hàng để bắt đầu quy trình đổi trả hàng
                                <br>
                                <b>3. Phương thức hoàn tiền</b>
                                <br>
                                Tùy theo lí do hoàn trả sản phẩm kết quả đánh giá chất lượng tại kho, chúng tôi sẽ có những phương thức hoàn tiền với chi tiết như sau:
                                <br>
                                - Hoàn tiền bằng mã tiền điện tử dùng để mua sản phẩm mới
                                <br>
                                - Đổi sản phẩm mới cùng loại
                                <br>
                                - Chuyển khoản qua ngân hàng theo thông tin của quý khách cung cấp
                                <br>
                                - Riêng đối với các đơn hàng thanh toán qua thẻ tín dụng quốc tế, chúng tôi sẽ áp dụng hình thức hoàn tiền vào tài khoản thanh toán của chủ thẻ
                                <br>
                                - Hoàn tiền mặt trực tiếp tại văn phòng
                                <br>
                                Mọi chi tiết hoặc thắc mắc quý khách vui lòng liên hệ với chúng tôi qua số điện thoại hỗ trợ hoặc để lại lời nhắn tại website. Xin chân thành cảm ơn.
                            </div></div> 

                    </div>
                </div>





                <div class="product-related widget_product">
                    <h2><span>Sản phẩm liên quan</span></h2>
                    <div class="row">
                        <div class="owl-related-product">
                            <c:forEach items="${listRefe}" var="refe">
                            <div class="col-xs-12">


                                <div class="product-grid type_2 product-ajax-cart">

                                    <div class="product-img">
                                        <a href="productDetail.htm?Id=${refe.productId}" title="${refe.productName}" onclick="updateView(${refe.productId})">

                                            <img src="/SpringFrameworks/jsp/Fontend/images/waiting.jpg" data-original="/SpringFrameworks/jsp/Fontend/images/${refe.images}" alt="Túi đeo chéo thời trang" class="lazy img-product-ajax-cart primary-img img-fix">
                              


                                            <img src="" data-original="/SpringFrameworks/jsp/Fontend/images/${refe.imageHover}" alt="Túi đeo chéo thời trang" class="lazy secondary-img img-fix">



                                        </a>
                                            <form class="actions form-ajax-action clearfix" method="get" enctype="multipart/form-data" action="addCart.htm?Id=${refe.productId}" >




                                            <input type="hidden" name="quantity" value="${refe.productId}">
                                            <button type= "submit" class="btn-fill">Cho vào giỏ</button>


                                            <a href="productDetail.htm?Id=${refe.productId}" class="btn-fill" id="tui-deo-cheo-thoi-trang">Xem</a>

                                        </form>

                                    </div>
                                    <h3 class="title-product-ajax-cart"><a href="productDetail.htm?Id=${refe.productId}" title="Túi đeo chéo thời trang" onclick="updateView(${refe.productId})">${refe.productName}</a></h3>
                                    <div class="price"> <span class="price-product-ajax-cart">${refe.priceOutput}₫</span></div>
                                </div>
                            </div>
                        </c:forEach>

                        </div>
                    </div>
                </div>

            </div>

        </section>
                                
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
