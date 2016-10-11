package com.surveysystem.configuration;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class SMTPMailSender {
	
	@Autowired private JavaMailSender javaMailSender;
	
	public void sendMail(String to, String subject, String content){
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			
			helper.setSubject(subject);
			helper.setTo(to);
			helper.setText(content, true);
			
			javaMailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean sendMail(String[] to, String subject, String content){
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			
			helper.setSubject(subject);
			helper.setTo(to);
			helper.setText(content, false);
			javaMailSender.send(message);
			
			return true;
		} catch(MessagingException me){
			System.out.println("Can't send to email "+me.getMessage());
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	public String editContent(String content, String linkSurvey, String linkSurveyStep){
		content+= "\r\n \r\n Let Survey by click link below: ";
		content+= "\r\n Link Survey: http://www."+linkSurvey;
		content+= "\r\n \r\n Thank you.";
		return content;
	}

}
