package com.surveysystem.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.surveysystem.validator.Phone;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name="user")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int iduser;

	@Lob
	private String avata;

	@Temporal(TemporalType.DATE)
	/*@DateTimeFormat(pattern="yyyy/MM/dd")*/
	@DateTimeFormat(pattern="dd-MMM-yyyy")
	@Past(message="Birthday should be past")
	private Date birthday;

	private int block;

	@NotEmpty @NotNull @Email(message="Email address is not valid")
	private String email;
	
	@NotEmpty @Size(min=3, max=50, message="Full name should be between 3 and 50 characters")
	private String fullname;
	
	
	private String password;
	
	@NotEmpty
	@Phone(message="Invalid format, valid formats are 1234567890")
	private String phone;

	private int sex;

	@Size(min=4, max=30, message="Username should be between 4 and 30 characters")
	@NotBlank(message="Username has not blank")
	@Pattern(regexp="^[A-Za-z0-9]+$", message="Username have special characters")
	private String username;

	//bi-directional many-to-one association to Survey
	@OneToMany(mappedBy="user")
	private List<Survey> surveys;

	//bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name="idrole")
	private Role role;

	public User() {
	}

	public int getIduser() {
		return this.iduser;
	}

	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	public String getAvata() {
		return this.avata;
	}

	public void setAvata(String avata) {
		this.avata = avata;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getBlock() {
		return this.block;
	}

	public void setBlock(int block) {
		this.block = block;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getSex() {
		return this.sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Survey> getSurveys() {
		return this.surveys;
	}

	public void setSurveys(List<Survey> surveys) {
		this.surveys = surveys;
	}

	public Survey addSurvey(Survey survey) {
		getSurveys().add(survey);
		survey.setUser(this);

		return survey;
	}

	public Survey removeSurvey(Survey survey) {
		getSurveys().remove(survey);
		survey.setUser(null);

		return survey;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}