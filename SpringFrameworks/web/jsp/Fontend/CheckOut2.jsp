<%-- 
Document   : Header
Created on : Jun 5, 2017, 8:43:56 AM
Author     : LuongHoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    var urls = ["j/SpringFrameworks/jsp/Fontend/s/script.js"];
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
                        <li><a href="homeFontend.htm">Trang chủ</a></li>
                        <li class="divide"><i class="fa fa-angle-right"></i></li>

                        <li><span>Thanh toán</span></li>

                    </ul>
                </div>
            </div>
            <form method="post" action="" data-toggle="validator" class="formCheckout">
                <div context="checkout" define='{checkout: new Bizweb.Checkout(this,{ existCode: false, totalOrderItemPrice: 950000.0000, discount: 0, shippingFee: 0, freeShipping: false, requiresShipping: true, code: "", settingLanguage: "vi", moneyFormat: "{{amount_no_decimals_with_comma_separator}}₫", discountLabel: "Miễn phí", districtPolicy: "optional", district: "", province:"" })}' class="container checkout">

                    <div class="main">
                        <div class="wrap clearfix">
                            <div class="row">

                                <div class="col-md-8 col-sm-12">
                                    <div class="sap_tabs">
                                        <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                                            <div class="pay-tabs">
                                                <h2>Lựa chọn hình thức thanh toán</h2>
                                                <ul class="resp-tabs-list">
                                                    <li class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="height: 250px !important;">
                                                        <span><label class="pic1"></label>Thẻ tín dụng</span>
                                                    </li>
                                                    <li class="resp-tab-item" aria-controls="tab_item-2" role="tab" style="height: 250px !important;">
                                                        <span><label class="pic4"></label>Thanh toán khi giao hàng</span>
                                                    </li> 
                                                    <li class="resp-tab-item" aria-controls="tab_item-3" role="tab" style="height: 250px !important;">
                                                        <span><label class="pic2"></label>Thẻ nạp</span>
                                                    </li>
                                                    <div class="clear"></div>


                                                </ul> 
                                            </div>
                                            <div class="resp-tabs-container">
                                                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0" style="display:block;">
                                                    <div class="payment-info">

                                                        <form>
                                                            <div class="tab-for">               

                                                                <input type="hidden" value="">

                                                            </div>         
                                                        </form>
                                                        <h3 class="pay-title">Thông tin thẻ tín dụng</h3>
                                                        <form action="payment.htm" method="GET">
                                                            <input type="hidden" name="method" value="bank">
                                                            <input type="hidden" name="Id" value="${Id}">
                                                        <div class="tab-for">   
                                                            <h5>${messageBank}</h5>
                                                            <h5>Tên thẻ</h5>
                                                            <input name = "accountName" type="text" />
                                                            <h5>Số thẻ</h5>                                                    
                                                            <input class="pay-logo" name="accountNumber" type="text" required="Bạn phải nhập"  />

                                                        </div>  

                                                        <input type="submit" value="Tiếp tục">
                                                    </form>

                                                </div>
                                            </div>

                                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
                                                <div class="payment-info">

                                                    <div class="login-tab">
                                                        <div class="user-login">


                                                            <form action="payment.htm" method="GET">
                                                                <input type="hidden" name="method" value="cod">
                                                                <input type="hidden" name="Id" value="${Id}">
                                                                <!-- <input type="text" value="${us.email}"  >-->
                                                                <h5>${messageCod}</h5>
                                                                <h5>Thanh toán trực tiếp khi bạn nhận hàng</h5>

                                                                <div class="user-grids">

                                                                    <div class="user-right">
                                                                        <input type="submit" value="Tiếp tục">
                                                                    </div>
                                                                    <div class="clear"></div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">   
                                                <div class="payment-info">

                                                    <h3 class="pay-title">Ví tiền</h3>
                                                    <form action="payment.htm" >
                                                        <input type="hidden" name="method" value="package">
                                                        <input type="hidden" name="Id" value="${Id}">
                                                        <div class="tab-for">       
                                                            <h5>${messagePackage}</h5>
                                                            <h5>Thanh toán bằng ví điện tử của bạn</h5>


                                                        </div>  

                                                        <input type="submit" value="Tiếp tục">
                                                    </form>

                                                </div>  
                                            </div>
                                        </div>  
                                    </div>
                                </div> 
                            </div>
                            <div class="col-md-4 col-sm-12 order-info" define="{order_expand: false}">
                                <div class="order-summary order-summary--custom-background-color ">
                                    <div class="order-summary-header summary-header--thin summary-header--border">
                                        <h2>
                                            <label class="control-label">Đơn hàng</label>

                                        </h2>

                                    </div>
                                    <div class="order-items mobile--is-collapsed" bind-class="{'mobile--is-collapsed': !order_expand}">
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
                                            <span >
                                                ${total}đ
                                            </span>
                                        </div>
                                        <div class="total-line total-line-shipping clearfix" bind-show="requiresShipping">
                                            <span class="total-line-name pull-left">
                                                Phí vận chuyển: 
                                            </span>
                                            <span  >

                                                40.000đ

                                            </span>
                                        </div>
                                        <div class="total-line total-line-total clearfix">
                                            <span class="total-line-name pull-left">
                                                Tổng cộng: 
                                            </span>
                                            <span >
                                               
                                            <fmt:formatNumber type="number"  maxFractionDigits="3" value=' ${Float.parseFloat(total.replaceAll("[.]",""))+40000}' />
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group has-error">
                                    <div class="help-block ">
                                        <ul class="list-unstyled">

                                        </ul>
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




                        <div class="form-group clearfix hidden-md hidden-lg">
                            <input class="btn btn-primary col-md-12 mt10 btn-checkout" type="button" bind-event-click="paymentCheckout('AIzaSyDWReBlPxFt-i145Gsd502wOqRS0KXFHW4;AIzaSyAbtwApDToQWn7snVio3Y9PWFbcpdnOWdk;AIzaSyA5rJOu8wci0li24bnZ1WogMEH93p-DGlM')" value="ĐẶT HÀNG" />
                        </div>
                    </div>

                </div>
            </div>



            <div class="modal fade" id="refund-policy" data-width="" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Chính sách hoàn trả</h4>
                        </div>
                        <div class="modal-body">
                            <pre></pre>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="privacy-policy" data-width="" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Chính sách bảo mật</h4>
                        </div>
                        <div class="modal-body">
                            <pre></pre>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="terms-of-service" data-width="" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Điều khoản sử dụng</h4>
                        </div>
                        <div class="modal-body">
                            <pre></pre>
                        </div>
                    </div>
                </div>
            </div>

        </form>

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