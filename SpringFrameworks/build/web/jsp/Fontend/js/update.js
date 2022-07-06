/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function updateView(id){
     window.location="updateView.htm?Id="+id;
}
function updateBuyItem(id){
     window.location="updateBuyItem.htm?Id=" + id;
}
function searchProduct(){
    var params = {};
    params.priceFrom = $('.from').val();
    params.priceTo = $('.to').val();
    $.ajax({
        cache: false,
        url:'/SpringFrameworks/searchPrice.htm',
        type:'POST',
        data: params,
        //dataType: 'json',
       success: function (data) {
            $('#data').html(data);
            console.log("SUCCESS: ", data);
        },
        error: function (e) {
            //console.log("ERROR: ", e);
            //display(e);
        },
        done: function (e) {
            //console.log("DONE");
        }
    });
}

$(document).ready(function () {
    $("#catalog li").on('click', 'a', function () {
        getProductByCatalog($(this).attr('class'),$(this).attr('id'));
    });
});


function getProductByCatalog(id, name) {
    var params = {};
    params.Id = id;
    $.ajax({
        cache: false,
        url: "/SpringFrameworks/getProductByCatalogId.htm", // duong dan xư lí dữ liệu, nó tương tự như action của form
        type: 'POST', //  kieu gưi du lieu len GET or POST
        data: params,
        //dataType : 'json', //kieu dữ liệu trả về có thể là html, xml,json,text
        success: function (data) {
            $('#taba'+name).html(data);
            console.log("SUCCESS: ", data);
        },
        error: function (e) {
            //console.log("ERROR: ", e);
            //display(e);
        },
        done: function (e) {
            //console.log("DONE");
        }
    });
}

$(document).ready(function () {
    $("#pro li").on('click', 'a', function () {
        getProduct($(this).attr('class'));
    });
});


function getProduct(id) {
    var params = {};
    params.Id = id;
    $.ajax({
        cache: false,
        url: "/SpringFrameworks/getProduct.htm", // duong dan xư lí dữ liệu, nó tương tự như action của form
        type: 'POST', //  kieu gưi du lieu len GET or POST
        data: params,
        //dataType : 'json', //kieu dữ liệu trả về có thể là html, xml,json,text
        success: function (data) {
            $('#data').html(data);
            console.log("SUCCESS: ", data);
        },
        error: function (e) {
            //console.log("ERROR: ", e);
            //display(e);
        },
        done: function (e) {
            //console.log("DONE");
        }
    });
}

$(document).ready(function () {
    $("#color li").on('click', 'a', function () {
        getProductColor($(this).attr('class'));
    });
});


function getProductColor(id) {
    var params = {};
    params.Id = id;
    $.ajax({
        cache: false,
        url: "/SpringFrameworks/getProductByColor.htm", // duong dan xư lí dữ liệu, nó tương tự như action của form
        type: 'POST', //  kieu gưi du lieu len GET or POST
        data: params,
        //dataType : 'json', //kieu dữ liệu trả về có thể là html, xml,json,text
        success: function (data) {
            $('#data').html(data);
            console.log("SUCCESS: ", data);
        },
        error: function (e) {
            //console.log("ERROR: ", e);
            //display(e);
        },
        done: function (e) {
            //console.log("DONE");
        }
    });
}

$(document).ready(function () {
    $("#provider li").on('click', 'a', function () {
        getProductByProvider($(this).attr('class'));
    });
});


function getProductByProvider(id) {
    var params = {};
    params.Id = id;
    $.ajax({
        cache: false,
        url: "/SpringFrameworks/getProductByProvider.htm", // duong dan xư lí dữ liệu, nó tương tự như action của form
        type: 'POST', //  kieu gưi du lieu len GET or POST
        data: params,
        //dataType : 'json', //kieu dữ liệu trả về có thể là html, xml,json,text
        success: function (data) {
            $('#data').html(data);
            console.log("SUCCESS: ", data);
        },
        error: function (e) {
            //console.log("ERROR: ", e);
            //display(e);
        },
        done: function (e) {
            //console.log("DONE");
        }
    });
}

$(document).ready(function() {
		$('a#about').click(function(event) {
	 	
		 	$.ajax({
		 		url: '/SpringFrameworks/about.htm',
		 		type: 'GET',
		 		dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
		 		data: {id: id},
		 		success:function(res){
	 				$('#about').load(location.href + " #about>*","");
	 			}
	 		});
  		});
  });


$(document).ready(function() {
		$('a#contact').click(function(event) {
	 	
		 	$.ajax({
		 		url: '/SpringFrameworks/contact.htm',
		 		type: 'GET',
		 		dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
		 		data: {id: id},
		 		success:function(res){
	 				$('#about').load(location.href + " #about>*","");
	 			}
	 		});
  		});
 	 });


