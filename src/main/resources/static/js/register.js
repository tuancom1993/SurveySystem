// <![CDATA[
	$(document).ready(function() {
	    $('#btn-file').change(function(evt) {
	    	readURL(this);
	    });

	    /*$("#date-picker").datepicker({changeMonth: true, changeYear: true, yearRange: '1950:2020' ,dateFormat: 'yy/mm/dd' });*/
	    $.datetimepicker.setLocale('en');
	    $('#date-picker').datetimepicker({
			timepicker:false,
			dayOfWeekStart : 1,
			format:'d-M-Y',
			formatDate:'Y/m/d',
			minDate:'1870/01/02', // yesterday is minimum date
			maxDate:'2100/01/02' // and tommorow is maximum date calendar
		});

	    $("input").focus(function(){
	    	$(this).parent().find(".mess-err").text("");
	    });

	    $("#submit").click(function(){
	    	var pass = $("#pass").val();
	    	var repass = $("#re-pass").val();
	    	if(pass=="") {
	    		$("#pass").parent().find(".mess-err").text("Password mustn't empty");
	    		console.log("Password mustn't empty");
	    		return false;
	    	} else if (pass != repass){
	    		$("#re-pass").parent().find(".mess-err").text("Re-Password is not correct");
	    		console.log("Re-Password is not correct");
	    		return false;
	    	} 
	    	$("form").submit();
	    });
	});

	function readURL(input) {

	    if ( input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('.avata').attr('src', e.target.result);
	       }
	    reader.readAsDataURL(input.files[0]);
    }
}
	// ]]>