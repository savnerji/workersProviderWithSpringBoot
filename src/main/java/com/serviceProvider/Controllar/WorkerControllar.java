package com.serviceProvider.Controllar;

import java.io.File;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StringMultipartFileEditor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.serviceProvider.Entities.AddWorkerStatus;
import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.WorkDataDescription;
import com.serviceProvider.Entities.Worker;
import com.serviceProvider.Helper.Entities.UserLogIn;
import com.serviceProvider.Helper.Entities.WorkerLogIn;
import com.serviceProvider.Helper.Entities.WorkerResponseToUser;
import com.serviceProvider.Helper.Entities.updatingWorkerStatusHelper;
import com.serviceProvider.Services.EmailService;
import com.serviceProvider.Services.NotificationService;
import com.serviceProvider.Services.UserService;
import com.serviceProvider.Services.WorkerService;
import com.serviceProvider.helperMethods.HelperMethods;

@Controller
public class WorkerControllar {

	@Autowired
	private WorkerService WorkerService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private EmailService emailService;

	@Autowired
	private UserService userService;

	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private HelperMethods helperMethods;

	// worker log out controllar
	@RequestMapping("/WorkerLogOut")
	public String workerlogOut(HttpSession session, RedirectAttributes redirectAttributes) {
		session.removeAttribute("Worker");
		redirectAttributes.addFlashAttribute("msg", "You are successfully Log Out..!");
		redirectAttributes.addFlashAttribute("style", "#047a43");
		return "redirect:/WorkerSignInPage";
	}

	// signUp for Worker

	@RequestMapping("/WorkerSignUP")
	public String workerSignUp(Model m) {
		m.addAttribute("Worker", new Worker());
		m.addAttribute("title", "Worker_signUp_page");
		return "WorkerSignUP";
	}

	// upload worker data to

