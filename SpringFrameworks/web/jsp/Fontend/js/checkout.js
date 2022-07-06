window.Bizweb || (window.Bizweb = {});
(function () {
    Bizweb.Utility = {
        getParameter: function (name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
    }
    Bizweb.Checkout = function () {
        function Checkout(e, options) {
            if(!options)
                options = {};

            this.ele = e;
            this.existCode= options.existCode;
            this.totalOrderItemPrice = options.totalOrderItemPrice;
            this.discount = options.discount;
            this.shippingFee = options.shippingFee;
            this.freeShipping = options.freeShipping;
            this.requiresShipping = options.requiresShipping;
            this.code = options.code;
            this.inValidCode = false;
            this.discountShipping = false;
            this.shippingMethods = [];
            this.loadedShippingMethods = false;
            this.settingLanguage = options.settingLanguage;
            this.invalidEmail = false;
            this.moneyFormat = options.moneyFormat;
            this.discountLabel = options.discountLabel;
            this.districtPolicy = options.districtPolicy;
            this.district = options.district;
            this.billingLatLng = {};
            this.shippingLatLng = {};
            this.customerAddress = null;
            this.province = options.province;

            var that = this;

            $("[name='code']").keyup(function(event){
                if(event.keyCode == 13){
                    that.caculateShippingFee();
                    event.preventDefault();
                    return false;
                }
            });

            var coupon = Bizweb.Utility.getParameter("coupon");
            if(coupon)
                this.code = coupon;
        };

        Checkout.prototype.changeOtherAddress = function(element){
            element.value = this.otherAddress;
            if(this.otherAddress){
                $("select[name='ShippingProvinceId']").trigger("change");
            }else{
                $("select[name='BillingProvinceId']").trigger("change");
            }
        }

        Checkout.prototype.changeCustomerAddress = function (model) {
            if (this.customerAddress != null) {
                this.customerAddress = model;

                $("select[name='BillingProvinceId'] option").filter(function () {
                    return $(this).text() == model.city;
                }).prop('selected', true).trigger("change");
            }
            else {
                this.customerAddress = model;
            }

        }

        Checkout.prototype.shippingCountryChange = function () {
            if (!this.ortherAddress) {
                var that = this;
                if (this.show_country) {
                    $.ajax({
                        url: "/checkout/getprovinces?countryId=" + that.ShippingCountryId,
                        success: function (data) {
                            var html = "<option value=''>--- Chọn tỉnh thành ---</option>";

                            for (var i = 0; i < data.length; i++) {
                                var province = data[i];
                                var selected = (that.province === province.name) || (that.customerAddress != null && that.customerAddress.province === province.name);
                                html += "<option value='" + province.id + "'" + (selected ? "selected='selected'" : "") + ">" + province.name + "</option>";
                            }

                            $("select[name='ShippingProvinceId']").empty().html(html);
                            $("select[name='ShippingProvinceId']").trigger("change");
                        }
                    });
                }
            }
        }

        Checkout.prototype.shippingProviceChange = function(){
            if(this.otherAddress)
            {
                var that = this;
                if(this.show_district)
                {
                    this.showShippingDistrict();
                }
                else {
                    this.caculateShippingFee();
                }
            }else{
                var initDistrict = $("select[name='ShippingDistrictId'] >option").length > 0 ? false : true;
                if(initDistrict){
                    if(this.show_district)
                    {
                        this.showShippingDistrict();
                    }
                }
            }
        }

        Checkout.prototype.showShippingDistrict = function(){
            var that = this;
            $.ajax({
                url:"/checkout/getdistricts?provinceId=" + that.ShippingProvinceId,
                async: false,
                success:function(data)
                {
                    var html = "<option value=''>--- Chọn quận huyện ---</option>";

                    for (var i = 0; i < data.length; i++) {
                        var district = data[i];
                        var selected = that.district === district.name;
                        html += "<option value='" + district.id + "'" + (selected ? "selected='selected'" : "") + ">" + district.name + "</option>"
                    }

                    $("select[name='ShippingDistrictId']").empty().html(html);
                    $("select[name='ShippingDistrictId']").trigger("change");
                }
            });
        }

        Checkout.prototype.billingCountryChange = function () {
            if (!this.ortherAddress) {
                var that = this;
                if (this.show_country) {
                    $.ajax({
                        url: "/checkout/getprovinces?countryId=" + that.BillingCountryId,
                        success: function (data) {
                            var html = "<option value=''>--- Chọn tỉnh thành ---</option>";

                            for (var i = 0; i < data.length; i++) {
                                var province = data[i];
                                var selected = (that.province === province.name) || (that.customerAddress != null && that.customerAddress.province === province.name);
                                html += "<option value='" + province.id + "'" + (selected ? "selected='selected'" : "") + ">" + province.name + "</option>";
                            }

                            $("select[name='BillingProvinceId']").empty().html(html);
                            $("select[name='BillingProvinceId']").trigger("change");
                        }
                    });
                }
            }
        }

        Checkout.prototype.billingProviceChange = function () {
            if(!this.otherAddress)
            {
                var that = this;
                if (this.show_district) {
                    $.ajax({
                        url: "/checkout/getdistricts?provinceId=" + that.BillingProvinceId,
                        async: false,
                        success: function (data) {
                            var html = "<option value=''>--- Chọn quận huyện ---</option>";

                            for (var i = 0; i < data.length; i++) {
                                var district = data[i];
                                var selected = (that.district === district.name) || (that.customerAddress != null && that.customerAddress.district === district.name);
                                html += "<option value='" + district.id + "'" + (selected ? "selected='selected'" : "") + ">" + district.name + "</option>"
                            }

                            $("select[name='BillingDistrictId']").empty().html(html);
                            $("select[name='BillingDistrictId']").trigger("change");
                        }
                    });
                }
                else {
                    this.caculateShippingFee();
                }
            }
        }

        Checkout.prototype.shippingDistrictChange = function(){
            if(this.otherAddress)
            {
                this.caculateShippingFee();
            }
        }

        Checkout.prototype.billingDistrictChange = function(){
            if(!this.otherAddress)
            {
                this.caculateShippingFee();
            }
        }

        Checkout.prototype.changeShippingMethod = function(){
            var shippingFee = parseFloat( $("[name='ShippingMethod'] option:selected").attr("fee"));
            if(this.discountShipping){
                if(shippingFee <= 0){
                    this.freeShipping = true;
                    this.discount = shippingFee;
                }else{
                    this.freeShipping = false;
                    this.discount = 0;
                }
            }else{
                if(shippingFee <= 0){
                    this.freeShipping = true;
                }else{
                    this.freeShipping = false;
                }
            }
            this.shippingFee = shippingFee;
        }
        Checkout.prototype.removeCode = function(){
            this.code = "";
            this.caculateShippingFee();
        }
        Checkout.prototype.caculateShippingFee = function(){
            var that = this;

            if(this.settingLanguage != "vi"){
                var provinceId = 0;
                var districtId = 0;
            }else{
                var provinceId = that.otherAddress ? that.ShippingProvinceId : that.BillingProvinceId;
                var districtId = that.otherAddress ? that.ShippingDistrictId : that.BillingDistrictId;
            }
            var shippingMethod = $("[name='ShippingMethod'] option:selected").val();

            $.ajax({
                url:"/checkout/getshipping?provinceId=" + provinceId  + "&districtId=" + districtId + "&code=" + that.code + "&shippingMethod="+shippingMethod,
                type:"GET",
                success:function(data)
                {
                    that.loadedShippingMethods = true;

                    if(data.error)
                    {
                        //Lỗi
                        that.shippingMethods = [];
                        Twine.refreshImmediately();
                    }
                    else{
                        that.existCode = data.exist_code;
                        if(that.code && !that.existCode)
                        {
                            that.inValidCode = !that.existCode;
                        }
                        else{
                            that.inValidCode = false;
                        }
                        that.freeShipping = data.free_shipping;
                        that.code= data.code;
                        that.discount = data.discount;
                        that.totalOrderItemPrice = data.total_line_item_price;
                        if(that.requiresShipping)
                            that.shippingMethods = data.shipping_methods;
                        that.discountShipping = data.discount_shipping;
                        Twine.refreshImmediately();
                        var html = "";
                        for(var index in that.shippingMethods)
                        {
                            var shippingMethod = that.shippingMethods[index];
                            html += "<option fee=" + shippingMethod.fee + " value=" + shippingMethod.value + ">" + shippingMethod.name + " - " +( shippingMethod.fee > 0 ? money(shippingMethod.fee, that.moneyFormat) : that.discountLabel )  +  "</option>"
                        }
                        $("select[name='ShippingMethod']").empty().html(html);
                        $("select[name='ShippingMethod']").val(data.shipping_method);
                        $("select[name='ShippingMethod']").trigger("change");
                    }
                }
            });
            return false;
        }

        Checkout.prototype.paymentCheckout = function (googleApiKey) {
            var that = this;
            
            var listAPIKey = googleApiKey;
            if (listAPIKey !== null && listAPIKey !== "" && listAPIKey !== 'undefined') {
                listAPIKey = listAPIKey.split(";");
                var apiKey = listAPIKey[Math.floor(Math.random() * listAPIKey.length)];
                var urlGoogleMapsApi = "https://maps.googleapis.com/maps/api/js?key=" + apiKey;

                that.loadScriptGoogleMapApi(urlGoogleMapsApi, function (resultLoadApi) {
                    if (resultLoadApi === true) {
                        var billingAddress = that.getBillingAddress();
                        if (that.otherAddress) {
                            var shippingAddress = that.getShippingAddress();

                            that.getLatLong(billingAddress, function (billingAddressResult) {
                                that.setBillingLatLng(billingAddressResult);
                                that.getLatLong(shippingAddress, function (shippingAddressResult) {
                                    that.setShippingLatLng(shippingAddressResult);
                                    that.returnCheckout();
                                });
                            });
                        }
                        else {
                            that.getLatLong(billingAddress, function (billingAddressResult) {
                                that.setBillingLatLng(billingAddressResult);
                                that.setShippingLatLng(billingAddressResult);
                                that.returnCheckout();
                            });
                        }
                    }
                    else {
                        that.setBillingLatLng(false);
                        that.setShippingLatLng(false);
                        that.returnCheckout();
                    }
                });
            }
            else {
                that.setBillingLatLng(false);
                that.setShippingLatLng(false);
                that.returnCheckout();
            }
        }

        Checkout.prototype.toggle = function(e, container) {
            var $toggle = $(e);
            var $container = $(container);

            $container.wrapInner("<div />");

            var i = $container.height();
            var r = $container.find("> div").height();
            var n = 0 === i ? r : 0;

            $container.css("height", i);
            $container.find("> div").contents().unwrap();

            setTimeout(function(i) {
                return function() {
                    $toggle.toggleClass("open");
                    $container.toggleClass("mobile--is-expanded mobile--is-collapsed");
                    $container.addClass("mobile--transition");
                    $container.css("height", n);
                }
            }(this), 0);

            $container.one("webkitTransitionEnd oTransitionEnd otransitionend transitionend msTransitionEnd", function(t) {
                return function(t) {
                    if($container.is(t.target)) {
                        $container.removeClass("mobile--transition");
                        $container.removeAttr("style");
                    }
                }
            }(this))
        }

        Checkout.prototype.getShippingAddress = function () {
            var that = this;
            var address = "";
            if (that.shipping_address.address1) {
                address += that.shipping_address.address1 + ", ";
            }

            if (that.ShippingDistrictId) {
                var districtName = $("#shippingDistrict").find(":selected").text();
                if (districtName) {
                    address += districtName + ", ";
                }
            }
            if (that.ShippingProvinceId) {
                var provinceName = $("#shippingProvince").find(":selected").text();
                if (provinceName) {
                    address += provinceName;
                }
            }

            if (that.ShippingCountryId) {
                var countryName = $("#shippingCountry").find(":selected").text();
                if (countryName) {
                    address += ", " + countryName;
                }
            }

            return address;
        }

        Checkout.prototype.getBillingAddress = function () {
            var that = this;
            var address = "";

            if (that.billing_address.address1) {
                address += that.billing_address.address1 + ", ";
            }

            if (that.BillingDistrictId) {
                var districtName = $("#billingDistrict").find(":selected").text();
                if (districtName) {
                    address += districtName + ", ";
                }
            }
            if (that.BillingProvinceId) {
                var provinceName = $("#billingProvince").find(":selected").text();
                if (provinceName) {
                    address += provinceName;
                }
            }

            if (that.BillingCountryId) {
                var countryName = $("#billingCountry").find(":selected").text();
                if (countryName) {
                    address += ", " + countryName;
                }
            }

            return address;
        }

        Checkout.prototype.loadScriptGoogleMapApi = function (url, callback) {
            jQuery.ajax({
                url: url,
                dataType: 'script',
                async: true,
                success: function () {
                    callback(true);
                },
                error: function () {
                    callback(false);
                }
            });
        }

        Checkout.prototype.getLatLong = function (address, callback) {
            // If adress is not supplied, use default value 'Ferrol, Galicia, Spain'
            address = address || '266 Đội Cấn, Ba Đình, Hà Nội';
            // Initialize the Geocoder
            if (typeof google !== 'undefined') {
                geocoder = new google.maps.Geocoder();
                if (geocoder && geocoder.geocode) {
                    geocoder.geocode({
                        'address': address
                    }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            callback(results[0]);
                        }
                        else {
                            callback(false);
                        }
                    });
                }
                else {
                    callback(false);
                }
            }
            else {
                callback(false);
            }
        }

        Checkout.prototype.setShippingLatLng = function (result) {
            if (result == false) {
                this.shippingLatLng.Lat = "";
                this.shippingLatLng.Lng = "";
            }
            else {
                this.shippingLatLng.Lat = result.geometry.location.lat();
                this.shippingLatLng.Lng = result.geometry.location.lng();
            }
        }

        Checkout.prototype.setBillingLatLng = function (result) {
            if (result == false) {
                this.billingLatLng.Lat = "";
                this.billingLatLng.Lng = "";
            }
            else {
                this.billingLatLng.Lat = result.geometry.location.lat();
                this.billingLatLng.Lng = result.geometry.location.lng();
            }
        }

        Checkout.prototype.returnCheckout = function () {
            var that = this;
            var $form = $("form.formCheckout");
            var prvdId = parseInt($(".iradio_square.checked .icheck.square").attr("data-check-id"));
            if (prvdId == 2) {
                if (!$("#onepay_visa_confirm").is(":checked")) {
                    alert("Bạn chưa đồng ý với các điều khoản và dịch vụ của Onepay!");
                    return false;
                }
            } else if (prvdId == 1) {
                if (!$("#onepay_atm_confirm").is(":checked")) {
                    alert("Bạn chưa đồng ý với các điều khoản và dịch vụ của Onepay!");
                    return false;
                }
            } else if (prvdId == 11) {
                $form.validator('validate');
                if ($(".help-block.with-errors > ul").length <= 0) {
                    var url = "/checkout";
                    var method = "POST";
                    NProgress.start();
                    $.ajax({
                        url: url,
                        type: method,
                        global: false,
                        data: $form.serialize(),
                        success: function (data) {
                            if (data.error == "0") {
                                $(".trigger-moca-error-modal").trigger("click");
                            } else if (data.error == "fail") {
                                window.location.href = "/checkout/failure/" + data.order_id;
                            } else {
                                $("#moca-modal iframe").attr("src", data.moca_iframe_url);

                                $(".trigger-moca-modal").trigger("click");
                            }
                            NProgress.done();
                        }
                    });
                }
                return false;
            }

            var browserWidth = $(window).width();
            var browserHeight = $(window).height();

            $form.append('<input type="hidden" type="text" class="form-control" name="BillingAddress.Latitude" value="' + that.billingLatLng.Lat + '" />');
            $form.append('<input type="hidden" type="text" class="form-control" name="BillingAddress.Longitude" value="' + that.billingLatLng.Lng + '" />');
            $form.append('<input type="hidden" type="text" class="form-control" name="ShippingAddress.Latitude" value="' + that.shippingLatLng.Lat + '" />');
            $form.append('<input type="hidden" type="text" class="form-control" name="ShippingAddress.Longitude" value="' + that.shippingLatLng.Lng + '" />');
            $form.append('<input type="hidden" type="text" class="form-control" name="BrowserWidth" value="' + browserWidth + '" />');
            $form.append('<input type="hidden" type="text" class="form-control" name="BrowserHeight" value="' + browserHeight + '" />');
            $form.submit();
            return true;
        }

        return Checkout;
    }();
}).call(this)