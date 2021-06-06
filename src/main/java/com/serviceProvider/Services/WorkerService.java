package com.serviceProvider.Services;

import java.util.List;

import com.serviceProvider.Entities.AddWorkerStatus;
import com.serviceProvider.Entities.WorkDataDescription;
import com.serviceProvider.Entities.Worker;


public interface WorkerService {

	boolean saveProfilePic(String path,byte[] pic);
	boolean saveAadharPic(String path,byte[] pic);
	Worker saveWorker(Worker worker);
//	List<?> getWorker(WorkerLogIn user);
	
	Worker updateWorker(Worker worker);
//	boolean updateWorkerPic(String path,String oldPath,byte[] pic);
	
	AddWorkerStatus addWorkerStatus(AddWorkerStatus status);
	
	AddWorkerStatus updateWorkerStatus(AddWorkerStatus status,Worker wrkr);
	
	AddWorkerStatus getWorkerStatus(Worker wrkr);
	Worker getWorkerByEmail(String username);
	boolean updateWorkerPassword(String email, String password);
	void deletePics(String aadharPic,String profilePic);
	
	void deletePics(String path);

	List<WorkDataDescription> getWorkRequests(Worker worker,int Status);

	boolean deleteRequestByWorker(WorkDataDescription data);
	
	WorkDataDescription getWorkData(int id);
	
	WorkDataDescription updateChargesForWork(WorkDataDescription data);
	
	Worker isEmailAlreadyInDb(String email);
}
