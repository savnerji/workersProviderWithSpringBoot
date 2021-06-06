package com.serviceProvider.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.serviceProvider.DAO.AddWorkerStatusRepo;
import com.serviceProvider.DAO.WorkDataDescriptionRepo;
import com.serviceProvider.DAO.WorkerRepo;
import com.serviceProvider.Entities.AddWorkerStatus;
import com.serviceProvider.Entities.WorkDataDescription;
import com.serviceProvider.Entities.Worker;
import com.serviceProvider.helperMethods.HelperMethods;

@Service
public class WorkerServiceImpl implements WorkerService {
	@Autowired
	WorkerRepo workerRepo;

	@Autowired
	WorkDataDescriptionRepo workDataDescriptionRepo;

	@Autowired
	AddWorkerStatusRepo addWorkerStatusRepo;
	
	@Autowired
	HelperMethods helperMethod;

	// save worker profile pic to folder
	public boolean saveProfilePic(String path, byte[] pic) {
		boolean f = helperMethod.saveProfilePic(path, pic);
		return f;
	}

	// save worker aadhar pic to folder
	public boolean saveAadharPic(String path, byte[] pic) {

		boolean f = helperMethod.saveAadharPic(path, pic);
		return f;
	}

	// save worker
	public Worker saveWorker(Worker worker) {
		 Worker saved = workerRepo.save(worker);
		return saved;
	}

//	public List<?> getWorker(WorkerLogIn worker) {
//
//		List<?> list = workerDao.getWorker(worker);
//		return list;
//	}
	
	public Worker getWorkerByEmail(String userName) {

		Worker worker = workerRepo.findByEmail(userName);
		return worker;
	}

	// update worker
	public Worker updateWorker(Worker worker) {

		Worker saved = null;
		try {

			Optional<Worker> workerData = workerRepo.findById(worker.getW_Id());
			Worker worker2 = workerData.get();
		
				 saved = workerRepo.save(worker2);
				
					

		} catch (Exception e) {
			e.printStackTrace();
		}

		return saved;
	}

	// update worker pic
//	public boolean updateWorkerPic(String path, String oldPath, byte[] pic) {
//
//		boolean f = workerDao.updateWorkerPic(path, oldPath, pic);
//		return f;
//	}

	// add worker status
	public AddWorkerStatus addWorkerStatus(AddWorkerStatus status) {

	
			AddWorkerStatus save = addWorkerStatusRepo.save(status);

		

	

		return save;
	}

	// update Worker status
	public AddWorkerStatus updateWorkerStatus(AddWorkerStatus status, Worker wrkr) {
		
		AddWorkerStatus statusData = addWorkerStatusRepo.findByWorker(wrkr);
		
		statusData.setStatus(status.getStatus());
		statusData.setTime(status.getTime());
		
		AddWorkerStatus saved = addWorkerStatusRepo.save(statusData);
		
		return saved;
	}

	// get Worker status
	public AddWorkerStatus getWorkerStatus(Worker wrkr) {

		return addWorkerStatusRepo.findByWorker(wrkr);
	}

//	@Override
//	public Worker getWorker(String username) {
//		Worker worker = workerRepo.findByW_Id(username);
//		return worker;
//	}

	@Override
	public boolean updateWorkerPassword(String email, String password) {

		return false;
	}

	@Override
	public void deletePics(String aadharPic, String profilePic) {
		helperMethod.deletePics(aadharPic, profilePic);

	}

	@Override
	public void deletePics(String path) {
		helperMethod.delete(path);
	}

	@Override
	public List<WorkDataDescription> getWorkRequests(Worker worker, int Status) {
		List<WorkDataDescription> lst = workDataDescriptionRepo.getWorkRequests(worker, Status);
		return lst;
	}

	@Override
	public WorkDataDescription getWorkData(int id) {

		WorkDataDescription details = workDataDescriptionRepo.findById(id).get();

		return details;
	}

	@Override
	public boolean deleteRequestByWorker(WorkDataDescription data) {

		boolean f = false;
		
		try {
			workDataDescriptionRepo.deleteById(data.getWorkData_Id());
			
			f = true;
		} catch (Exception e) {
		 
		}
	
		
	
		return f;
	}

	@Override
	public WorkDataDescription updateChargesForWork(WorkDataDescription data) {

		Optional<WorkDataDescription> findById = workDataDescriptionRepo.findById(data.getWorkData_Id());
		
		WorkDataDescription workDataDescription = findById.get();
		
		workDataDescription.setCharges(data.getCharges());
		WorkDataDescription saved = workDataDescriptionRepo.save(workDataDescription);
		return saved;
	}

	@Override
	public Worker isEmailAlreadyInDb(String email) {

		return workerRepo.findByEmail(email);

	}

	

}
