

function checkNull(value){
		if (value == null || value == "") return false;
		else return true;
}

function checkMaxLength(value, maxIndex){
	if (value.length > maxIndex) return false;
	else return true;
}

function checkMinLength(value, minIndex){
	if (value.length < minIndex) return false;
	else return true;
}

function checkSpecialCharacter(value){
	var regex = /[^\w\s]/gi;
	if(regex.test(value)) return false;
	else return true;
}