	@RequestMapping("/workerSignUP")
	public String workerSignUP(@RequestParam("pic") MultipartFile profilePic, @RequestParam("aadhar") MultipartFile AadharPic, @ModelAttribute("Worker") @Valid Worker worker, BindingResult res, RedirectAttributes redirectAttributes, HttpSession session, Model m) {

		if (res.hasErrors()) {

			System.out.println("form has error");

			List<ObjectError> allErrors = res.getAllErrors();

			for (ObjectError temp : allErrors) {
				System.out.println(temp);
			}
			return "WorkerSignUP";
		} else {

			Worker emailAlreadyInDb = WorkerService.isEmailAlreadyInDb(worker.getEmail());
			
			User emailAlreadyInDb2 = userService.isEmailAlreadyInDb(worker.getEmail());
			if (emailAlreadyInDb !=null || emailAlreadyInDb2 != null) {
				m.addAttribute("msg", "email is already taken");
				return "WorkerSignUP";
			}

			String profilePicName = profilePic.getOriginalFilename();
			String aadharCardPic = AadharPic.getOriginalFilename();
			if (!(profilePicName.isEmpty() && aadharCardPic.isEmpty())) {
				worker.setProfilePic(profilePicName);
				worker.setAadharCardPic(aadharCardPic);

				String profileFolderpath = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "component" + File.separator + "image" + File.separator + "profilePics" + File.separator + profilePicName;

				String AadharFolderpath = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "component" + File.separator + "image" + File.separator + "AadharCardPics" + File.separator + aadharCardPic;

				System.out.println(profileFolderpath);
				System.out.println(AadharFolderpath);

				try {

					byte[] aadharPic = AadharPic.getBytes();

					byte[] prflPic = profilePic.getBytes();

					boolean p1 = helperMethods.saveAadharPic(AadharFolderpath, aadharPic);
					boolean p2 = helperMethods.saveProfilePic(profileFolderpath, prflPic);

					worker.setPassword(passwordEncoder.encode(worker.getPassword()));
					worker.setCity(worker.getCity().toUpperCase());
					worker.setW_Name(worker.getW_Name().toUpperCase());
					worker.setAddress(worker.getAddress().toUpperCase());
					worker.setWork_Type(worker.getWork_Type().toUpperCase());

					session.setAttribute("workerDataFromForm", worker);
					session.setAttribute("aadharStatus", p1);
					session.setAttribute("profileStatus", p2);

					if (emailService.sendOTPWorker(session)) {

						// m.addAttribute("sentOTP", "We have sent OTP to your email");
						return "redirect:/worker_verification";
					} else {
						// m.addAttribute("otpSendingError", "OTP not sent..Something went wrong.");
						return "redirect:/worker_verification";
					}

					/*
					 * boolean w1 = WorkerService.saveWorker(worker);
					 * 
					 * if (p1 == true && p2 == true && w1 == true) {
					 * redirectAttributes.addFlashAttribute("msg",
					 * "You are successfully registered.now you Log IN");
					 * redirectAttributes.addFlashAttribute("style", "#067328");
					 * m.addAttribute("title", "Worker_Log_In_page ");
					 * m.addAttribute("workerSignIn", new WorkerLogIn()); return
					 * "redirect:/Worker/workerHomePage"; } else { return "redirect:/sorry"; }
					 */

				} catch (Exception e) {
					e.printStackTrace();
				}

			} else {
				m.addAttribute("msg", "Pics fields are empty..");
				m.addAttribute("Worker", new Worker());
				return "WorkerSignUP";
			}

			/*
			 * String profileFolderpath = session.getServletContext().getRealPath("/") +
			 * "WEB-INF" + File.separator + "component" + File.separator + "image" +
			 * File.separator + "profilePics" + File.separator + profilePicName;
			 * 
			 * String AadharFolderpath = session.getServletContext().getRealPath("/") +
			 * "WEB-INF" + File.separator + "component" + File.separator + "image" +
			 * File.separator + "AadharCardPics" + File.separator + aadharCardPic;
			 * 
			 * System.out.println(profileFolderpath); System.out.println(AadharFolderpath);
			 */
			/*
			 * try {
			 * 
			 * byte[] aadharPic = AadharPic.getBytes();
			 * 
			 * byte[] prflPic = profilePic.getBytes();
			 * 
			 * boolean p1 = WorkerService.saveAadharPic(AadharFolderpath, aadharPic);
			 * boolean p2 = WorkerService.saveProfilePic(profileFolderpath, prflPic);
			 * 
			 * worker.setPassword(passwordEncoder.encode(worker.getPassword()));
			 * 
			 * session.setAttribute("workerDataFromForm", worker);
			 * session.setAttribute("aadharStatus", p1);
			 * session.setAttribute("profileStatus", p2);
			 * 
			 * if (emailService.sendOTPWorker(session)) {
			 * 
			 * // m.addAttribute("sentOTP", "We have sent OTP to your email"); return
			 * "redirect:/worker_verification"; } else { //
			 * m.addAttribute("otpSendingError", "OTP not sent..Something went wrong.");
			 * return "redirect:/worker_verification"; }
			 * 
			 * 
			 * boolean w1 = WorkerService.saveWorker(worker);
			 * 
			 * if (p1 == true && p2 == true && w1 == true) {
			 * redirectAttributes.addFlashAttribute("msg",
			 * "You are successfully registered.now you Log IN");
			 * redirectAttributes.addFlashAttribute("style", "#067328");
			 * m.addAttribute("title", "Worker_Log_In_page ");
			 * m.addAttribute("workerSignIn", new WorkerLogIn()); return
			 * "redirect:/Worker/workerHomePage"; } else { return "redirect:/sorry"; }
			 * 
			 * 
			 * } catch (Exception e) { e.printStackTrace(); }
			 */
		}

		return "redirect:/workerSignUP";
	}

	// render after email verification

	/*
	 * @RequestMapping("/workerLogIn") public String renderWorker(HttpSession
	 * session, Model m) {
	 * 
	 * 
	 * }
	 */

	// rendering sorry page

	@RequestMapping("/sorry")
	public String Sorry(HttpServletRequest res, Model m) {

		res.setAttribute("errorMessage", "Invalid credential");
		m.addAttribute("title", "signIn Page");

		m.addAttribute("User", new UserLogIn());
		return "SignIn";
	}

	// rendering sorry page

