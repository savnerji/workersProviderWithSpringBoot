package com.serviceProvider.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "worker",schema = "services")
public class Worker {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "W_ID")
	private int w_Id;

	@NotBlank(message = "* Name field can't be empty")
	@Column(name = "W_NAME")
	private String w_Name;

	@NotBlank(message = "* City field can't be empty")
	@Column(name = "W_CITY")
	private String city;

	@NotBlank(message = "* Address field can't be empty")
	@Column(name = "W_ADDRESS")
	private String address;

	@NotBlank(message = "* contact field can't be empty")
	@Column(name = "W_CONTACT")
	private String contact;

	@NotBlank(message = "* Work field can't be empty")
	@Column(name = "W_WORK_TYPE")
	private String work_Type;

	@NotBlank(message = "* email field can't be empty")
	@Column(name = "W_EMAIL")
	@Email(message = "Email is not in correct formate")
	private String email;

	@NotBlank(message = "* Aadhar Card field can't be empty")
	@Column(name = "W_AADHARCARD")
	private String aadharCardNomber;

	@NotBlank(message = "* password field can't be empty")
	@Column(name = "W_PASSWORD")
	private String password;

	@NotNull(message = "* 	work price can't be empty")
	@Column(name = "W_PRICE")
	private Long work_Price;

	@Column(name = "W_PIC")
	private String profilePic;

	@Column(name = "W_AADHARCARD_PIC")
	private String aadharCardPic;

	@Column(name = "role")
	private String role;
	
	


	public Worker(int w_Id, @NotBlank(message = "* Name field can't be empty") String w_Name, @NotBlank(message = "* City field can't be empty") String city, @NotBlank(message = "* Address field can't be empty") String address, @NotBlank(message = "* contact field can't be empty") String contact,
			@NotBlank(message = "* Work field can't be empty") String work_Type, @NotBlank(message = "* email field can't be empty") @Email(message = "Email is not in correct formate") String email, @NotBlank(message = "* Aadhar Card field can't be empty") String aadharCardNomber,
			@NotBlank(message = "*  PASSWORD field can't be empty") String password, @NotNull(message = "work price can't be empty") Long work_Price, String profilePic, String aadharCardPic, String role) {
		super();
		this.w_Id = w_Id;
		this.w_Name = w_Name;
		this.city = city;
		this.address = address;
		this.contact = contact;
		this.work_Type = work_Type;
		this.email = email;
		this.aadharCardNomber = aadharCardNomber;
		this.password = password;
		this.work_Price = work_Price;
		this.profilePic = profilePic;
		this.aadharCardPic = aadharCardPic;
		this.role = role;
	}

	
	public Worker() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public int getW_Id() {
		return w_Id;
	}

	public void setW_Id(int w_Id) {
		this.w_Id = w_Id;
	}

	public String getW_Name() {
		return w_Name;
	}

	public void setW_Name(String w_Name) {
		this.w_Name = w_Name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profile_pic) {
		this.profilePic = profile_pic;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getWork_Type() {
		return work_Type;
	}

	public void setWork_Type(String work_Type) {
		this.work_Type = work_Type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAadharCardNomber() {
		return aadharCardNomber;
	}

	public void setAadharCardNomber(String aadharCardNomber) {
		this.aadharCardNomber = aadharCardNomber;
	}

	public String getAadharCardPic() {
		return aadharCardPic;
	}

	public void setAadharCardPic(String aadharCardPic) {
		this.aadharCardPic = aadharCardPic;
	}

	public Long getWork_Price() {
		return work_Price;
	}

	public void setWork_Price(Long work_Price) {
		this.work_Price = work_Price;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "Worker [w_Id=" + w_Id + ", w_Name=" + w_Name + ", city=" + city + ", address=" + address + ", contact=" + contact + ", work_Type=" + work_Type + ", email=" + email + ", aadharCardNomber=" + aadharCardNomber + ", password=" + password + ", work_Price=" + work_Price + ", profilePic="
				+ profilePic + ", aadharCardPic=" + aadharCardPic + ", role=" + role + "]";
	}



}
