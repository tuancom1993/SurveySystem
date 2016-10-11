package com.surveysystem.repository;

import org.springframework.data.repository.CrudRepository;

import com.surveysystem.model.Feedback;

public interface FeedbackRepoInterface extends CrudRepository<Feedback, Integer> {

}