	@RequestMapping("/sorryWorker")
	public String SorryWorker(HttpServletRequest res, Model m) {

		res.setAttribute("errorMessage", "Invalid credential");
		m.addAttribute("title", "signIn Page");

		m.addAttribute("workerSignIn", new WorkerLogIn());
		return "WorkerSignIn";
	}

	// do sign In for worker
//	@PostMapping(value = "/wSignIn")
//	public String WorkerSignIn(@ModelAttribute("workerSignIn") @Valid WorkerLogIn worker, BindingResult res, HttpSession session, RedirectAttributes redirectAttributes, Model m) {
//
//		if (res.hasErrors()) {
//
//			System.out.println("form has error");
//
//			List<ObjectError> allErrors = res.getAllErrors();
//
//			for (ObjectError temp : allErrors) {
//				System.out.println(temp);
//			}
//			return "WorkerSignIn";
//		} else {
//			List<?> wrk = WorkerService.getWorker(worker);
//			System.out.println("wrkr is==" + wrk);
//			if (wrk.size() != 0) {
//				session.setAttribute("Worker", wrk.get(0));
//
//				return "redirect:/workerHomePage";
//			} else {
//				redirectAttributes.addFlashAttribute("msg", "You are not actual Worker");
//				redirectAttributes.addFlashAttribute("style", "#c91a20");
//				m.addAttribute("title", "User_home_page");
//				m.addAttribute("msg", "You are not a valid User..!");
//
//				return "redirect:/WorkerSignInPage";
//			}
//
//		}
//
//	}

	// rendering signIn form page for worker
	@RequestMapping("/WorkerSignInPage")
	public String workerLogIn(@ModelAttribute("msg") String msg, @ModelAttribute("style") String style, Model m) {
		m.addAttribute("title", "Worker_Login_page");
		m.addAttribute("msg", msg);
		m.addAttribute("style", style);

		m.addAttribute("workerSignIn", new WorkerLogIn());
		return "WorkerSignIn";
	}

	// rendering worker home page

	@RequestMapping("/Worker/workerHomePage")
	public String WorkerHomePage(HttpSession session, Model m, Principal principal) {
		m.addAttribute("title", "Worker_Home_page");

		Worker worker2 = WorkerService.getWorkerByEmail(principal.getName());

		
		if (worker2 != null) {
			session.setAttribute("Worker", worker2);
		}

		Worker worker = (Worker) session.getAttribute("Worker");
		AddWorkerStatus workerStatus = WorkerService.getWorkerStatus(worker);
		// System.out.println(workerStatus);

		List<WorkDataDescription>  requests = WorkerService.getWorkRequests(worker, 1);

		

		//List<? extends WorkDataDescription> requestlist = (List<? extends WorkDataDescription>) requests;

		// System.out.println("that are the remaining req===" + requests);
		// System.out.println("this is the size of the req==" + requests.size());

		m.addAttribute("requestsCounts", requests.size());
		m.addAttribute("requests", requests);
		m.addAttribute("worker", worker);
		m.addAttribute("workerStatus", new AddWorkerStatus());
		m.addAttribute("workerStatusData", workerStatus);
		m.addAttribute("updateWorkerStatus", new updatingWorkerStatusHelper());

		return "WorkerHomePage";
	}

	// render worker update profile page
	@RequestMapping("/Worker/WorkerEditProfile")
	public String workerUpdateProfile(HttpSession session, Model m) {
		Worker Worker = (Worker) session.getAttribute("Worker");

		m.addAttribute("Worker", Worker);
		m.addAttribute("worker", Worker);
		return "WorkerEditProfile";
	}

	// worker update profile controllar

	/*
	 * @PostMapping("/Worker/updateWorkerData/{aadharName}/{profileName}/{id}" )
	 * 
	 * @ResponseBody public String updateProfile( @RequestParam("profilePic")
	 * CommonsMultipartFile profilePic,
	 * 
	 * @PathVariable("profileName") String profileName, @PathVariable("aadharName")
	 * String aadharName, @PathVariable("id") int id, @ModelAttribute("Worker")
	 * Worker worker, HttpSession session, RedirectAttributes redirectAttributes,
	 * Model m) {
	 * 
	 * worker.setAadharCardPic(aadharName); worker.setProfilePic(profileName);
	 * 
	 * System.out.println(aadharName); System.out.println(id);
	 * System.out.println(profileName); System.out.println(worker.getW_Id());
	 * 
	 * try {
	 * 
	 * boolean p2 = WorkerService.updateWorker(worker);
	 * 
	 * if (p2 == true) {
	 * 
	 * //return "redirect:/Worker/workerHomePage"; return "done"; } else { //return
	 * "redirect:/sorry"; return "error"; }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return "error";
	 * 
	 * }
	 */

