package com.serviceProvider.Controllar;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.WorkDataDescription;
import com.serviceProvider.Entities.Worker;
import com.serviceProvider.Services.NotificationService;
import com.serviceProvider.Services.UserService;

@Controller
public class ServicesControllar {

	@Autowired
	private UserService userService;

	@Autowired
	private NotificationService notificationService;



	// rendering services

	@RequestMapping("/service/{serviceName}")
	public String services(@PathVariable("serviceName") String service, HttpSession session, Model m) {

		User user = (User) session.getAttribute("User");

		m.addAttribute("serviceName", service);
		m.addAttribute("usr", user);
		m.addAttribute("title", "Service_page");
		return "Service";
	}

	@RequestMapping("/User/ActiveService/{service}")
	public String activeServise(@PathVariable("service") String service, HttpSession session, RedirectAttributes redirectAttributes, Model m) {
		User user = (User) session.getAttribute("User");
		session.setAttribute("Service", service);

		if (user == null) {
			return "redirect:/signInPage";

		} else {
			// userService.getAvailableWorker(service);
			// redirectAttributes.addFlashAttribute("service", service);

			return "redirect:/User/WorkersList";
		}
	}

	// render available workers list
	@RequestMapping("/User/WorkersList")
	public String WorkerList(HttpSession session, Model m) {

		String service = (String) session.getAttribute("Service");

		System.out.println("service in con" + service);
		List<Worker> availableWorkers = (List<Worker>) (List) userService.getAvailableWorker(service);

		System.out.println(availableWorkers);

		m.addAttribute("title", "Available_Workers");
		m.addAttribute("workerList", availableWorkers);
		m.addAttribute("condition", 1);

		return "WorkersList";

	}

	// render Worker list according to searched city

	@GetMapping(value = "/User/workerListByCity")
	public String showWorkerListByCity(@RequestParam("city") String city, HttpSession session, Model m) {
		String service = (String) session.getAttribute("Service");
		List<Worker> availableWorkerByCity = (List<Worker>) (List)userService.getAvailableWorkerByCity("Available" ,city, service);
		m.addAttribute("title", "Available_Workers_by_city");
		m.addAttribute("workerList", availableWorkerByCity);
		m.addAttribute("condition", 2);

		return "WorkersList";
	}

	// show worker data
	@RequestMapping("/User/workerData/{workerId}")
	public String showWorkerData(@PathVariable("workerId") int w_id, HttpSession session, Model m) {
		Worker worker = userService.getWorker(w_id);
		session.setAttribute("Worker", worker);

		 User user = (User) session.getAttribute("User");
		m.addAttribute("workerData", worker);
		m.addAttribute("title", "Worker_Data");
		m.addAttribute("usr",user);
		return "WorkerData";
	}

	// render work details form

	@RequestMapping("/User/serviceDataForm/{workerId}")
	public String renderServicePage(@PathVariable("workerId") int w_id, HttpSession session, Model m) {

		User user = (User) session.getAttribute("User");
		Worker Worker = (Worker) session.getAttribute("Worker");

		// System.out.println("here uis the user id in session= "+user.getUid());

		/* m.addAttribute("WorkData", new WorkDataDescription()); */
		m.addAttribute("WorkData", new WorkDataDescription());
		m.addAttribute("title", "work_Details");
		m.addAttribute("workerId", w_id);
		m.addAttribute("user", user);
		m.addAttribute("worker", Worker);

		return "serviceDataForm";
	}

	/*
	 * @RequestMapping(value="/User/workDescription",method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String sendRequestToworker(@RequestBody()
	 * WorkDataDescription WorkData) {
	 * 
	 * System.out.println(WorkData.getUser().getUid());
	 * 
	 * 
	 * return "done"; }
	 */

	@RequestMapping(value = "/User/send",method = RequestMethod.POST)
	@ResponseBody
	public String send(@RequestBody() WorkDataDescription data, HttpSession session) {

		User user = (User) session.getAttribute("User");
		Worker Worker = (Worker) session.getAttribute("Worker");

		data.setWorker(Worker);
		data.setUser(user);
		data.setWorkstatus(1);

		String Subject = "1 new work From the WorkersProviders..";

		String message = "Hey " + Worker.getW_Name() + ".." + "You got a work-request from WorkersProvider..So please cheack your Dashboard.";

		String contact_number=Worker.getContact();
		String email=Worker.getEmail();
		
		if (notificationService.sendNotificationViaEmail(Subject, message, "savnerji05@gmail.com") && notificationService.sendSms(message,"9752540754")) {

			data.setAddress(data.getAddress().toUpperCase());
			data.setCustomer_Name(data.getCustomer_Name().toUpperCase());
			data.setWork_Description(data.getWork_Description().toUpperCase());
			WorkDataDescription sendWorkServiceData = userService.sendWorkServiceData(data);
			if(sendWorkServiceData != null)
			{
				return "done";	
			}
			else
			{
				return "error";
			}
			
			
		} else {
			
			return "error";
		}

	}



}
