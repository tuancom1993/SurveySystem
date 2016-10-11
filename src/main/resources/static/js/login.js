


$(document).ready(function(){
	$("form").submit(function(){
		if(checkLogin()) return true;
		else return false; 
	});


	$("input").focus(function () {
		$(this).next(".mess-err").text("");
	});	
});

function checkLogin(){
	var re = true;
	var user = $("#username").val();
	var pass = $("#password").val();
	if (!checkNull(user)) {
		$("#mess-err-username").text("Username mustn't empty.");
		re = false;
	}
	if (!checkNull(pass)) {
		$("#mess-err-pass").text("Password mustn't empty.");
		re =false;
	}
	if (!checkMaxLength(user, 30)){
		$("#mess-err-username").text("Username must less 30 characters.");
		re = false;
	}
	if (!checkMaxLength(pass, 30)){
		$("#mess-err-username").text("Password must less 30 characters.");
		re = false;
	}

	return re;
}