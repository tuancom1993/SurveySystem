package com.surveysystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surveysystem.configuration.SMTPMailSender;
import com.surveysystem.model.JsonMail;
import com.surveysystem.model.User;

@Controller
public class SendMailController {

	@Autowired SMTPMailSender mailSender;
	
	@RequestMapping(method = RequestMethod.POST, value = "/share-by-mail")
	public @ResponseBody String sendMail(@RequestBody JsonMail jsonMail, HttpSession session){
		String result = "";
		try {
			User userLogin = (User) session.getAttribute("userLogin");
			if (userLogin == null)
				result = "notalow";
			else {
				if (userLogin.getBlock() == 1){
					result = "notalow"; 
				}else {
					String content = mailSender.editContent(jsonMail.getContent(), jsonMail.getLinkSurvey(), jsonMail.getLinkSurveyStep());
					if(mailSender.sendMail(jsonMail.getTo(), jsonMail.getSubject(), content))
						result = "OK";
					else result = "false";
				}
			}
		} catch (Exception e) {
			result = "false";
		}
		return result;
	}
}
