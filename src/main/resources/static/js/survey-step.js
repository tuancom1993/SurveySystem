// <![CDATA[
	
$(document).ready(function(){

	/*...move question.....*/
	$(".toTop").click(function(){
		/*$("section").css("opacity","0");*/
		$("section").removeClass("current");
		setTimeout(
			function() 
			{
				$("#sec-head").addClass("current");
			   	$("#sec-head").delay(1000).css("opacity", "1");
			}, 500);
	});

	$(".currentQuestion").click(function(){
		var currentDiv = $("section.current");
		$("html, body").animate({scrollTop: currentDiv.offset().top}, 700);
	});

	$(".move.up").click(function(){
		/*if(checkMandatory($(this).parent().find(".wrap-if")) == false) return false;*/
		/*$("section").css("opacity","0");*/
		$("section").removeClass("current");
		var secNext = $(this).parent().prev();
		
		$("html, body").animate({scrollTop: secNext.offset().top - 50}, 500);
		$("html, body").animate({scrollTop: secNext.offset().top}, 500);

		setTimeout(
			function() 
			{
			   	/*$(secNext).delay(1000).css("opacity", "1");*/
			   	$(secNext).addClass("current");
			}, 500);	
	});

	$(".move.down").click(function(){
		console.log("Click down....");
		if(checkMandatory($(this).parent().find(".wrap-if")) == false) return false;
		/*$("section").css("opacity","0");*/
		$("section").removeClass("current");
		var secNext = $(this).parent().next();
		$("html, body").animate({scrollTop: secNext.offset().top + 50}, 500);
		$("html, body").animate({scrollTop: secNext.offset().top}, 500);

		setTimeout(
			function() 
			{
			   	/*$(secNext).delay(1000).css("opacity", "1");*/
			   	$(secNext).addClass("current");
			}, 500);
		return false;
	});


	/*disableScroll();*/

	$("#btn-submit").click(function(){
		/*if(checkMandatory() == false) return false;*/
		
		$.ajax({
		contentType: 'application/json; charset=utf-8',
		type: 'POST',
		url: '/survey',
		data: getValueJson(),
		success : function(data) {
				window.location.href = "/survey/success?i="+$("#idsurvey").val();
		},

		});
	});


	$(".btn-showFeedback").click(function(){
		console.log(".btn-showFeedback clicked");
		$("#partten").fadeIn(400);
		$(".feedbackblock-form").slideDown(500);
	});

	$("#partten").click(function(){
		$("#partten").fadeOut(500);
		$(".feedbackblock-form").slideUp(400);
	});

	$(".btn-giveFeedback").click(function(){
		if($("#name").val()=="" || $("#area-feedback").val() == "" || $("#contact").val()==""){
			$(".message-result").text("Please complete all information first.");
			return false;
		}
		$.ajax({
			contentType: 'application/json; charset=utf-8',
			type: 'POST',
			url: '/feedback-block',
			data: getJsonFeedback(),
			success : function(data) {
				if (data == "OK") {
					console.log("feedback thanh cong");
					$(".message-result").text("Your feedback has been sent to System...");
				}
			},
		});
	});

}); /*end ready()*/


