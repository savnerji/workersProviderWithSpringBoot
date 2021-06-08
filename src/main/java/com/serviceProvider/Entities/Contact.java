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
@Table(name = "contact", schema = "services") 
public class Contact {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	
	@Column(name = "name")
	@Size(min = 3,max = 30,message = "* length Must greater then 3")
	private String name;
	
	@Column(name = "email",unique = true)
	private String email;
	
	@Column(name = "subject")
	private String subject;
	
	@Column(name = "message")
		private String message;

	public Contact(int id, @NotBlank(message = "* User Name cannot be blank") @Size(min = 3, max = 30, message = "* length Must greater then 3") String name, @NotBlank(message = "* User email cannot be blank") @Email(message = "Your email is incorrect") String email,
			@NotBlank(message = "* User contact  cannot be blank") String subject, @NotBlank(message = "* User password cannot be blank") String message) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Contact [id=" + id + ", name=" + name + ", email=" + email + ", subject=" + subject + ", message=" + message + "]";
	}
	
	


}
