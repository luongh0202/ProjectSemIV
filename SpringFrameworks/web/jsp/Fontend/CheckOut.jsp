<%-- 
    Document   : Header
    Created on : Jun 5, 2017, 8:43:56 AM
    Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en"> 
    <head>   
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="content-language" content="vi" />
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title> new-boutique </title>

        <meta name="keywords" content="New Boutique Theme, DKT, Bizweb">
        <meta name="robots" content="noodp,index,follow" />
        <meta name='revisit-after' content='1 days' />
        <meta name="language" content="vietnamese">

        <meta property="og:type" content="website">
        <meta property="og:title" content="new-boutique">

        <meta property="og:image" content="image/logo.png">
        <meta property="og:image:secure_url" content="image/logo.png">




        <meta property="og:url" content="https://new-boutique.bizwebvietnam.net">
        <meta property="og:site_name" content="new-boutique">  
        <link rel="canonical" href="https://new-boutique.bizwebvietnam.net">
        <link rel="shortcut icon" href="/SpringFrameworks/jsp/Fontend/images/favicon.png" type="image/x-icon" />
        <link href='/SpringFrameworks/jsp/Fontend/css/bootstrap.min.css' rel='stylesheet' type='text/css' />
        <link href='/SpringFrameworks/jsp/Fontend/css/themes_support_nprogress.css' rel='stylesheet' type='text/css' />
        <link href='/SpringFrameworks/jsp/Fontend/css/themes_support_font-awesome.min.css' rel='stylesheet' type='text/css' />
        <link href='/SpringFrameworks/jsp/Fontend/css/style_payment.css' rel='stylesheet' type='text/css' />
        <link href='/SpringFrameworks/jsp/Fontend/css/checkout.css' rel='stylesheet' type='text/css' />
        <link href='/SpringFrameworks/jsp/Fontend/css/checkout_stylesheet.css' rel='stylesheet' type='text/css' />
        <link href='http://fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Alegreya+Sans:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>

        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } 
        </script>


        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } 
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#horizontalTab').easyResponsiveTabs({
                    type: 'default',
                    width: 'auto',
                    fit: true
                });
            });

        </script>
        <script>
            //<![CDATA[
            (function () {
                var s = document.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = '/SpringFrameworks/jsp/Fontend/js/themes_support_bizweb_stats.js';
                var x = document.getElementsByTagName('script')[0];
                x.parentNode.insertBefore(s, x);
            })();
            //]]>
        </script>
        <!-- Google Tag Manager -->

        <script>

            $(function () {
                $('.adsense_btn_close').click(function () {
                    $(this).closest('.adsense_fixed').css('display', 'none');
                });

                $('.adsense_btn_info').click(function () {
                    if ($('.adsense_info_content').is(':visible')) {
                        $('.adsense_info_content').css('display', 'none');
                    } else {
                        $('.adsense_info_content').css('display', 'block');
                    }
                });

            });

        </script>
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '../../../../www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-30027142-1', 'w3layouts.com');
            ga('send', 'pageview');
        </script>


        <script async type='text/javascript' src='../../../../cdn.fancybar.net/ac/fancybar6a2f.js?zoneid=1502&amp;serve=C6ADVKE&amp;placement=w3layouts' id='_fancybar_js'></script>
        <style type='text/css'>  .adsense_fixed{position:fixed;bottom:-8px;width:100%;z-index:999999999999;}.adsense_content{width:720px;margin:0 auto;position:relative;background:#fff;}.adsense_btn_close,.adsense_btn_info{font-size:12px;color:#fff;height:20px;width:20px;vertical-align:middle;text-align:center;background:#000;top:4px;left:4px;position:absolute;z-index:99999999;font-family:Georgia;cursor:pointer;line-height:18px}.adsense_btn_info{left:26px;font-family:Georgia;font-style:italic}.adsense_info_content{display:none;width:260px;height:340px;position:absolute;top:-360px;background:rgba(255,255,255,.9);font-size:14px;padding:20px;font-family:Arial;border-radius:4px;-webkit-box-shadow:0 1px 26px -2px rgba(0,0,0,.3);-moz-box-shadow:0 1px 26px -2px rgba(0,0,0,.3);box-shadow:0 1px 26px -2px rgba(0,0,0,.3)}.adsense_info_content:after{content:'';position:absolute;left:25px;top:100%;width:0;height:0;border-left:10px solid transparent;border-right:10px solid transparent;border-top:10px solid #fff;clear:both}.adsense_info_content #adsense_h3{color:#000;margin:0;font-size:18px!important;font-family:'Arial'!important;margin-bottom:20px!important;}.adsense_info_content .adsense_p{color:#888;font-size:13px!important;line-height:20px;font-family:'Arial'!important;margin-bottom:20px!important;}.adsense_fh5co-team{color:#000;font-style:italic;}</style>

        <script>
                        var Bizweb = Bizweb || {};
                        Bizweb.store = 'new-boutique.bizwebvietnam.net';
                        Bizweb.theme = {"id": 530298, "name": "new-boutique-build-2", "role": "main", "previewable": true, "processing": false, "created_on": "2017-04-27T13:58:57Z", "modified_on": "2017-04-27T13:59:07Z"}
                        Bizweb.template = 'index';
        </script>

        <script>
            //<![CDATA[
            (function () {
                var s = document.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = '/SpringFrameworks/jsp/Fontend/js/themes_support_bizweb_stats.js';
                var x = document.getElementsByTagName('script')[0];
                x.parentNode.insertBefore(s, x);
            })();

            //]]>
        </script>

        <script>
            (function () {
                function asyncLoad() {
                    var urls = ["SpringFrameworks/jsp/Fontend/js/script.js"];
                    for (var i = 0; i < urls.length; i++) {
                        var s = document.createElement('script');
                        s.type = 'text/javascript';
                        s.async = true;
                        s.src = urls[i];
                        s.src = urls[i];
                        var x = document.getElementsByTagName('script')[0];
                        x.parentNode.insertBefore(s, x);
                    }
                }
                window.attachEvent ? window.attachEvent('onload', asyncLoad) : window.addEventListener('load', asyncLoad, false);
            })();
        </script>

        <script type='text/javascript'>
            (function () {
                var log = document.createElement('script');
                log.type = 'text/javascript';
                log.async = true;
                log.src = '/SpringFrameworks/jsp/Fontend/js/delivery.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(log, s);
            })();
        </script>

        <!-- Google Tag Manager -->





        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

        <link href='/SpringFrameworks/jsp/Fontend/css/styles.css' rel='stylesheet' type='text/css' />
        <link href='/SpringFrameworks/jsp/Fontend/css/settings.css' rel='stylesheet' type='text/css' />
        <link href='/SpringFrameworks/jsp/Fontend/css/responsive.css' rel='stylesheet' type='text/css' />  
        <script>
            window.money_format = "{{amount_no_decimals_with_comma_separator}} VND";

            window.change_image = true;

            window.use_quickview_swatch = true;
            window.asset_url = "//bizweb.dktcdn.net/100/087/870/themes/530298/assets/.?1495240977358";
            window.inPageCollection = false;
            Bizweb.arrayInc = function (e, t) {
                for (var n = 0; n < e.length; n++)
                    if (e[n] == t)
                        return !0;
                return !1
            }
            Bizweb.uniq = function (e) {
                for (var t = [], n = 0; n < e.length; n++)
                    Bizweb.arrayInc(t, e[n]) || t.push(e[n]);
                return t
            }
        </script>
        <!-- FIRST JS -->
        <script src='/SpringFrameworks/jsp/Fontend/js/important_plugin.js' type='text/javascript'></script>    
        <script src='/SpringFrameworks/jsp/Fontend/js/themes_support_option-selectors.js' type='text/javascript'></script>



        <script src='/SpringFrameworks/jsp/Fontend/js/jquery.products.min.js' type='text/javascript'></script>


        <style>#quickView .selector-wrapper {display:none}</style>

    </head>
    <body>
        <div class="fullLoading" style="display:none">
            <div class="cssload-ball"></div>
        </div>
        <jsp:include page="Menu.jsp"></jsp:include>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="breadcrumb">
                <div class="container">
                    <ul class="list-unstyled">
                        <li><a href="/">Trang chủ</a></li>
                        <li class="divide"><i class="fa fa-angle-right"></i></li>

                        <li><span>Thanh toán</span></li>

                    </ul>
                </div>
            </div>
            <div>
                <div context="checkout" define='{checkout: new Bizweb.Checkout(this,{ existCode: false, totalOrderItemPrice: 950000.0000, discount: 0, shippingFee: 0, freeShipping: false, requiresShipping: true, code: "", settingLanguage: "vi", moneyFormat: "{{amount_no_decimals_with_comma_separator}}₫", discountLabel: "Miễn phí", districtPolicy: "optional", district: "", province:"" })}' class="container checkout">

                    <div class="main">
                        <div class="wrap clearfix">
                            <div class="row">

                                <div class="col-md-8 col-sm-12 customer-info" >
                                    <form action="prePayment.htm" enctype="multipart/form-data" method="get">
                                        <input type="hidden" name="total" value="${total}" >
                                    <div define="{billing_address: {}, billing_expand:true}" class="form-group m0">
                                        <h2>
                                            <label class="control-label">Thông tin mua hàng</label>
                                        </h2>
                                    </div>


                                    <div class="form-group" bind-class="{'has-error' : invalidEmail}">
                                        <input  required  name="Email"  value="${us.email}"  type="email" class="form-control" placeholder="Email"/>
                                        <div class="help-block with-errors">
                                        </div>
                                    </div>

                                    <div class="billing">
                                        <div class="form-group">
                                            <a class="underline-none" bind-event-click="billing_expand = !billing_expand" bind-class="{expandable: otherAddress, open: billing_expand}" href="javascript:void(0)">
                                                <span bind-show="!otherAddress">Thông tin thanh toán và nhận hàng</span>
                                                <span bind-show="otherAddress" class="hide">Thông tin thanh toán</span>
                                            </a>
                                        </div>
                                        <div bind-show="billing_expand || !otherAddress">
                                            <div class="form-group">
                                                <input data-error="Vui lòng nhập họ tên" required bind="billing_address.full_name" name="BillingAddress.LastName" class="form-control" placeholder="Họ và tên" value="${us.userName}"/>
                                                <div class="help-block with-errors"></div>
                                            </div>

                                            <div class="form-group">
                                                <input  bind="billing_address.phone" name="BillingAddress.Phone" class="form-control" placeholder="Số điện thoại" data-error="Vui lòng nhập số điện thoại" value="${us.phone}"/>
                                                <div class="help-block with-errors"></div>
                                            </div>
                                            <div class="form-group">
                                                <input  bind="billing_address.address1" name="BillingAddress.Address1" class="form-control" placeholder="Địa chỉ" value="${us.address}"/>
                                                <div class="help-block with-errors"></div>
                                            </div>

                                            <hr class="divider" />
                                        </div>
                                    </div>

                                    <div bind-show="otherAddress" define="{shipping_address: {}, shipping_expand:true,show_district:  true ,show_country:  true }" class="shipping  hide ">
                                        <div class="form-group">
                                            <a class="underline-none expandable" bind-event-click="shipping_expand = !shipping_expand" bind-class="{open: shipping_expand}" href="javascript:void(0)">
                                                Thông tin nhận hàng
                                            </a>
                                        </div>
                                        <div bind-show="shipping_expand || !otherAddress">
                                            <div class="form-group">
                                                <input data-error="Vui lòng nhập họ tên"  name="name" class="form-control" placeholder="Họ và tên"  />
                                                <div class="help-block with-errors"></div>
                                            </div>

                                            <div class="form-group">
                                                <input  bind="shipping_address.phone" name="phone" class="form-control" placeholder="Số điện thoại" />
                                                <div class="help-block with-errors"></div>
                                            </div>

                                            <div class="form-group">
                                                <input  bind="shipping_address.email" name="email" class="form-control" placeholder="Email" />
                                                <div class="help-block with-errors"></div>
                                            </div>
                                            <div class="form-group">
                                                <input  bind="shipping_address.address1" name="address" class="form-control" placeholder="Địa chỉ" />
                                                <div class="help-block with-errors"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="form-group" bind-show="requiresShipping">
                                        <div class="checkbox">
                                            <label>
                                                <div bind-class="{'checked' : otherAddress}" class="icheckbox_square" style="position: relative;">
                                                    <input bind-event-change="changeOtherAddress(this)" bind="otherAddress" type="checkbox" name="otherAddress"  value="false"  class="icheck square" style="position: absolute; opacity: 0;" />
                                                    <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;"></ins>
                                                </div>
                                                Giao hàng đến địa chỉ khác
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary" type="submit">Tiếp tục</button>   
                                    </div>
                                </form>           
                            </div>


                            <div class="col-md-4 col-sm-12 order-info" define="{order_expand: false}">
                                <div class="order-summary order-summary--custom-background-color ">
                                    <div class="order-summary-header summary-header--thin summary-header--border">
                                        <h2>
                                            <label class="control-label">Đơn hàng</label>
                                        </h2>

                                    </div>
                                    <div class="order-items mobile--is-collapsed" >
                                        <div class="summary-body summary-section summary-product" >
                                            <div class="summary-product-list">
                                                <ul class="product-list">
                                                    <c:forEach items="${listCart}" var="cart">
                                                        <li class="product product-has-image clearfix">
                                                            <div class="product-thumbnail pull-left">
                                                                <div class="product-thumbnail__wrapper">

                                                                    <img src='/SpringFrameworks/jsp/Fontend/images/${cart.product.images}' alt='${cart.product.productName}' class='product-thumbnail__image' />

                                                                </div>
                                                                <span class="product-thumbnail__quantity" aria-hidden="true">${cart.quantity}</span>
                                                            </div>
                                                            <div class="product-info pull-left">
                                                                <span class="product-info-name">

                                                                    <strong>${cart.product.productName}</strong>
                                                                </span>


                                                            </div>
                                                            <c:choose>
                                                                <c:when test="${cart.product.discount== 0}">   
                                                                    <strong class="product-price pull-right">
                                                                       <fmt:formatNumber type="number"  maxFractionDigits="3" value='${Float.parseFloat(cart.product.priceOutput.replaceAll("[.]",""))*cart.quantity}' />
                                                                    </strong>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <strong class="product-price pull-right">
                                                                        <fmt:formatNumber type="number"  maxFractionDigits="3" value='${Float.parseFloat(cart.product.priceDiscount.replaceAll("[.]",""))*cart.quantity}' />
                                                                    </strong>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </li>

                                                    </c:forEach>

                                                </ul>
                                            </div>
                                        </div>                      
                                    </div>
                                    <div class="summary-section border-top-none--mobile">
                                        <div class="total-line total-line-subtotal clearfix">
                                            <span class="total-line-name pull-left">
                                                Tạm tính:
                                            </span>
                                            <span class="total-line-subprice pull-right">
                                                ${total}đ
                                            </span>
                                        </div>

                                        <div class="total-line total-line-total clearfix">
                                            <span class="total-line-name pull-left">
                                                Tổng cộng:
                                            </span>
                                            <span>
                                                ${total}đ
                                            </span>
                                        </div>
                                    </div>
                                </div>                      
                            </div>
                            <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                            <script type="text/javascript">
               $(document).ready(function () {
                   $('#horizontalTab').easyResponsiveTabs({
                       type: 'default', //Types: default, vertical, accordion           
                       width: 'auto', //auto or any width like 600px
                       fit: true   // 100% fit in a container
                   });
               });

                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src='/SpringFrameworks/jsp/Fontend/js/jquery-2.1.3.min.js' type='text/javascript'></script>
        <script src='/SpringFrameworks/jsp/Fontend/js/bootstrap.min.js' type='text/javascript'></script>
        <script src='/SpringFrameworks/jsp/Fontend/js/twine.min.js' type='text/javascript'></script>
        <script src='/SpringFrameworks/jsp/Fontend/js/validator.min.js' type='text/javascript'></script>
        <script src='/SpringFrameworks/jsp/Fontend/js/nprogress.js' type='text/javascript'></script>
        <script src='/SpringFrameworks/jsp/Fontend/js/money-helper.js' type='text/javascript'></script>
        <script src='/SpringFrameworks/jsp/Fontend/js/checkout.js' type='text/javascript'></script>
        <script src="/SpringFrameworks/jsp/Fontend/js/easyResponsiveTabs.js" type="text/javascript"></script>
        <script type="text/javascript">
           $(document).ajaxStart(function () {
               NProgress.start();
           });
           $(document).ajaxComplete(function () {
               NProgress.done();
           });

           context = {}

           $(function () {
               Twine.reset(context).bind().refresh();
           });

           $(document).ready(function () {

               $("#customer-address").trigger("change");

               $("select[name='BillingProvinceId']").trigger("change");
               $("select[name='ShippingProvinceId']").trigger("change");
               Twine.context(document.body).checkout.caculateShippingFee();
           });
        </script>
        <jsp:include page="Footer.jsp"></jsp:include>
        <div class="modal fade" id="search-modal" role="dialog" aria-lebelledby="Search">
            <div class="modal-container">
                <form action="/search" method="get">
                    <input type="text" class="input-control" name="query" placeholder="Nhập từ khóa để tìm kiếm sản phẩm...">
                    <button><i class="ico-search sprite"></i></button>
                </form>
            </div>
        </div>



        <div class="modal fade toolbox" id="hotline-box" role="dialog" aria-labelledby="Liên hệ">
            <div class="modal-container">
                <div class="entry-modal">
                    <h3 style="text-align: center;margin-bottom:15px"><span style="font-size:18px;"><strong>Đường dây nóng</strong></span></h3>

                    <p style="text-align: center;">Nếu bạn có thắc mắc cần giải đáp hoặc hỗ trợ về sản phẩm, hãy nhấc máy ngay và gọi đến số</p>

                    <p style="text-align: center;"><span style="color:#FF8C00;"><span style="font-size:20px;"><strong><span style="background-color:#FFFFFF;">01627453860</span></strong></span></span></p>



                </div>
                <div class="footerbox">
                    <a href="" class="close-modal" data-dismiss="modal" aria-label="Đóng" >ĐÓNG</a>
                </div>
            </div>
        </div>

        <div id="toolbox">
            <ul class="list-unstyled">
                <li>
                    <a href="javascript:void(0);" id="back-top"><i class="fa fa-long-arrow-up"></i></a>
                    <span class="tooltip">Lên đầu trang</span>
                </li>

                <li >
                    <a href="javascript:void(0);" class="toolbox-cart"><i class="fa fa-shopping-bag" ></i></a>
                    <span class="tooltip">Giỏ hàng</span>
                </li>


                <li >
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#search-modal" ><i class="fa fa-search" ></i></a>
                    <span class="tooltip">Tìm kiếm</span>
                </li>




                <li data-toggle="tooltip" >
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#hotline-box"  class="mobile"><i class="fa fa-mobile" ></i></a>
                    <span class="tooltip">Đường dây nóng</span>
                </li>

            </ul>

        </div>


        <!-- Begin quick-view-template -->
        <div class="modal fade" id="quickView" tabindex="-1" role="dialog" aria-labelledby="quickView"></div>







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