
package com.serviceProvider.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.Worker;
import com.serviceProvider.Services.UserService;
import com.serviceProvider.Services.WorkerService;

@Service
public class UserDetailsServieceImpl implements UserDetailsService {

	@Autowired
	private UserService userService;

	@Autowired
	private WorkerService workerService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		CustomUserDetails customUserDetails = null;

		User userData = userService.getUserByEmail(username);
		
		if(userData != null)
		{
			System.out.println("user is else"+" "+userData);
			customUserDetails = new CustomUserDetails(userData);
		}
		else
		{
			Worker worker = workerService.getWorkerByEmail(username);
			if(worker != null)
			{
				System.out.println("worker is else"+" "+worker);
				customUserDetails=new CustomUserDetails(worker);
			}
			else
			{
				throw new UsernameNotFoundException("Could not found user !!");	
			}
		}
		
	

		return customUserDetails;
	}

}
