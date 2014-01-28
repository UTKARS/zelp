$(document).ready(function() {


  $(".left").on("click",function(){
  	if($(this).hasClass("filled")){
	  	$(".left").each(function () {
	        $(this).removeClass().addClass("left");
	    });
  	}
  	

  	var title_value = $(this).attr("title")
  	$(".left").each(function () {
        if($(this).attr("title") <= title_value){
        	$(this).addClass("filled");      	
        }
    }); 

	 var e_id = $("#eatery").val();
     $.ajax({
      url: '/eatery/assign_ratings', 
      type: 'POST',   
      dataType: 'json',
      aysnc: false,
      data: {eatery_id: e_id, rating: title_value },
      success: function(data){
      		var data = jQuery.parseJSON(data);
	        $("#rating").text(data.ratings);
	        $("#votes").text(data.votes);
        },
      dataType: 'html'
    });    

  });

});