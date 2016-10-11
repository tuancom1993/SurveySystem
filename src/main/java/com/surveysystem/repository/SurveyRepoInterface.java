package com.surveysystem.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.surveysystem.model.Survey;
import com.surveysystem.model.User;

public interface SurveyRepoInterface extends CrudRepository<Survey, Integer> {
	ArrayList<Survey> findByUser(User user);
	
	@Query(value="Select * From survey Where iduser = :_iduser LIMIT :_limit OFFSET :_offset ", nativeQuery = true)
	ArrayList<Survey> getLimitSurveysByUser(@Param("_limit") int limit, @Param("_offset") int _offset, @Param("_iduser") int idUser);
	
	@Query(value="Select * From survey LIMIT :_limit OFFSET :_offset", nativeQuery = true)
	ArrayList<Survey> getLimitSurveys(@Param("_limit") int limit, @Param("_offset") int _offset);
	
	@Query (value="Select COUNT(idsurvey) From survey", nativeQuery=true)
	public int getCountAllSurvey(); 
	
	@Query (value="Select COUNT(idsurvey) From survey Where iduser = :_iduser", nativeQuery=true)
	public int getCountAllSurveyByUser(@Param("_iduser") int idUser); 
	
	@Query (value = "Select s.* From survey s Inner Join user u On s.iduser = u.iduser where s.title like :_varSearch Or s.surveydescribe like :_varSearch Or u.fullname like :_varSearch", nativeQuery = true)
	public ArrayList<Survey> getSurveyBySearchByAdmin(@Param("_varSearch") String varSearch);
	
	@Query (value = "Select s.* From survey s Inner Join user u On s.iduser = u.iduser Where u.iduser =:_iduser And (s.title like :_varSearch Or s.surveydescribe like :_varSearch)", nativeQuery = true)
	public ArrayList<Survey> getSurveyBySearchByUser(@Param("_iduser") int idUser, @Param("_varSearch") String varSearch);
	
}
