// <![CDATA[
	$(document).ready(function(){
		$(".menu .active").removeClass("active");
		$(".menu .mn-create-sv a").addClass("active");
		/***********Drag and drop index****************/
	     $('.wrap-all-surveys').sortable({
	         disabled: false,
	         axis: 'y',
	         helper: "clone",
	         forceHelperSize: true,
	         handle: ".swap-index",
	         update: function (event, ui) {
	             var Newpos = ui.item.index();
	         }
	     });



		/***************Success model**************/
		$("#partten").click(function(){
			$(this).fadeOut(400);
			$("#logSuccess").fadeOut(300);

			window.location.href = "/manage-survey/pre";
		});

		$('.btn-submit-survey').click(function(){
			if(!checkValidate()) return false;
			$.ajax({
				contentType: 'application/json; charset=utf-8',
				type: 'POST',
				url: '/manage-survey/create',
				data: getJsonValue(),
				success : function(data) {
 					var surveyAdded = JSON.parse(data);

 					$("#logSuccess .survey-title-logS").text(""+surveyAdded["title"]);
 					$("#logSuccess a").text("http://localhost:8080/survey?idsurvey="+surveyAdded["id"]);
 					$("#logSuccess a").attr("href", "http://localhost:8080/survey?idsurvey="+surveyAdded["id"]);

 					$("#partten").fadeIn(400);
					$("#logSuccess").fadeIn(300);
				},
			});
		});

		function checkValidate(){
			var valReturn = true;
			$('.mess-err').text("");
			var inputs = $("input[type='text']");
			inputs.each(function(index, input){
				var parent = $(input).parent();
				if (!parent.hasClass("text-box")){
					var value = $(input).val();
					if (checkNull(value)){
						$(input).nextAll(".mess-err").first().text("This field cannot empty");
						valReturn = false;
					} else if (checkMaxLength(value, 255)) {
						$(input).nextAll(".mess-err").first().text("Your data must be less 255 character.");
						valReturn = false;
					}
				}
			});
			return valReturn;
		}


		function getJsonValue(){
			var survey = new Object();
			survey["title"] = $(".title-survey").val();
			survey["idsurvey"] = null;
			survey["cover"] = $("#cover").val();
			survey["createdate"] = "";
			survey["describe"] = $(".describe-survey").val();
			survey["maincolor"] = $("#maincolor").val();
			survey["stop"] = "0";
			survey["idTemplate"] = $("#idTemplate").val();
			survey["kindsurvey"] = $(".kindsurvey").val();
			
			var questions = new Array();

			var arrSurvey = $('.wrap-survey');
			arrSurvey.each(function(index, value){
				var question = new Object();
				question["idquestion"] = null;
				question["contentquestion"] = $(value).find(".question").val();
				question["idkindquestion"] = getKindOfQuestion(value);
				question["idsurvey"] = null;
				question["indexquestion"] = index+1;
				var mandatory = null;
					if($(value).find('.notnull .mandatory').hasClass('manda-active')) mandatory = "1";
					else mandatory = "0";
				question["mandatory"] = mandatory;

				var answers = new Array();

				var arrAnswear = $(value).find(".answear");
				arrAnswear.each(function(i, answear){
					var answer = new Object();
					answer["idanswer"] = null;
					answer["content"] = $(answear).val();
					answer["idquestion"] = null;
					answers.push(answer);
				});
				question["answers"] = answers;
				questions.push(question);
			});

			survey["questions"] = questions;

			var json = JSON.stringify(survey);
			console.log("JSON: "+json);
			return json;
		}

		function getKindOfQuestion(value){
			var kind = null;
			if ($(value).find(".wrap-answear").hasClass("text-box")) return "1";
			else if ($(value).find(".wrap-answear").hasClass("radio")) return "4";
			else if ($(value).find(".wrap-answear").hasClass("check-box")) return "3";
			else if ($(value).find(".wrap-answear").hasClass("area")) return "2";
		}

		/*add question*/
		function addQuestion(div){
			if($(".wrap-survey").hasClass("active-survey"))
				$(".active-survey").after(div);
			else
				$(".section-survey .wrap-all-surveys").append(div);
			div.show(500);
			/*effectAdd(div);*/
		}

		function effectAdd(div){
			$("article .active-survey").removeClass("active-survey");
			div.find('.wrap-survey').addClass('active-survey');
			div.find(".question").focus();
		}

		$(".add-t").click(function(){
			var div = $("<div class='wrap-survey'> <div class='control-panel'><ul>  <li class='delete-question'> <li class='notnull'> <div class='mandatory'></div> </li> </li> </ul> <div class='clear'></div> </div><!--/control-panel--> <input type='text' class='question' placeholder='Enter the question....'> <div class='mess-err'></div> <div  class='wrap-answear text-box'> <div class='wrap-answear-input text-box'> <input class='answear' type='text' placeholder='Don&#39;t need enter here...' disabled> <span class='mess-err'></span> </div> <!--wrap-answear-input--> </div> <!--/wrap-answear--> <div class='swap-index'></div> </div> <!--/wrap-survey-->");
			addQuestion(div);
		});

		$(".add-r").click(function(){
			var div = $("<div class='wrap-survey'> <div class='control-panel'><ul> <li class='add-answear add-answear-radio'> </li> <li class='delete-question'> </li> <li class='notnull'> <div class='mandatory'></div> </li> </ul> <div class='clear'></div> </div><!--/control-panel--> <input type='text' class='question' placeholder='Enter the question....'><div class='mess-err'></div> <div  class='wrap-answear radio'> <div class='wrap-answear-input radio'> <input class='answear' type='text' placeholder='Enter....'> <span class='mess-err first'></span> </div> <!--wrap-answear-input--> </div> <!--/wrap-answear--> <div class='swap-index'></div> </div> <!--/wrap-survey-->");
			addQuestion(div);

		});

		$(".add-c").click(function(){
			var div = $("<div class='wrap-survey'> <div class='control-panel'><ul> <li class='add-answear add-answear-checkbox'> </li> <li class='delete-question'> </li> <li class='notnull'> <div class='mandatory'></div> </li> </ul> <div class='clear'></div> </div><!--/control-panel--> <input type='text' class='question' placeholder='Enter the question....'> <div class='mess-err'></div><div  class='wrap-answear check-box'> <div class='wrap-answear-input check-box'> <input class='answear' type='text' placeholder='Enter....'> <span class='mess-err first'></span> </div> <!--wrap-answear-input--> </div> <!--/wrap-answear--><div class='swap-index'></div> </div> <!--/wrap-survey-->");
			addQuestion(div);
		});

		$(".add-ta").click(function(){
			var div = $("<div class='wrap-survey'> <div class='control-panel'><ul> <li class='delete-question'> </li> <li class='notnull'> <div class='mandatory'></div> </li> </ul> <div class='clear'></div> </div><!--/control-panel--> <input type='text' class='question' placeholder='Enter the question....'><div class='mess-err'></div> <div  class='wrap-answear area'> <div class='wrap-answear-input area'> <textarea class='answear' placeholder='Don&#39;t need enter here...' disabled></textarea> <br/> </div> <!--wrap-answear-input--> </div> <!--/wrap-answear--> <div class='swap-index'></div> </div> <!--/wrap-survey-->");
			addQuestion(div);
		});
	});

	
	/*$(document).on('submit', '')*/

	/*add more than answer function*/
	$(document).on('click', '.add-answear-textbox', function(){
		$(this).parent().parent().parent().find(".wrap-answear").append("<div class='wrap-answear-input text-box'> <input class='answear' type='text' placeholder='Enter	....'> <span class='delete-input'> </span> <br/><span class='mess-err'></span></div> <!--wrap-answear-input-->");
	});

	$(document).on('click', '.add-answear-radio', function(){
		$(this).parent().parent().parent().find(".wrap-answear").append("<div class='wrap-answear-input radio'> <input class='answear' type='text' placeholder='Enter	....'> <span class='delete-input'> </span> <span class='mess-err'></span> </div> <!--wrap-answear-input-->");
	});

	$(document).on('click', '.add-answear-checkbox', function(){
		$(this).parent().parent().parent().find(".wrap-answear").append("<div class='wrap-answear-input check-box'> <input class='answear' type='text' placeholder='Enter	....'> <span class='delete-input'></span><span class='mess-err'></span>  </div> <!--wrap-answear-input-->");
	});

	/*delete function*/
	$('article').on('click', '.delete-question', function(){
		$(this).parent().parent().parent().remove();
	});

	$('article').on('click', '.delete-input', function(){
		$(this).parent().remove();
	});


	/*Click to show "active" function*/
	$(document).on('click', '.wrap-survey', function(e){
		if ($(this).hasClass('active-survey') == false){
			$("article .active-survey").removeClass("active-survey");
			$(this).addClass("active-survey");
			$(this).find(".question").focus();
		} else{
			return false;
		}
		e.stopPropagation();
	});

	/*Tap to active*/
	$(document).on('focus', '.question', function(){
		if ($(this).parent().hasClass("active-survey") == false){
			$("article .active-survey").removeClass("active-survey");
			$(this).parent().addClass("active-survey");
		}
	});

	$(document).on('focus', "input[type='text']", function(){
		$(this).nextAll(".mess-err").first().text("");
	});

	/****************************************Mandatory****************************/
	$(document).on('click', '.mandatory', function(){
			if($(this).hasClass('manda-active')) $(this).removeClass('manda-active');
			else $(this).addClass('manda-active');
	});


	/*******Validate*****************/
	function checkNull(value){
		if (value == null || value == "") return true;
		else return false;
	}

	function checkMaxLength(value, maxIndex){
		if (value.length > maxIndex) return true;
		else return false;
	}

	function checkMinLength(value, minIndex){
		if (value.length < minIndex) return true;
		else return false;
	}

	function checkSpecialCharacter(value){
		var regex = /[^\w\s]/gi;
		if(regex.test(value)) return true;
		else return false;
	}

	$(document).scroll(function(){
		var y = $(this).scrollTop();
		if(y>100){
			$(".survey-panel").css("top", "35%");
		} else {
			$(".survey-panel").css("top", "60%");
		}
	});

	/********************disble - enable sort div******************/

	$(document).on("mousedown", ".swap-index", function(){
	    $("article .active-survey").removeClass("active-survey");
		$(this).parent().addClass("active-survey");
	});
	/*$(document).on("mousedown", '.wrap-all-surveys .wrap-survey .swap-index', function(e){
		$(".wrap-all-surveys").sortable('enable');
		e.stopPropagation();
	});

	$(document).on("mouseup", 'article', function(e){
		$(".wrap-all-surveys").sortable('disable');

	});*/
	
// ]]>