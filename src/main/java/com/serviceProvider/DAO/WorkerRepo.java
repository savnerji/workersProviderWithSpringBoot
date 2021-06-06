package com.serviceProvider.DAO;

import org.springframework.data.repository.CrudRepository;

import com.serviceProvider.Entities.Worker;

public interface WorkerRepo extends CrudRepository<Worker, Integer> {

	public Worker findByEmail(String email);
	
//	public Worker findByW_Id(String email);
	
//	@Query("FROM Worker_status A WHERE A.worker=:worker")
//	public AddWorkerStatus getWorkerStatus(@Param("worker") Worker worker);
	
}
