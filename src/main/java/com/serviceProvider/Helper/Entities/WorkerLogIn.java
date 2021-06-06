package com.serviceProvider.Helper.Entities;

import javax.persistence.Column;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class WorkerLogIn {

	@NotBlank(message = "* email field can't be empty")
	@Column(name = "W_EMAIL")
	@Email(message = "Email is not in correct formate")
	private String username;
	
	@NotBlank(message = "*  PASSWORD field can't be empty")
	@Column(name = "W_PASSWORD")
	private String password;



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public WorkerLogIn() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "WorkerLogIn [username=" + username + ", password=" + password + "]";
	}


	
	
}
