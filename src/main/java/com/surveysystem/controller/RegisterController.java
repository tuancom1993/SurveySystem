	package com.surveysystem.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;
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

import com.surveysystem.form.LoginForm;
import com.surveysystem.form.RegisterForm;
import com.surveysystem.model.Role;
import com.surveysystem.model.User;
import com.surveysystem.service.RegisterServiceInterface;

@Controller
public class RegisterController {

	@Autowired
	RegisterServiceInterface registerServiceInterface;

	@RequestMapping(method = RequestMethod.GET, value = "/register")
	public String showRegisterUser(Model model) {
		Role role = new Role();
		role.setIdrole(2);
		User user = new User();
		user.setRole(role);
		model.addAttribute("user", user);
		return "register";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/register")
	public String doRegister(@Valid User user, BindingResult bindingResult,
			@RequestParam("avataFile") MultipartFile file, HttpSession session) {

		User userLogin = (User) session.getAttribute("userLogin");
		
		
		if(bindingResult.hasErrors() || checkUsername(user.getUsername(), bindingResult)){
			System.out.println("Register hasError..."+bindingResult.getFieldError().toString());
			return "register";
		}
		
		
		if (userLogin == null || (userLogin != null && userLogin.getRole().getIdrole() == 2)) {
			Role role = new Role();
			role.setIdrole(2);
			user.setRole(role);
		}
		executeUploadFile(user, file);
		if (registerServiceInterface.registerUser(user))
			return "message_fragment";
		else
			return "/register";
	}

	private User executeUploadFile(User user, MultipartFile file) {

		BufferedOutputStream stream = null;
		File dest = new File("src/main/resources/static/img/avata");
		if (!dest.exists())
			dest.mkdirs();
		if (!file.isEmpty()) {
			String extension = getExtension(file.getOriginalFilename().split("\\."));
			String timeNow = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(Calendar.getInstance().getTime());
			String fileNameNew = user.getUsername() + "_" + timeNow + "." + extension;
			File avata = new File("src/main/resources/static/img/avata/" + fileNameNew);

			try {
				stream = new BufferedOutputStream(new FileOutputStream(avata));
				FileCopyUtils.copy(file.getInputStream(), stream);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					stream.close();
					user.setAvata(fileNameNew);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else
			user.setAvata("User.png");
		return user;
	}

	private String getExtension(String arr[]) {
		String extension = null;
		if (arr != null) {
			extension = arr[arr.length - 1];
		}
		return extension;
	}
	
	private boolean checkUsername(String username, BindingResult bindingResult){
		boolean result = false;
		if (registerServiceInterface.existUserName(username)) {
			bindingResult.rejectValue("username", "username.notvalid" ,"Username '" + username + "' already exits");
			result = true;
		} else if(username.contains(" ")){
			bindingResult.rejectValue("username", "username.notvalid" ,"Username '" + username + "' have blank space");
			result = true;
		}
		return result;
	}
}
