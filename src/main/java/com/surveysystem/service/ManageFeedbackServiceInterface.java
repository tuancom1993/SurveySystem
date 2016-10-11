package com.surveysystem.service;

import java.util.ArrayList;

import com.surveysystem.model.Feedback;

public interface ManageFeedbackServiceInterface {
	boolean createFeedBack(Feedback feedback);
	ArrayList<Feedback> getFeedbacks();
	boolean deleteFeedback(int idFeedback);
}
