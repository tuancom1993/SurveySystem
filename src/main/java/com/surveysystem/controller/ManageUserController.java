package com.surveysystem.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.dialect.RDMSOS2200Dialect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.surveysystem.form.ChangePasswordForm;
import com.surveysystem.form.EditUserForm;
import com.surveysystem.form.ManageUserForm;
import com.surveysystem.form.RegisterForm;
import com.surveysystem.form.ViewUserForm;
import com.surveysystem.model.User;
import com.surveysystem.service.ManageUserServiceInterface;

@Controller
public class ManageUserController {

	@Autowired
	ManageUserServiceInterface manageUserServiceInterface;

	@RequestMapping("/manage-user")
	public String showManageUser(Model model, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null || (userLogin.getRole().getIdrole() == 2)) {
			return "redirect:/";
		} else {
			List<User> users = manageUserServiceInterface.getUsers();
			if (users != null) {
				ManageUserForm form = new ManageUserForm();
				form.setUsers(users);
				System.out.println("List user: " + form.getUsers().get(1).getUsername());
				model.addAttribute("form", form);
				return "manage-user";
			} else
				return "redirect:/homepage";
		}
	}

	@RequestMapping(value = "/manage-user/view")
	public String showUser(Model model, HttpSession session, @RequestParam("iduser") String iduser) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin != null && (userLogin.getRole().getIdrole() == 1)) {
			User user = manageUserServiceInterface.getUser(Integer.parseInt(iduser));
			if (user != null) {
				ChangePasswordForm passForm = new ChangePasswordForm();
				passForm.setIdUser(Integer.parseInt(iduser));
				model.addAttribute("user", user);
				model.addAttribute("passForm", passForm);
				return "view-user";
			} else
				return "redirect:/manage-user";
		}
		return "redirect:/homepage";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/manage-user/edit")
	public String showEdit(Model model, HttpSession session, @RequestParam("iduser") String iduser) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/homepage";
			else {
				User user = manageUserServiceInterface.getUser(Integer.parseInt(iduser));
				if (user != null) {
					model.addAttribute("user", user);
					return "edit-user";
				} else
					return "redirect:/manage-user";
			}
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/manage-user/edit")
	public String editUser(@Valid User user, BindingResult bindingResult ,@RequestParam("avataFile") MultipartFile file,
			@RequestParam("iduser") String iduser,HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/homepage";
			else {
				if(bindingResult.hasErrors()){
					System.out.println("Co loi Valid .... HasErrors= "+bindingResult.getFieldError().toString());
					User oldu = manageUserServiceInterface.getUser(Integer.parseInt(iduser));
					user.setAvata(oldu.getAvata());
					return "edit-user";
				}
				if (user != null) {
					user.setIduser(Integer.parseInt(iduser));
					executeUploadFile(user, file);
					manageUserServiceInterface.editUser(user);
					return "redirect:/manage-user/view?iduser="+iduser;
				} else return "redirect:/manage-user";
			}
		}
		
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/manage-user/changepassword")
	public String changePass(@ModelAttribute("passForm") ChangePasswordForm form, @RequestParam("iduser") String idUser ,HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			String pass1 = form.getPassword();
			String pass2 = form.getRePassword();
			if (pass1.equals(pass2)){
				if(manageUserServiceInterface.changePassword(Integer.parseInt(idUser), form.getPassword()))
					return "redirect:/manage-user/view?iduser="+idUser;
			}
		}
		return "redirect:/manage-user/view?iduser="+idUser;
	}
	
	@RequestMapping("/manage-user/delete")
	public String deleteUser(@RequestParam("iduser") String idUser, HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole()==2) return "redirect:/homepage";
			else {
				if(manageUserServiceInterface.deleteUser(idUser)) return "redirect:/manage-user";
				else return "redirect:/manage-user";
			}
		}
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
			user.setAvata("");
		return user;
	}

	private String getExtension(String arr[]) {
		String extension = "";
		if (arr != null) {
			extension = arr[arr.length - 1];
		}
		return extension;
	}
}
