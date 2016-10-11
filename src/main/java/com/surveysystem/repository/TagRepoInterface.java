package com.surveysystem.repository;

import org.springframework.data.repository.CrudRepository;

import com.surveysystem.model.Tag;

public interface TagRepoInterface extends CrudRepository<Tag, Integer> {

}