/************Hot key to move**********/
$(document).keydown(function(e){
	if(((e.keyCode == 13)&&e.ctrlKey) || e.keyCode == 40) {
		console.log(e.keyCode);
		$("section.current .move.down").click();
		return false;
	} else if(e.keyCode == 38){
		$("section.current .move.up").click();
		return false;
	}
});

	function getValueJson(){
		var datasurvey = new Object();
		datasurvey["idsurvey"]= $("#idsurvey").val();

		var answerusers = new Array();

		var arrTextBox = $("section input[type=text]");
		arrTextBox.each(function(index, textBox){
			var answerUser = new Object();
			answerUser["idquestion"] = $(textBox).attr("data-idq");
			answerUser["content"] = $(textBox).val();
			answerusers.push(answerUser);
		});

		var arrArea = $("section textarea");
		arrArea.each(function(index, area){
			var answerUser = new Object();
			answerUser["idquestion"] = $(area).attr("data-idq");
			answerUser["content"] = $(area).val();
			answerusers.push(answerUser); 
		});

		var arrCheckBox = $("input[type='checkbox']:checked");
		arrCheckBox.each(function(index, checkBox){
			var answerUser = new Object();
			answerUser["idquestion"] = $(checkBox).attr("data-idq");
			answerUser["content"] = $(checkBox).attr("data-ida");
			answerusers.push(answerUser); 
		});

		var arrRadio = $("input[type='radio']:checked");
		arrRadio.each(function(index, radio){
			var answerUser = new Object();
			answerUser["idquestion"] = $(radio).attr("data-idq");
			answerUser["content"] = $(radio).attr("data-ida");
			answerusers.push(answerUser); 
		});

		datasurvey["answerusers"] = answerusers;
		var json = JSON.stringify(datasurvey);
		console.log(json);
		return json;
	}


	function checkMandatory(div){
		$(".mess-err").text("");
		var result = true;
		var divWraps = $(div);
		if(divWraps.hasClass("mandatory")){
			divWraps.each(function(index, divWrap){
				if(checkNoAnswer(divWrap)==false){
					result = false;
					$(divWrap).find(".mess-err").text("You must to answer this question.");
				}
			});
		}
		return result;
	}

	function checkNoAnswer(divWrap){
		var result = true;
		var kindquestion = $(divWrap).attr("data-kindinput");
		if(kindquestion =="textbox"){
			var input = $(divWrap).find(".in-ans");
			if ($(input).val()==null || $(input).val()=="") result = false;
		} else if(kindquestion =="textarea"){
			var input = $(divWrap).find(".in-ans");
			if ($(input).val()==null || $(input).val()=="") result = false;
		} else if(kindquestion =="radio"){
			if($(divWrap).find("input:checked").length == 0) result = false;
		} else if(kindquestion =="checkbox"){
			if($(divWrap).find("input:checked").length == 0) result = false;
		}
		return result;
	}
	// left: 37, up: 38, right: 39, down: 40,
	// spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36
	var keys = {37: 1, 38: 1, 39: 1,40: 1, 9: 1, 33: 1, 34: 1, 35: 1, 36: 1 };
	/*var keys = {37: 1, 39: 1, 9: 1, 33: 1, 34: 1, 35: 1, 36: 1 };*/

	function preventDefault(e) {
	  e = e || window.event;
	  if (e.preventDefault)
	      e.preventDefault();
	  e.returnValue = false;  
	}

	function preventDefaultForScrollKeys(e) {
	    if (keys[e.keyCode]) {
	        preventDefault(e);
	        return false;
	    }
	}

	function disableScroll() {
	  if (window.addEventListener) // older FF
	      window.addEventListener('DOMMouseScroll', preventDefault, false);
	  window.onwheel = preventDefault; // modern standard
	  window.onmousewheel = document.onmousewheel = preventDefault; // older browsers, IE
	  window.ontouchmove  = preventDefault; // mobile
	  document.onkeydown  = preventDefaultForScrollKeys;
	}

	function enableScroll() {
    if (window.removeEventListener)
        window.removeEventListener('DOMMouseScroll', preventDefault, false);
    window.onmousewheel = document.onmousewheel = null; 
    window.onwheel = null; 
    window.ontouchmove = null;  
    document.onkeydown = null;  
}



/****************************************Feed back***************************/


function getJsonFeedback(){
	var feedback = new Object();
	feedback["name"] = $("#name").val();
	feedback["content"] = $("#area-feedback").val();
	feedback["contact"] = $("#contact").val()
	console.log(JSON.stringify(feedback));
	return JSON.stringify(feedback);
}
// ]]>