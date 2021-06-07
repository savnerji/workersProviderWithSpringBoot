package com.serviceProvider.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name = "worker_status")
@Table(schema = "workerstatus_schema")
public class AddWorkerStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "status_id")
	private int status_id;
	
	@Column(name = "w_status")
	private String status;
	
	@Column(name = "w_time")
	private String time;
	
	@OneToOne()
	private Worker worker;



	public AddWorkerStatus() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AddWorkerStatus(int status_id, String status, String time, Worker worker) {
		super();
		this.status_id = status_id;
		this.status = status;
		this.time = time;
		this.worker = worker;
	}

	public int getStatus_id() {
		return status_id;
	}

	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Worker getWorker() {
		return worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	@Override
	public String toString() {
		return "UpdateWorkerStatus [status_id=" + status_id + ", status=" + status + ", time=" + time + ", worker="
				+ worker + "]";
	}
	
	
	
}
