package com.surveysystem.service;
import java.util.List;

import com.surveysystem.model.*;

public interface ManageUserServiceInterface {
	List<User> getUsers();
	User getUser(int idUser);
	boolean editUser(User user);
	boolean deleteUser(String idUser);
	boolean changePassword(int idUser, String password);
}