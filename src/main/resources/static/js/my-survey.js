// <![CDATA[
		$(document).ready(function(){
		/***********Model share****************/
			$(".share").click(function(){
				$("#partten").fadeIn(300);
				$(".model-share").slideDown(400);

				$(".model-share").find(".link-survey").val($(this).attr("data-link-survey"));
			});

			$("#partten").click(function(){
				$(this).fadeOut(400);
				$(".model-share").slideUp(300);
				$(".message-result").text("");
			});

			$(".share-link, .link-survey, .link-survey-step").focus(function(){
				$(this).select();
			});


			/*******************Json Send Email ******************	*/
			$(".btn-send-mail").click(function(){
				$(".message-result").text("");
				$(".loader").fadeIn(100);
				$.ajax({
					contentType: 'application/json; charset=utf-8',
					type: 'POST',
					url: '/share-by-mail',
					data: getJsonMail(),
					success : function(data) {
						if (data == "OK") {
							console.log("Send mail successful");
							$(".message-result").text("Share survey successful");

						} else if (data = "false"){
							console.log("Send mail fail");
							$(".message-result").text("Share survey fail. Please check again.");

						}
						$(".loader").fadeOut(100);
					},
				});
			});

			function getJsonMail(){
				var Mail = new Object();
				
				var subject = $(".subject-mail").val();
				var content = $(".content-mail").val();
				

				var emails = $(".emails").val().replace(/\s/g, "");
				var to = emails.split(',');
				to.map(Function.prototype.call, String.prototype.trim);

				if(to[to.length-1] == "") to.pop();

				Mail["to"] = to;
				Mail["subject"] = subject;
				Mail["content"] = content;
				Mail["linkSurvey"] = $(".model-share .link-survey").val();
				Mail["linkSurveyStep"] = $(".model-share .link-survey-step").val();

				var json = JSON.stringify(Mail);
				console.log(json);
				return json;
			}

			/******************************SEARCH**************************/
			$("#search-box").on('keydown', function(e){
				if (e.which==13) {
					exeSearch();
					e.preventDefault();
				};
			});

			function exeSearch(){
				var varSearch = $("#search-box").val();
				varSearch = varSearch.replace(/%/g, '');
				window.location = "/my-survey/search?varSearch=" + varSearch; 
			}

		});
		
	// ]]>