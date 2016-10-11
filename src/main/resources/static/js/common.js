

$(document).scroll(function(){
		var y = $(this).scrollTop();
		
		if (y>60){
			$("ul.menu").addClass("min");
			/*$(".menu").css({"background":"rgba(0,0,0,0.7)"});
			$(".menu li a").css({"line-height":"40px", "font-size":"16px"});
			$(".menu li .ul-lv1").css({"top":"40px", "background":"rgba(0,0,0,0.6)"});
			$(".menu li .ul-lv1 li a").css({"font-size":"13px","line-height":"35px"});*/
			$(".toTop").fadeIn();
		} else if (y==0){
			$("ul.menu").removeClass("min");
			/*$(".menu").css({"background":"rgba(0,137,123,1)"});
			$(".menu li a").css({"line-height":"60px", "font-size":"20px"});
			$(".menu li .ul-lv1").css({"top":"60px", "background":"rgba(0,137,123,0.8)"});
			$(".menu li .ul-lv1 li a").css({"font-size":"15px","line-height":"45px"});*/
			$(".toTop").fadeOut();
		}
});

$(document).on('click', '.toTop', function(){
	$("html, body").animate({scrollTop: 0}, 500);
	return false;
});

$(document).ready(function(){
	
});
