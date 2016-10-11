package com.surveysystem.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.configuration.Common;
import com.surveysystem.model.Feedback;
import com.surveysystem.repository.FeedbackRepoInterface;

@Service
public class ManageFeedbackServiceImpl implements ManageFeedbackServiceInterface {
	
	@Autowired FeedbackRepoInterface feedbackRepoInterface;
	
	@Override
	public boolean createFeedBack(Feedback feedback) {
		try {
			feedback.setFeedbackdate(Common.getCurrentDate());
			feedbackRepoInterface.save(feedback);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public ArrayList<Feedback> getFeedbacks() {
		try {
			return (ArrayList<Feedback>) feedbackRepoInterface.findAll();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean deleteFeedback(int idFeedback) {
		try {
			feedbackRepoInterface.delete(idFeedback);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	
	
}
