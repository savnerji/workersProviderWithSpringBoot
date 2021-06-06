package com.serviceProvider.Helper.Entities;

public class WorkDataDetails {

	
	

	private String customerName;

	private String customercontact;

	private String address;

	private String workDescription;

	/*
	 * private User user;
	 * 
	 * private Worker worker;
	 */

	public WorkDataDetails( String customerName, String customercontact, String address, String workDescription) {
		super();
		
		this.customerName = customerName;
		this.customercontact = customercontact;
		this.address = address;
		this.workDescription = workDescription;
		/*
		 * this.user = user; this.worker = worker;
		 */
	}

	public WorkDataDetails() {
		super();
		// TODO Auto-generated constructor stub
	}




	public String getcustomerName() {
		return customerName;
	}

	public void setcustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getcustomercontact() {
		return customercontact;
	}

	public void setcustomercontact(String customercontact) {
		this.customercontact = customercontact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getworkDescription() {
		return workDescription;
	}

	public void setworkDescription(String workDescription) {
		this.workDescription = workDescription;
	}

	/*
	 * public User getUser() { return user; }
	 * 
	 * public void setUser(User user) { this.user = user; }
	 * 
	 * public Worker getWorker() { return worker; }
	 * 
	 * public void setWorker(Worker worker) { this.worker = worker; }
	 */
	/*
	 * @Override public String toString() { return "WorkDataDetails [ customerName="
	 * + customerName + ", customercontact=" + customercontact + ", address=" +
	 * address + ", workDescription=" + workDescription + ", user=" + user +
	 * ", worker=" + worker + "]"; }
	 */
	

}
