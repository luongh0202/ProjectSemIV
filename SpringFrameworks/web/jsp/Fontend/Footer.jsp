<%-- 
    Document   : Footer
    Created on : Jun 5, 2017, 9:54:48 AM
    Author     : LuongHoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="privacy">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                            <img src="/SpringFrameworks/jsp/Fontend/images/icon-privacy1.png" class="icon" width="70">
				<div class="meta">
					<h3>Miễn phí giao hàng</h3>
					<p>Chúng tôi sẽ miễn phí và giao hàng tân tay cho đơn hàng trên 1.000.000đ</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				<img src="/SpringFrameworks/jsp/Fontend/images/icon-privacy2.png" class="icon" width="70">
				<div class="meta">
					<h3>Hoàn trả lại tiền</h3>
					<p>Nếu như sản phẩm không đúng với chất lượng được mô tả trên website</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				<img src="/SpringFrameworks/jsp/Fontend/images/icon-privacy3.png" class="icon" width="70">
				<div class="meta">
					<h3>Hỗ trợ 24/7</h3>
					<p>Nếu bạn cần tư vấn hãy liên lạc ngay với chúng tôi để được hỗ trợ</p>
				</div>
			</div>
		</div>
	</div>	
</section>
<div class="modal fade" id="quickView" tabindex="-1" role="dialog" aria-labelledby="quickView" style="display:none"></div>
<div class="quickViewTemplate" style="display:none">
  <div class="quickViewWrapper">
    <a href="javascript:void(0)" class="close" data-dismiss="modal"><i class="fa fa-times"></i></a>    
    <div class="clearfix">
      <div class="quickViewImg">
        <div class="quickViewFeaturedImg">
          <img src="" class="img-fix" alt="Ảnh sản phẩm">
        </div>
        <div class="quickViewThumbImg"></div>		  
      </div>
      <div class="quickViewProduct">
		 <div class="quickViewProductTitle"></div>
		  
		 <div class="quickViewProductMeta clearfix">
			<div class="quickViewProductVendor"></div>
			<div class="quickViewProductBrand"></div>			
        </div>      
		
        <div class="quickViewProductDesc"></div>
		<div class="quickViewProductPrice">
          <span></span>
          <del style="display:none"></del>
        </div>		
        
        <div class="quickViewProductActions clearfix">
          <form action="/cart/add" method="post" class="quickViewProductVariants">
            <select name='variantId' style="display:none"></select>
            <div class="quickViewProductQuantity">
                <label>Số lượng:</label>
                <input type="number" title="Số lượng" value="1" min="1" class="quickviewQty" id="quickviewQty" name="quantity">
            </div>
            <div class="quickViewProductButtons">
                <button class="button quickViewAddCart blue">
                  <i class="fa fa-shopping-cart"></i>&nbsp; Cho vào giỏ hàng
                </button>
				<a href="javascript:void(0);" class="button blue quickViewContact" style="display:none;" data-code="">
                  Liên hệ
                </a>               
                
            </div>
          </form>
			<div class="quickViewCountDown" style="display:none">
				<p class="days"></p>
				<p class="hours"></p>
				<p class="minutes"></p>
				<p class="seconds"></p>
			</div>
        </div>
		
      </div>
    </div>
  </div>
