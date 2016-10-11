package com.surveysystem.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.surveysystem.configuration.Common;
import com.surveysystem.form.ChangePasswordForm;
import com.surveysystem.form.EditProfileForm;
import com.surveysystem.form.EditUserForm;
import com.surveysystem.model.User;
import com.surveysystem.service.ManageProfileServiceInterface;

@Controller
public class ManageProfileController extends Common{
	
	@Autowired ManageProfileServiceInterface manageProfileServiceInterface;
	
	@RequestMapping("/profile/view")
	public String viewProfile(Model model, HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			User user = manageProfileServiceInterface.getUser(userLogin.getIduser());
			if (user!=null){
				model.addAttribute("user", user);
				model.addAttribute("passForm", new ChangePasswordForm());
				return "view-profile";
			}
		}
		return "redirect:/homepage";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/profile/edit")
	public String showEdit(Model model, HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			User user = manageProfileServiceInterface.getUser(userLogin.getIduser());
			if (user!=null){
				model.addAttribute("user", user);	
				return "edit-profile";
			}
		}
		return "redirect:/profile/view";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/profile/edit")
	public String editProfile(@Valid User user, BindingResult bindingResult, @RequestParam("avataFile") MultipartFile file,
		HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if(bindingResult.hasErrors()){
				System.out.println("Edit profile hasError..."+bindingResult.getFieldError().toString());
				user.setAvata(userLogin.getAvata());
				user.setUsername(userLogin.getUsername());
				return "edit-profile";
			}
			user.setIduser(userLogin.getIduser());
			executeUploadFile(user, file);
			if (userLogin.getRole().getIdrole()==1){
				manageProfileServiceInterface.editProfileAdmin(user);
			} else {
				manageProfileServiceInterface.editProfileUser(user);
			}
			return "redirect:/profile/view";
		}
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/profile/changepassword")
	public String changePass(@ModelAttribute("passForm") ChangePasswordForm form, HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			String pass1 = form.getPassword();
			String pass2 = form.getRePassword();
			if (pass1.equals(pass2)){
				if(manageProfileServiceInterface.changePassword(userLogin.getIduser(), form.getPassword()))
				System.out.println("Change successful");
				 else System.out.println("Change fail");
			}
		}
		return "redirect:/profile/view";
	}
}
