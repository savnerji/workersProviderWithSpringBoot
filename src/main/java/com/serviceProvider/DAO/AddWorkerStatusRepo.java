package com.serviceProvider.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.serviceProvider.Entities.AddWorkerStatus;
import com.serviceProvider.Entities.Worker;

public interface AddWorkerStatusRepo extends CrudRepository<AddWorkerStatus, Integer> {
	
//	@Query("FROM Worker_status A WHERE A.worker=:worker")
//	public boolean updateWorkerStatus(@Param("") AddWorkerStatus status, Worker wrkr)
	
	
	public AddWorkerStatus findByWorker(Worker worker);
	
	@Query("FROM Worker_status w INNER JOIN FETCH w.worker WHERE w.worker.work_Type=:service")
	public List<AddWorkerStatus> getAvailableWorker(@Param("service") String service);
	
	@Query("FROM Worker_status w  INNER JOIN FETCH w.worker WHERE w.status=:status AND w.worker.city=:city And w.worker.work_Type=:service")
	public List<AddWorkerStatus> getWorkersByCity(@Param("status") String status ,@Param("city") String city,@Param("service") String service);


}
