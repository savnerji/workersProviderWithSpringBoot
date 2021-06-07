package com.serviceProvider.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.serviceProvider.DAO.AddWorkerStatusRepo;
import com.serviceProvider.DAO.UserReposiritery;
import com.serviceProvider.DAO.WorkDataDescriptionRepo;
import com.serviceProvider.DAO.WorkerRepo;
import com.serviceProvider.Entities.AddWorkerStatus;
import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.WorkDataDescription;
import com.serviceProvider.Entities.Worker;
import com.serviceProvider.Helper.Entities.UserLogIn;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserReposiritery userRepo;

	@Autowired
	WorkDataDescriptionRepo workDataRepo;
	
	@Autowired
	AddWorkerStatusRepo workerStatusRepo;

	@Autowired
	WorkerRepo workerRepo;
	public User saveUser(User user) {

		

		User saved = userRepo.save(user);
		
		return saved;
	}

//	public List<?> getUser(String name, String password) {
//		List<?> usr = userRepo.getUser(name, password);
//		return usr;
//	}

	public User getUser(UserLogIn user) {
		User usr = userRepo.getUserByEmail_Password(user.getUsername(), user.getPassword());
		return usr;

	}

	public List<AddWorkerStatus> getAvailableWorker(String service) {
		List<AddWorkerStatus> availableWorkers = workerStatusRepo.getAvailableWorker(service);
		return availableWorkers;
	}

	public Worker getWorker(int id) {

		Worker wrkr = workerRepo.findById(id).get();
		return wrkr;
	}

	public List<AddWorkerStatus> getAvailableWorkerByCity(String status,String city, String service) {
		List<AddWorkerStatus> availableWorkersByCity = workerStatusRepo.getWorkersByCity(status,city, service);
		return availableWorkersByCity;
	}

	public User getUserByEmail(String username) {
		User user = userRepo.findByEmail(username);
		return user;
	}

//	@Override
//	public boolean updateForgotPassword(String email, String password) {
//
//		boolean f = false;
//		f = userDao.updateForgotPassword(email, password);
//		return false;
//	}

	@Override
	public User updateUser(User user) {
		

		Optional<User> userData = userRepo.findById(user.getUid());
		User user2 = userData.get();
		User saved = userRepo.save(user2);
		
		return saved;
		
	}

	@Override
	public WorkDataDescription sendWorkServiceData(WorkDataDescription workDetails) {

		WorkDataDescription saved = workDataRepo.save(workDetails);

		return saved;
	}

	@Override
	public List<WorkDataDescription> getUserSentRequest(User user, int id) {

		List<WorkDataDescription> userSentRequest = workDataRepo.getUserSentRequest(user, id);
		return userSentRequest;
	}

	@Override
	public boolean completeRequest(WorkDataDescription data) {

		// boolean status = userDao.completeRequest(data);
		boolean f = false;
		try {
			Optional<WorkDataDescription> dataObject = workDataRepo.findById(data.getWorkData_Id());

			workDataRepo.save(dataObject.get());

			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public WorkDataDescription getWorkDataDescription(int id) {

		return workDataRepo.findById(id).get();
	}

	@Override
	public User isEmailAlreadyInDb(String email) {
	
		 
		return userRepo.findByEmail(email);
	}

}
