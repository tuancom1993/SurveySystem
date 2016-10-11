// <![CDATA[

$(document).ready(function(){
	$(".btn-showFeedback").click(function(){
		$("#partten").fadeIn(400);
		$(".feedbackblock-form").slideDown(500);
	});

	$("#partten").click(function(){
		$("#partten").fadeOut(500);
		$(".feedbackblock-form").slideUp(400);
	});

	$(".btn-giveFeedback").click(function(){
		if($("#name").val()== "" || $("#area-feedback").val() == "" || $("#contact").val()==""){
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
});

function getJsonFeedback(){
	var feedback = new Object();
	feedback["name"] = $("#name").val();
	feedback["content"] = $("#area-feedback").val();
	feedback["contact"] = $("#contact").val()
	console.log(JSON.stringify(feedback));
	return JSON.stringify(feedback);
}

// ]]>