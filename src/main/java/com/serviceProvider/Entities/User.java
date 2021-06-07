package com.serviceProvider.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "user" , schema = "userSchema")
public class User {

	@Id
	@Column(name = "u_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int uid;

	@Column(name = "u_name")
	@NotBlank(message = "* User Name cannot be blank")
	@Size(min = 3, max = 30, message = "* length Must greater then 3")
	private String Name;

	@Column(name = "u_email", unique = true)
	@NotBlank(message = "* User email cannot be blank")
	@Email(message = "Your email is incorrect")
	private String email;

	@Column(name = "u_contact")
	@NotBlank(message = "* User contact  cannot be blank")
	private String Contact;

	@Column(name = "u_password")
	@NotBlank(message = "* User password cannot be blank")
	private String Password;

	@Column(name = "u_city")
	@NotBlank(message = "* User city cannot be blank")
	private String city;

	@Column(name = "Role")
	private String role;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public User(int uid, @NotBlank(message = "* User Name cannot be blank") @Size(min = 3, max = 30, message = "* length Must greater then 3") String name, @NotBlank(message = "* User email cannot be blank") @javax.validation.constraints.Email(message = "Your email is incorrect") String email,
			@NotBlank(message = "* User contact  cannot be blank") String contact, @NotBlank(message = "* User password cannot be blank") String password, @NotBlank(message = "* User city cannot be blank") String city, String role) {
		super();
		this.uid = uid;
		Name = name;
		this.email = email;
		Contact = contact;
		Password = password;
		this.city = city;
		this.role = role;
	}



	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return Contact;
	}

	public void setContact(String contact) {
		Contact = contact;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	
	
	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public User(String email, String password) {
		super();
		this.email = email;
		Password = password;
	}



	@Override
	public String toString() {
		return "User [uid=" + uid + ", Name=" + Name + ", Email=" + email + ", Contact=" + Contact + ", Password=" + Password + ", city=" + city + ", role=" + role + "]";
	}


}
