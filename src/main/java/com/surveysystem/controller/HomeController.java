package com.surveysystem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.surveysystem.form.LoginForm;
import com.surveysystem.model.User;

@Controller
public class HomeController {
	@RequestMapping(value={"/","/homepage"})
	public String showHome(HttpSession session){
		/*System.out.println("This is controller home");
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null) return "redirect:/";
		
		System.out.println("Home controller "+userLogin.getUsername());*/
		return "home";
	}
	
	@RequestMapping("/manage")
	public String showManage(HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole()==2) return "redirect:/homepage";
			else return "manage";
		}
	}
}
