package com.serviceProvider.Helper.Entities;

public class WorkerResponseToUser {

	private String date;

	private String time;

	private String charges;
	private String extraCharges;
	

	private String condition;


	public WorkerResponseToUser(String date, String time, String charges, String extraCharges, String condition) {
		super();
		this.date = date;
		this.time = time;
		this.charges = charges;
		this.extraCharges = extraCharges;
		this.condition = condition;
	}

	public WorkerResponseToUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public String getExtraCharges() {
		return extraCharges;
	}

	public void setExtraCharges(String extraCharges) {
		this.extraCharges = extraCharges;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCharges() {
		return charges;
	}

	public void setCharges(String charges) {
		this.charges = charges;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	@Override
	public String toString() {
		return "WorkerResponseToUser [date=" + date + ", time=" + time + ", charges=" + charges + ", extraCharges=" + extraCharges + ", condition=" + condition + "]";
	}



}
