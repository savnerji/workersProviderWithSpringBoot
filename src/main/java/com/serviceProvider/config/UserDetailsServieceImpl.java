
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
		
		
		/*
		 * List<?> userByEmail = userService.getUserByEmail(username);
		 * 
		 * List<? extends User> lst = (List<? extends User>) userByEmail;
		 * 
		 * if (lst.isEmpty()) {
		 * 
		 * List<?> worker = workerService.getWorker(username);
		 * 
		 * List<? extends Worker> wlst = (List<? extends Worker>) worker;
		 * 
		 * if(wlst.isEmpty()) {System.out.println("empty worker"); throw new
		 * UsernameNotFoundException("Could not found user !!"); } else { Worker
		 * w=wlst.get(0); System.out.println("worker is else"+" "+w);
		 * customUserDetails=new CustomUserDetails(w); }
		 * 
		 * 
		 * } else { User u=lst.get(0);
		 * System.out.println("user is else"+" "+lst.get(0)); customUserDetails = new
		 * CustomUserDetails(u); }
		 */

	

		/*
		 * List<?> userByEmail = userService.getUserByEmail(username); List<? extends
		 * User> lst = (List<? extends User>) userByEmail; if (lst.isEmpty()) { User usr
		 * = lst.get(0); System.out.println("in load user"); return new
		 * CustomUserDetails(usr.getEmail(), usr.getPassword(), usr.getRole()); } else {
		 * // Not found in user table, so check Worker List<?> worker =
		 * workerService.getWorker(username); List<? extends Worker> wrkrlst = (List<?
		 * extends Worker>) worker; if (wrkrlst != null) {
		 * System.out.println("in load worker elsr"); Worker wrkr = wrkrlst.get(0);
		 * System.out.println(wrkr); return new CustomUserDetails(wrkr.getEmail(),
		 * wrkr.getPassword(), wrkr.getRole()); }else {
		 * System.out.println("in load worker elsr"); } } throw new
		 * UsernameNotFoundException("User '" + username + "' not found");
		 */
		// List<?> userByEmail = userService.getUserByEmail(username);

		// List<? extends User> lst = (List<? extends User>) userByEmail;

		// List<?> worker = workerService.getWorker(username); List<? extends Worker>
		// wrkrlst = (List<? extends Worker>) worker;

		// if (lst.isEmpty() && wrkrlst.isEmpty()) { throw new
		// UsernameNotFoundException("Could not found user !!"); }

		// if (!lst.isEmpty()) { System.out.println(lst.get(0)); customUserDetails = new
		// CustomUserDetails(lst.get(0)); } else { if (!wrkrlst.isEmpty()) {
		// System.out.println(wrkrlst.get(0)); customUserDetails = new
		// CustomUserDetails(wrkrlst.get(0)); } }

		return customUserDetails;
	}

}