</div>





 <footer id="footer">
    <div class="container">
      <div class="top-footer">
        <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
            <div class="footer-contact">
              
              <img src="/SpringFrameworks/jsp/Fontend/images/logo-white.png" class="img-fix1" alt="new-boutique">
              
              <p>Đây là đoạn giới thiệu ngắn của công ty/cửa hàng mà bạn muốn quảng cáo. Vui lòng vào thiết lập giao diện để thiết lập phần này.</p>
              <ul class="list-unstyled address">                    
                    <li>
                        <span class="fa fa-map-marker"></span>
                        Minh Khai, Hai Bà Trưng, Hà Nội
                    </li> 
                    <li>
                        <span class="fa fa-phone"></span>
                        01677852765
                    </li>                    
                    
                    <li class="last">
                        <span class="fa fa-envelope-o"></span>
                        vuongngocdoan@gmail.com
                    </li>
                    
                </ul>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
            <div class="footer-news">
              <h3 class="footer-title">Tin tức</h3>
                <ul class="list-unstyled list-news">
                    
                    <li class="clearfix">
                      
                      <div class="text">
                        <h4><a href="/ngam-street-style-qua-da-mat-cua-gioi-tre-the-gioi" title="Ngắm street style quá đã mắt của giới trẻ thế giới">Ngắm street style quá đã mắt của giới trẻ thế giới</a></h4>
                        <div class="desc"><p>Cùng chiêm ngưỡng street style của các bạn trẻ thế giới tuần qua và "bỏ... <a href="/ngam-street-style-qua-da-mat-cua-gioi-tre-the-gioi">Đọc thêm <i class="fa fa-angle-right"></i></a></div>            
                      </div>
                    </li>
                    
                    <li class="clearfix">
                      
                      <div class="text">
                        <h4><a href="/show-dien-sieu-man-nhan-cung-hang-ghe-dau-toan-sieu-mau-cua-topshop-unique" title="Show diễn siêu mãn nhãn cùng hàng ghế đầu toàn siêu mẫu của Topshop Unique">Show diễn siêu mãn nhãn cùng hàng ghế đầu toàn siêu mẫu của Topshop Unique</a></h4>
                        <div class="desc"><p>Show diễn Thu Đông 2016 của thương hiệu Anh Quốc vừa trở thành tâm điểm... <a href="/show-dien-sieu-man-nhan-cung-hang-ghe-dau-toan-sieu-mau-cua-topshop-unique">Đọc thêm <i class="fa fa-angle-right"></i></a></div>            
                      </div>
                    </li>
                    
                    <li class="clearfix">
                      
                      <div class="text">
                        <h4><a href="/ngam-lookbook-xuan-vua-sexy-vua-ca-tinh-cua-loat-thuong-hieu-quen-ten" title="Ngắm lookbook Xuân vừa sexy vừa cá tính của loạt thương hiệu quen tên">Ngắm lookbook Xuân vừa sexy vừa cá tính của loạt thương hiệu quen tên</a></h4>
                        <div class="desc"><p>H&amp;M, Nasty Gal và Free People vừa chiêu đãi các tín đồ thời trang lookbook... <a href="/ngam-lookbook-xuan-vua-sexy-vua-ca-tinh-cua-loat-thuong-hieu-quen-ten">Đọc thêm <i class="fa fa-angle-right"></i></a></div>            
                      </div>
                    </li>
                    
                </ul>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
            <div class="footer-linklists">
              <h3 class="footer-title">Chính sách</h3>
              <ul class="list-unstyled">
                
                <li><a href="/chinh-sach">Chính sách thanh toán</a></li>           
                
                <li><a href="/chinh-sach">Chính sách vận chuyển</a></li>           
                
                <li><a href="/chinh-sach">Chính sách đổi trả</a></li>           
                
                <li><a href="/chinh-sach">Chính sách bảo hành</a></li>           
                     
              </ul>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
            <div class="footer-linklists">
              <h3 class="footer-title">Điều khoản dịch vụ</h3>
              <ul class="list-unstyled">
                
                <li><a href="/dieu-khoan-dich-vu">Điều khoản sử dụng</a></li>  
                
                <li><a href="/dieu-khoan-dich-vu">Điều khoản giao dịch</a></li>  
                
                <li><a href="/dieu-khoan-dich-vu">Dịch vụ tiện ích</a></li>  
                
                <li><a href="/dieu-khoan-dich-vu">Quyền sở hữu trí tuệ</a></li>  
                
                <li><a href="/huong-dan-tao-bo-loc-san-pham">Hướng dẫn sử dụng bộ lọc</a></li>  
                              
              </ul>
            </div>
          </div>
        </div>
      </div>
      
      <div class="middle-footer">        
        <div class="row">
          <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="border-right-box">
              <h3>Cách thức thanh toán</h3> 
              <img src="/SpringFrameworks/jsp/Fontend/images/payment-methods.png" class="img-1" alt="Phương thức thanh toán">              
            </div>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="border-right-box">
              <h3>Chứng nhận</h3>
              <img src="/SpringFrameworks/jsp/Fontend/images/certify.png" class="img-fix1" alt="Chứng nhận">
             
            </div>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="border-right-box">
              <h3>Dịch vụ giao hàng</h3>
              <img src="/SpringFrameworks/jsp/Fontend/images/shipping-methods.png" class="img-fix1" alt="Dịch vụ giao hàng">              
            </div>
          </div>
        </div>        
      </div>
      
    </div>
    <div class="bottom-footer">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-6">  
            <p class="copyright">&copy; Bản quyền thuộc về <b>New-Boutique</b> | Cung cấp bởi <b><a href="">BKAP</a></b></p>
          </div>
          
          <div class="col-xs-12 col-sm-6 col-md-6">
            <ul class="list-unstyled social-list">
              <li>Liên hệ với chúng tôi</li>
              
              <li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
              
              
              <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
              
              
              <li><a href="" class="google"><i class="fa fa-google-plus"></i></a></li>
              
              
              <li><a href="#" class="youtube"><i class="fa fa-youtube"></i></a></li>
              
            </ul>
          </div>
          
        </div>
      </div>
    </div>
  </footer>
 

  


  <div class="modal fade toolbox" id="hotline-box" role="dialog" aria-labelledby="Liên hệ">
	  <div class="modal-container">
		  <div class="entry-modal">
			  <h3 style="text-align: center;margin-bottom:15px"><span style="font-size:18px;"><strong>Đường dây nóng</strong></span></h3>

<p style="text-align: center;">Nếu bạn có thắc mắc cần giải đáp hoặc hỗ trợ về sản phẩm, hãy nhấc máy ngay và gọi đến số</p>

<p style="text-align: center;"><span style="color:#FF8C00;"><span style="font-size:20px;"><strong><span style="background-color:#FFFFFF;">01627453860</span></strong></span></span></p>

<em>Chú ý; Chúng tôi chỉ hỗ trợ từ 8h đến 17h30, ngoài giờ hành chính vui lòng không liên lạc</em></p>

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
			<a href="myCart.htm" class="toolbox-cart"><i class="fa fa-shopping-bag" ></i></a>
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

 <script src='/SpringFrameworks/jsp/Fontend/js/jquery.lazyload.min.js' type='text/javascript'></script> 
<script src='/SpringFrameworks/jsp/Fontend/js/plugin_necessary.js' type='text/javascript'></script>
<script src='/SpringFrameworks/jsp/Fontend/js/main.js' type='text/javascript'></script>