package com.surveysystem.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator<Phone, String> {

	@Override
	public void initialize(Phone arg0) {
		
		
	}

	 @Override
	    public boolean isValid(String phoneNo, ConstraintValidatorContext ctx) {
	        if(phoneNo == null || "".equals(phoneNo)){
	            return false;
	        }
	        //validate phone numbers of format "1234567890"
	        if (phoneNo.matches("^[0-9]+$")) return true;
	        else return false;
	    }

}
