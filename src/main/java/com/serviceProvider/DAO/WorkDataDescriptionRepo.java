package com.serviceProvider.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.WorkDataDescription;
import com.serviceProvider.Entities.Worker;

public interface WorkDataDescriptionRepo extends CrudRepository<WorkDataDescription, Integer> {

	@Query("FROM WorkDataDescription A WHERE A.user=:user and A.workstatus=:status")
	public List<WorkDataDescription> getUserSentRequest(@Param("user") User u,@Param("status") int status);
	
//	public WorkDataDescription findByWorkData_Id(int id);
	
	
	@Query("FROM WorkDataDescription W WHERE W.worker=:worker and W.workstatus=:status")
	public List<WorkDataDescription> getWorkRequests(@Param("worker") Worker worker ,@Param("status") int status);
}
