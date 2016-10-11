package com.surveysystem.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.model.User;
import com.surveysystem.repository.UserRepoInterface;

@Service
public class ManageProfileServiceImpl implements ManageProfileServiceInterface {
	
	@Autowired UserRepoInterface userRepoInterface;
	
	@Override
	public User getUser(int idUser) {
		User user = userRepoInterface.findOne(idUser);
		return user;
	}

	@Override
	public boolean changePassword(int idUser, String password) {
	
		if (password!=null || !"".equals(password)) {
			User user = userRepoInterface.findOne(idUser);
			user.setPassword(password);
			userRepoInterface.save(user);
			return true;
		}
			return false;
	}

	@Override
	public boolean editProfileAdmin(User newUser) {
		User oldUser = userRepoInterface.findByIduser(newUser.getIduser());
		System.out.println("Old username admin: "+oldUser.getUsername());
		newUser.setUsername(oldUser.getUsername());
		newUser.setPassword(oldUser.getPassword());
		newUser.setBlock(oldUser.getBlock());
		if("".equals(newUser.getAvata())) newUser.setAvata(oldUser.getAvata());
		else {
			File avata = new File("src/main/resources/static/img/avata/"+oldUser.getAvata());
			if(!"User.png".equals(oldUser.getAvata())) avata.delete();
		}
		if (userRepoInterface.save(newUser)!=null)
			return true;
		return false;
	}

	@Override
	public boolean editProfileUser(User newUser) {
		User oldUser = userRepoInterface.findByIduser(newUser.getIduser());
		newUser.setUsername(oldUser.getUsername());
		newUser.setPassword(oldUser.getPassword());
		newUser.setRole(oldUser.getRole());
		newUser.setBlock(oldUser.getBlock());
		if("".equals(newUser.getAvata())) newUser.setAvata(oldUser.getAvata());
		else {
			File avata = new File("src/main/resources/static/img/avata/"+oldUser.getAvata());
			if(!"User.png".equals(oldUser.getAvata())) avata.delete();
		}
		if (userRepoInterface.save(newUser)!=null)
			return true;
		return false;
	}

}
