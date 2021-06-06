package com.serviceProvider.Helper.Entities;

import javax.persistence.Column;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class UserLogIn {

	@Column(name = "u_email")
	@NotBlank(message = "* User email cannot be blank")
	@Email(message = "Your email is incorrect")
	private String username;

	@NotBlank(message = "* User password cannot be blank")
	private String password;



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UserLogIn() {
		super();
		// TODO Auto-generated constructor stub
	}



	public UserLogIn(@NotBlank(message = "* User email cannot be blank") @Email(message = "Your email is incorrect") String username, @NotBlank(message = "* User password cannot be blank") String Password) {
		super();
		this.username = username;
		password = Password;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	
	

}
