package com.surveysystem.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.surveysystem.model.User;

public interface UserRepoInterface extends CrudRepository<User, Integer> {
	User findByUsernameAndPassword(String userName, String passWord);
	User findByIduser(int idUser);
	
	/*@Query(value="Select u.idUser from User u where u.userName = :_userName and u.passWord = :_passWord", nativeQuery=true)
	User getUser(@Param("_userName") String userName, @Param("_passWord") String passWord);*/
	
	@Query(value="Select COUNT(iduser) FROM user where username = :_username", nativeQuery=true)
	int getCountUserByUserName(@Param("_username") String username);
}
