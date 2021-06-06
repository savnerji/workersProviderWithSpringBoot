package com.serviceProvider.Services;

import java.util.List;

import com.serviceProvider.Entities.AddWorkerStatus;
import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.WorkDataDescription;
import com.serviceProvider.Entities.Worker;
import com.serviceProvider.Helper.Entities.UserLogIn;

public interface UserService {

	User saveUser(User user);
//	List<?> getUser(String name, String password);
	User getUser(UserLogIn user);
	
	List<AddWorkerStatus> getAvailableWorker(String service);
	Worker getWorker(int id);
	
	List<AddWorkerStatus> getAvailableWorkerByCity(String status,String city,String Service);
	User  getUserByEmail(String username);
//	boolean updateForgotPassword(String email,String password);
	
	User updateUser(User user);
	
	WorkDataDescription sendWorkServiceData(WorkDataDescription workDetails);
	
	List<WorkDataDescription>  getUserSentRequest(User user,int id);
	
	boolean completeRequest(WorkDataDescription data);

	WorkDataDescription getWorkDataDescription(int id);
	
	User isEmailAlreadyInDb(String email);
	
}
