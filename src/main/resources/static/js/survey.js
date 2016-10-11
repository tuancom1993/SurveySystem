// <![CDATA[
		$(document).ready(function(){
			var submitTime = true;
			$(".btn-apply").click(function(){
				if(checkMandatory() == false) return false;
				if(submitTime){
					$.ajax({
					contentType: 'application/json; charset=utf-8',
					type: 'POST',
					url: '/survey',
					data: getValueJson(),
					success : function(data) {
	 					window.location.href = "/survey/success?i="+$("#idsurvey").val();
					},
				});
				}
				
			});

			/************************feedback***************************/
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

				 getJsonFeedback();

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


			/***************************DEMO EXE SURVEY*******************************/
			$(".section-survey").click(function(){
				$("article").addClass("exe-survey");
				$("#partten-survey").fadeIn(500);
				$(".clear-exe-survey").fadeIn(100);
			});

			$("#partten-survey").click(function(){
				$("article").removeClass("exe-survey");
				$("#partten-survey").fadeOut(500);
				$(".clear-exe-survey").fadeOut(100);
			});

			$(".clear-exe-survey").click(function(){
				$("article").removeClass("exe-survey");
				$("#partten-survey").fadeOut(500);
				$(".clear-exe-survey").fadeOut(100);
				
				return false;
			});

			$(document).keyup(function(e) {
			     if (e.keyCode == 27) { // escape key maps to keycode `27`
			        $("article").removeClass("exe-survey");
					$("#partten-survey").fadeOut(500);
					$(".clear-exe-survey").fadeOut(100);
			    }
			});

			/*************move to question***********/
			$(".wrap-question-answer").click(function(){
				var currentDiv = $(this);
				if($("article").hasClass("exe-survey")==false){
					$("html, body").animate({scrollTop: currentDiv.offset().top-230}, 700);
				}
			});
				
			

		}); /*end ready()*/

		function getValueJson(){
			var datasurvey = new Object();
			datasurvey["idsurvey"]= $("#idsurvey").val();

			var answerusers = new Array();

			var arrTextBox = $("article input[type=text]");
			arrTextBox.each(function(index, textBox){
				var answerUser = new Object();
				answerUser["idquestion"] = $(textBox).attr("data-idq");
				answerUser["content"] = $(textBox).val();
				answerusers.push(answerUser);

				console.log("idquestion textbox: "+answerUser["idquestion"]);
			});

			var arrArea = $("article textarea");
			arrArea.each(function(index, area){
				var answerUser = new Object();
				answerUser["idquestion"] = $(area).attr("data-idq");
				answerUser["content"] = $(area).val();
				answerusers.push(answerUser);

				console.log("idquestion texarea: "+answerUser["idquestion"]); 
			});

			var arrCheckBox = $("input[type='checkbox']:checked");
			arrCheckBox.each(function(index, checkBox){
				var answerUser = new Object();
				answerUser["idquestion"] = $(checkBox).attr("data-idq");
				answerUser["content"] = $(checkBox).attr("data-ida");
				answerusers.push(answerUser); 

				console.log("idquestion checkbox: "+answerUser["idquestion"]);
			});

			var arrRadio = $("input[type='radio']:checked");
			arrRadio.each(function(index, radio){
				var answerUser = new Object();
				answerUser["idquestion"] = $(radio).attr("data-idq");
				answerUser["content"] = $(radio).attr("data-ida");
				answerusers.push(answerUser); 

				console.log("idquestion radio: "+answerUser["idquestion"]);
			});

			datasurvey["answerusers"] = answerusers;
			var json = JSON.stringify(datasurvey);
			console.log(json);
			return json;
		}

		function checkMandatory(){
			$(".mess-err").text("");
			var result = true;
			var divWraps = $(".mandatory");
			divWraps.each(function(index, divWrap){
				if(checkNoAnswer(divWrap)==false){
					result = false;
					$(divWrap).find(".mess-err").text("You must answer this question.");
				}
			});
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

		/******************************Scroll**************************/
		$(window).scroll(function(){
			var val = ($(window).scrollTop()/40);
			if (val>6) return false;
			$(".cover").css({"-webkit-filter":"blur("+val+"px)", "filter" : "blur("+val+"px)"});
		});



		function getJsonFeedback(){
			var feedback = new Object();
			feedback["name"] = $("#name").val();
			feedback["content"] = $("#area-feedback").val();
			feedback["contact"] = $("#contact").val();
			console.log(JSON.stringify(feedback));
			return JSON.stringify(feedback);
		}
	// ]]>