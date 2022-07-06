/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function getProductbyId(id){
    var params= {};
    params.id = $('.hehe').val;
    $.ajax({
        cache: false,
        url: '',
        type: 'POST',
        data: params,
        success: function (data) {
            $('#data').html(data);
            console.log("SUCCESS",data);
            
        },
        error: function () {
            
        }
    });
            
    
}