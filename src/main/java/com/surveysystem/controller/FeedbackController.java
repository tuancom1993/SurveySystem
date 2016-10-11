package com.surveysystem.controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surveysystem.form.ManageFeedbackForm;
import com.surveysystem.model.Feedback;
import com.surveysystem.model.User;
import com.surveysystem.service.ManageFeedbackServiceInterface;

@Controller
public class FeedbackController {
	
	@Autowired ManageFeedbackServiceInterface manageFeedbackServiceInterface;
	
	@RequestMapping (value="/feedback-block", method=RequestMethod.POST)
	public @ResponseBody String doFeedbackBlock(@RequestBody Feedback feedback){
		String result ="OK";
		try {
			System.out.println("Name: "+feedback.getName() +" | content: "+feedback.getContent());
			if (manageFeedbackServiceInterface.createFeedBack(feedback)) result = "OK";
			else result = "NO";
		} catch (Exception e) {
			result = "NO";
		}
		
		return result;
	}
	
	@RequestMapping(value="/manage-feedback")
	public String showFeedbacks(Model model, HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2) return "redirect:/";
			else{
				ManageFeedbackForm form = new ManageFeedbackForm();
				ArrayList<Feedback> feedbacks = manageFeedbackServiceInterface.getFeedbacks();
				Collections.reverse(feedbacks);
				form.setFeedbacks(feedbacks);
				model.addAttribute("form", form);
				return "manage-feedback";
			}
		}	
	}
	
	@RequestMapping(value="/manage-feedback/delete")
	public String doDeleteFeedbacks(@RequestParam("idfeedback") int idFeedback,Model model, HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2) return "redirect:/";
			else{
				manageFeedbackServiceInterface.deleteFeedback(idFeedback);
				return "redirect:/manage-feedback";
			}
		}	
	}
}
