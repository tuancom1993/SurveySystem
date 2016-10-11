package com.surveysystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.surveysystem.form.LoginForm;
import com.surveysystem.model.User;
import com.surveysystem.service.LoginServiceInterface;
import com.surveysystem.service.ManageUserServiceInterface;

@Controller
public class LoginController {
	@Autowired LoginServiceInterface loginServiceInterface; 
	@Autowired ManageUserServiceInterface manageUserServiceInterface;
	
	@RequestMapping(value={"/login"})
	public String showLogin(LoginForm loginForm){
		return "login";
	}

	@RequestMapping(value="/loginAction", method=RequestMethod.POST)
	public String checkLogin(@ModelAttribute("loginForm") LoginForm loginForm, HttpSession session){
		User user = loginServiceInterface.getUse(loginForm.getUserName(), loginForm.getPassWord());
		if (user == null){
			return "redirect:/login";
		} else {
			if(user.getBlock() == 1){
				return "redirect:/message-block?iu="+user.getIduser();
			}
			session.setAttribute("userLogin", user);
			return "redirect:/homepage";
		}
		
	}
	
	@RequestMapping(value="/message-block", method=RequestMethod.GET)
	public String showBlockMessage(@RequestParam("iu") int idUser, Model model){
		User user = manageUserServiceInterface.getUser(idUser); 
		if(user != null && user.getBlock() ==1){
			return "message-block";
		}
		return "redirect:/homepage";
	}
	
}
