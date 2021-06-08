package com.serviceProvider.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "workdatadescription")
public class WorkDataDescription {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int workData_Id;

	@Column(name = "custome_Name")
	@NotBlank(message = "Your Name can't be empty..")
	private String customer_Name;

	@Column(name = "custome_Contact")
	@NotBlank(message = "Your Contact can't be empty..")
	private String customer_contact;

	@Column(name = "customer_Address")
	@NotBlank(message = "Your Address can't be empty..")
	private String address;

	@Column(name = "work_Description")
	@NotBlank(message = "Your Work Description can't be empty..")
	private String work_Description;

	@Column(name = "work_charges")
	private String charges;

	@OneToOne
	private User user;

	@OneToOne
	private Worker worker;

	@Column(name = "status")
	private int workstatus;

	public WorkDataDescription() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WorkDataDescription(int workData_Id, @NotBlank(message = "Your Name can't be empty..") String customer_Name, @NotBlank(message = "Your Contact can't be empty..") String customer_contact, @NotBlank(message = "Your Address can't be empty..") String address,
			@NotBlank(message = "Your Work Description can't be empty..") String work_Description, String charges, User user, Worker worker, int workstatus) {
		super();
		this.workData_Id = workData_Id;
		this.customer_Name = customer_Name;
		this.customer_contact = customer_contact;
		this.address = address;
		this.work_Description = work_Description;
		this.charges = charges;
		this.user = user;
		this.worker = worker;
		this.workstatus = workstatus;
	}

	public String getCharges() {
		return charges;
	}

	public void setCharges(String charges) {
		this.charges = charges;
	}

	public int getWorkData_Id() {
		return workData_Id;
	}

	public void setWorkData_Id(int workData_Id) {
		this.workData_Id = workData_Id;
	}

	public String getCustomer_Name() {
		return customer_Name;
	}

	public void setCustomer_Name(String customer_Name) {
		this.customer_Name = customer_Name;
	}

	public String getCustomer_contact() {
		return customer_contact;
	}

	public void setCustomer_contact(String customer_contact) {
		this.customer_contact = customer_contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWork_Description() {
		return work_Description;
	}

	public void setWork_Description(String work_Description) {
		this.work_Description = work_Description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Worker getWorker() {
		return worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public int getWorkstatus() {
		return workstatus;
	}

	public void setWorkstatus(int workstatus) {
		this.workstatus = workstatus;
	}

	@Override
	public String toString() {
		return "WorkDataDescription [workData_Id=" + workData_Id + ", customer_Name=" + customer_Name + ", customer_contact=" + customer_contact + ", address=" + address + ", work_Description=" + work_Description + ", charges=" + charges + ", user=" + user + ", worker=" + worker + ", workstatus="
				+ workstatus + "]";
	}

}
