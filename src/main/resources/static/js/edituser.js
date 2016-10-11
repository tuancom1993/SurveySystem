// <![CDATA[
$(document).ready(function() {
    $('#btn-file').change(function(evt) {
    	readURL(this);
    });
    $("input").focus(function(){
    	$(this).parent().find(".mess-err").text("");
    });
    
    /*$("#date-picker").datepicker({changeMonth: true, changeYear: true, yearRange: '1950:2020' , dateFormat: 'yy/mm/dd' });*/
    $.datetimepicker.setLocale('en');
    $('#date-picker').datetimepicker({
        timepicker:false,
        dayOfWeekStart : 1,
        /*format:'Y/m/d',*/
        format:'d-M-Y',
        minDate:'1870/01/02', // yesterday is minimum date
        maxDate:'2100/01/02' // and tommorow is maximum date calendar
    });
	$(".menu .active").removeClass("active");
	$(".menu .mn-user a").addClass("active");
	$(".menu .mn-manage").find('a').first().addClass("active");

	$(".btn-submit").click(function(){
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