/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$("#subcate row").click(function() {

    $.ajax({
      type: "GET",
      url: "test.html",
      dataType: "text",
      success : function(data) {
            $("#texter").html(data);
            //step1j = data;
            //alert(step1j); // WORKS
            //return step1j;
      }
});
});