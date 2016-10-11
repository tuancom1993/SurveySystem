package com.surveysystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.surveysystem.model.User;
import com.surveysystem.service.ManageStatisticalServiceInterface;

@Controller
public class StatisticalController {
	
	@Autowired ManageStatisticalServiceInterface manageStatisticalServiceInterface;
	
	@RequestMapping(value="/statistical")
	public String showStatistical(Model model, HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/homepage";
			else {
				model.addAttribute("form", manageStatisticalServiceInterface.getStatisticalForm());
				return "statistical";
			}
		}
	}
}