	@PostMapping("/Worker/updateWorkerData")
	@ResponseBody
	public String updateProfile( /* @RequestParam("profilePic") CommonsMultipartFile profilePic, */
			@RequestBody() Worker worker, HttpSession session, Model m) {

		System.out.println(worker.getW_Id());
		System.out.println(worker);

		try {

			
			Worker updateWorker = WorkerService.updateWorker(worker);
		

			if (updateWorker != null) {

				// return "redirect:/Worker/workerHomePage";
				return "done";
			} else {
				// return "redirect:/sorry";
				return "error";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "error";

	}

	// controllar for updating pic in server and db

	@RequestMapping("/Worker/updatePic")
	@ResponseBody
	public String updateProfilePic(@RequestParam("profilePic") MultipartFile profilePic, HttpSession session) {
		Worker worker = (Worker) session.getAttribute("Worker");
		String oldFile = worker.getProfilePic();

		String newFile = profilePic.getOriginalFilename();

		try {
			byte[] bytes = profilePic.getBytes();
			

			String oldPath = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "component" + File.separator + "image" + File.separator + "profilePics" + File.separator + oldFile;

			String newPath = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "component" + File.separator + "image" + File.separator + "profilePics" + File.separator + newFile;

			worker.setProfilePic(newFile);

			boolean p1 = helperMethods.updateWorkerPic(newPath, oldPath, bytes);
			 Worker updateWorker = WorkerService.updateWorker(worker);

			if (p1 == true && updateWorker != null) {
				return "done";
			} else {
				return "error";
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "error";

	}

//controllar for saving worker status

	@RequestMapping(value = "/Worker/addStatus"/* ,produces="application/json" */)
	@ResponseBody
	public String addStatus(@RequestBody() AddWorkerStatus status, HttpSession session) {
		Worker wrkr = (Worker) session.getAttribute("Worker");
		status.setWorker(wrkr);

		 AddWorkerStatus addWorkerStatus = WorkerService.addWorkerStatus(status);

		if (addWorkerStatus != null) {
			return "done";
		} else {
			return "error";
		}
	}

	// controllar for updating worker status

	@RequestMapping(value = "/Worker/updateStatus", method = RequestMethod.POST)
	@ResponseBody
	public String updateStatus(@RequestBody() AddWorkerStatus status, HttpSession session) {
		Worker wrkr = (Worker) session.getAttribute("Worker");
		status.setWorker(wrkr);
		// status.setStatus_id(id);

		System.out.println(status.getStatus_id());
		 AddWorkerStatus updateWorkerStatus = WorkerService.updateWorkerStatus(status, wrkr);

		if (updateWorkerStatus != null) {
			return "done";
		} else {
			return "error";
		}
	}

	// controllar for all pending requests

	@RequestMapping(value = "/Worker/all_requests")
	public String allWorkRequests(HttpSession session, Model m) {

		Worker worker = (Worker) session.getAttribute("Worker");
		AddWorkerStatus workerStatus = WorkerService.getWorkerStatus(worker);
		// System.out.println(workerStatus);

		List<WorkDataDescription> requests = WorkerService.getWorkRequests(worker, 1);

		// List<?> workdemoRequests = WorkerService.getWorkdemoRequests(worker);

		// System.out.println("worker data=="+worker);

		// System.out.println("Demop data=="+workdemoRequests);

		//List<? extends WorkDataDescription> AllRequestlist = (List<? extends WorkDataDescription>) requests;

		m.addAttribute("worker", worker);
		m.addAttribute("allRequests", requests);
		m.addAttribute("title", "All Pending Requests");

		return "AllRequests";

	}

	// controllar for Work details from the customer

	@RequestMapping(value = "/Worker/WorkDetails/{workDescriptionId}")
	public String workRequestsData(@PathVariable("workDescriptionId") int workDescriptionID, HttpSession session, Model m) {

		WorkDataDescription details = WorkerService.getWorkData(workDescriptionID);

		Worker worker = (Worker) session.getAttribute("Worker");

		AddWorkerStatus workerAvailability = WorkerService.getWorkerStatus(worker);

		session.setAttribute("workDescriptionData", details);
		m.addAttribute("title", "Work Details");
		m.addAttribute("workDetails", details);
		m.addAttribute("workerResponse", new WorkerResponseToUser());
		m.addAttribute("worker", worker);
		m.addAttribute("workerAvailabilty", workerAvailability);

		return "WorkDetails";

	}

	// this controler for accepting the customer request and send them to a response
	// message via email and sms
	@RequestMapping(value = "/Worker/workerResponse", method = RequestMethod.POST)
	@ResponseBody
	public String sendWorkerResponse(@RequestBody() WorkerResponseToUser response, HttpSession session) {

		System.out.println(response);

		try {
			
			WorkDataDescription details = (WorkDataDescription) session.getAttribute("workDescriptionData");
			/*
			 * DateFormat formate =new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy",
			 * Locale.ENGLISH);
			 * 
			 * Date date = formate.parse(response.getDate());
			 * 
			 * SimpleDateFormat print = new SimpleDateFormat("MMM d, yyyy HH:mm:ss");
			 * 
			 * String format = print.format(date);
			 */

			details.setCharges(response.getCharges());
			
			Worker worker = (Worker) session.getAttribute("Worker");

			String customer_email = details.getUser().getEmail();
			String contact = details.getUser().getContact();

			String message = "Hey " + details.getUser().getName() + " your request is accepted by the worker (" + worker.getW_Name() + "), He will arrive your address on " + response.getDate() + " between " + response.getTime()
					+ " if there is any extra work other than that work, worker will charges " + response.getExtraCharges() + " Rupeess extra, and feel free to contact him with " + worker.getContact() + " number";

			String subject = "Your request Accepte";
			System.out.println(message);

			if (notificationService.sendNotificationViaEmail(subject, message, "savnerji05@gmail.com") && notificationService.sendSms(message, "9752540754")) {
				
				WorkDataDescription updateChargesForWork = WorkerService.updateChargesForWork(details);
				
				if(updateChargesForWork != null)
				{
					return "done";	
				}
				else
				{
					return "something Went wrong, try again.";
				}
				
				
			} else {
				return "Response not sent to the customer,Try again..";
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "error";

	}

	// this is for rejected the customer request and send a response to them via
	// email, sms
	@RequestMapping(value = "/Worker/delete_request", method = RequestMethod.GET)
	@ResponseBody
	public String deleteRequestByWorker(@RequestParam("id") int id, HttpSession session) {

		try {
			WorkDataDescription details = (WorkDataDescription) session.getAttribute("workDescriptionData");

			WorkDataDescription data = WorkerService.getWorkData(id);

			Worker worker = (Worker) session.getAttribute("Worker");

			String customer_email = details.getUser().getEmail();
			String contact = details.getUser().getContact();

			String message = "Hey " + details.getUser().getName() + " your request is rejected by the worker (" + worker.getW_Name() + ") ,because worker is not available for this work,We are sorry for this inconvenience , ";

			String subject = "Your request Rejected by the worker";
			System.out.println(message);

			// deleting the request by the worker
			if (WorkerService.deleteRequestByWorker(data)) {

				if (notificationService.sendNotificationViaEmail(subject, message, customer_email) && notificationService.sendSms(message, "9752540754")) {
					return "done";
				} else {
					return "Response not sent to the customer,Try again..";
				}
			} else {
				
				System.out.println("in else");
				return "Response not sent to the customer,Try again..";
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "error";

	}

	// binder for converting image multipart type to byte array
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {

		// Convert multipart object to byte[]
		// binder.registerCustomEditor(byte[].class, new
		// ByteArrayMultipartFileEditor());
		binder.registerCustomEditor(String.class, new StringMultipartFileEditor());

	}

}
