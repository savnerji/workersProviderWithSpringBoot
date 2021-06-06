package com.serviceProvider.Helper.Entities;

import com.serviceProvider.Entities.Worker;

public class updatingWorkerStatusHelper {

	
	private String updatedStatus;
	
	
	private String updatedTime;
	
	
	private Worker worker;


	public updatingWorkerStatusHelper() {
		super();
		// TODO Auto-generated constructor stub
	}


	public updatingWorkerStatusHelper(String updatedStatus, String updatedTime, Worker worker) {
		super();
		this.updatedStatus = updatedStatus;
		this.updatedTime = updatedTime;
		this.worker = worker;
	}


	public String getUpdatedStatus() {
		return updatedStatus;
	}


	public void setUpdatedStatus(String updatedStatus) {
		this.updatedStatus = updatedStatus;
	}


	public String getUpdatedTime() {
		return updatedTime;
	}


	public void setUpdatedTime(String updatedTime) {
		this.updatedTime = updatedTime;
	}


	public Worker getWorker() {
		return worker;
	}


	public void setWorker(Worker worker) {
		this.worker = worker;
	}


	@Override
	public String toString() {
		return "updatingWorkerStatusHelper [updatedStatus=" + updatedStatus + ", updatedTime=" + updatedTime
				+ ", worker=" + worker + "]";
	}



	
	
	
}
