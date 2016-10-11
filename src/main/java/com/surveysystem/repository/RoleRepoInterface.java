package com.surveysystem.repository;

import org.springframework.data.repository.CrudRepository;

import com.surveysystem.model.Role;

public interface RoleRepoInterface extends CrudRepository<Role, Integer> {
	
}
