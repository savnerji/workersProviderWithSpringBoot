package com.serviceProvider.Controllar;

import java.io.File;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.Worker;
import com.serviceProvider.Services.EmailService;
import com.serviceProvider.Services.UserService;
import com.serviceProvider.Services.WorkerService;

@Controller
public class ForgotControllar {
	Random random = new Random(100000);

	@Autowired
	private EmailService emailService;

	@Autowired
	private UserService userService;

	@Autowired
	private WorkerService workerService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	
	@Autowired
	private WorkerService WorkerService;
	
	// send otp for forgot password
	@PostMapping("/send_otp")
	public String sendOTP(@RequestParam("email") String email, HttpSession session, Model m) {
		// System.out.println(email);

		// genratin otp of 6 degit

		int otp = random.nextInt(999999);
		System.out.println(otp);

		int length = (int) (Math.log10(otp) + 1);

		System.out.println(length);

		// code for sending otp to email
		String subject = "OTP from Workers Provider";
		String message = "Your " + length + " digits one time password for forgot password is :" + otp + "";
		String to = email;
		boolean flag = this.emailService.sendEmail(subject, message, to);

		if (flag) {

			session.setAttribute("myOTP", otp);
			session.setAttribute("email", email);
			m.addAttribute("sentOTP", "We have sent OTP to your email");

			return "verify_otp";
			// return "change_password";
		} else {
			// session.setAttribute("otpSendingError", "OTP not Sent");

			m.addAttribute("otpSendingError", "OTP not sent..Something went wrong.");
			return "verify_otp";
		}

	}

	@PostMapping("/verify_otp")
	public String verifyOTP(@RequestParam("otp") int otp, HttpSession session, Model m) {

		int myOTP = (int) session.getAttribute("myOTP");
		String userEmail = (String) session.getAttribute("email");
		System.out.println(myOTP);
		System.out.println("sdasd" + otp);
		if (myOTP == otp) {

			session.removeAttribute("myOTP");
			User user = userService.getUserByEmail(userEmail);
			
			if(user != null)
			{
				session.setAttribute("forgotPasswordUser", user);
				return "password_change_form";
			}
			else
			{
				//m.addAttribute("msg", "User is not exist with this email..");
				
				Worker worker = workerService.getWorkerByEmail(userEmail);
				
				if(worker != null)
				{
					session.setAttribute("forgotPasswordWorker", worker);
					return "password_change_form";
				}
				else
				{
					m.addAttribute("msg", "User is not exist with this email..");
					return "Sorry";
				}
				
			
			}

//		userService.getUserByEmail(userEmail);
//		
//
//			if (!userByEmail.isEmpty()) {
//				User user = (User) userByEmail.get(0);
//				System.out.println(user);
//				if (user == null) {
//					// send error page
//					m.addAttribute("msg", "User is not exist with this email..");
//					return "Sorry";
//				} else {
//					// send password change form
//					session.setAttribute("forgotPasswordUser", user);
//					return "password_change_form";
//				}
//
//			} else {
//				List<?> workerlist = workerService.getWorker(userEmail);
//				if (!workerlist.isEmpty()) {
//					Worker worker = (Worker) workerlist.get(0);
//					System.out.println(worker);
//					if (worker == null) {
//						// send error page
//						m.addAttribute("msg", "User is not exist with this email..");
//						return "Sorry";
//					} else {
//						// send password change form
//						session.setAttribute("forgotPasswordWorker", worker);
//						return "password_change_form";
//					}
//				} else {
//					m.addAttribute("msg", "User is not exist with this email..");
//					return "Sorry";
//				}
//			}

		} else {
			m.addAttribute("otpInvalid", "Invalide OTP");
			return "verify_otp";
		}

	}

	
	//method for update passwodrd

	@PostMapping("/update_password")
	@ResponseBody
	public String updateForgotPassword(@RequestBody String password, HttpSession session) {

		System.out.println(password);

		User forgotpasswordUser = (User) session.getAttribute("forgotPasswordUser");

		if (forgotpasswordUser == null) {

			Worker forgotpasswordWorker = (Worker) session.getAttribute("forgotPasswordWorker");

			forgotpasswordWorker.setPassword(passwordEncoder.encode(password));
			// workerService.updateWorkerPassword(forgotpasswordWorker.getEmail(),password);
			Worker updateWorker = workerService.updateWorker(forgotpasswordWorker);
			
			if (updateWorker!=null) {
				return "done";
			} else {
				return "error";
			}

		} else {
			User forgotpasswordUsr = (User) session.getAttribute("forgotPasswordUser");

			forgotpasswordUsr.setPassword(passwordEncoder.encode(password));
			User updateUser = userService.updateUser(forgotpasswordUser);
			if (updateUser !=null) {
				return "done";
			} else {
				return "error";
			}
		}

	}

	// send otp for user registeration varification
	
	@RequestMapping("/send_otp_user")
	public String sendOTPUser( HttpSession session, Model m) {
		// System.out.println(email);

		// genratin otp of 6 degit

		User user = (User) session.getAttribute("userDataFromForm");
		
		int otp = random.nextInt(999999);
		System.out.println(otp);

		int length = (int) (Math.log10(otp) + 1);

		System.out.println(length);

		// code for sending otp to email
		String subject = "OTP from Workers Provider";
		String message = "Your " + length + " digits one time password for Email verification is :" + otp + "";
		String to = user.getEmail();
		boolean flag = this.emailService.sendEmail(subject, message, to);

		if (flag) {

			session.setAttribute("myuserOTP", otp);
			// session.setAttribute("email", email);

			return "redirect:/user_verification";
			// return "change_password";
		} else {
			// session.setAttribute("otpSendingError", "OTP not Sent");

			//m.addAttribute("otpSendingError", "OTP not sent..Something went wrong.");
			return "redirect:/user_verification";
		}

	}

	@RequestMapping("/user_verification")
	public String userVerificationPage(HttpSession session, Model m) {
		int attribute = (int) session.getAttribute("myuserOTP");

		if (attribute != 0) {
			m.addAttribute("sentOTP", "We have sent OTP to your email");
			return "verify_user_otp";
		} else {
			m.addAttribute("otpSendingError", "OTP not sent..Something went wrong.");
			return "verify_user_otp";
		}

	}

	// controllar for verify user otp

	@PostMapping("/verify_user_otp")
	public String verifyuserOTP(@RequestParam("otp") int otp, HttpSession session, Model m) {

		int myOTP = (int) session.getAttribute("myuserOTP");
		//String userEmail = (String) session.getAttribute("email");
		System.out.println(myOTP);
		System.out.println("sdasd" + otp);
		if (myOTP == otp) {

			User user = (User) session.getAttribute("userDataFromForm");
			session.removeAttribute("myuserOTP");
			if(user!=null)
			{
				User saveUser = userService.saveUser(user);
				if (saveUser!=null) {
					session.removeAttribute("userDataFromForm");
					//m.addAttribute("title", "Log_In");
					return "redirect:/User/UserHome";
				} else {
					return "Register";
				}
			}
			else
			{
				m.addAttribute("msg","somethingwent wrorng..");
				return "Register";
			}
		

		} else {
			m.addAttribute("otpInvalid", "Invalide OTP");
			return "verify_otp";
		}

	}
	
	
	//worker verification
	
	@RequestMapping("/worker_verification")
	public String workerVerificationPage(HttpSession session, Model m) {
		int attribute = (int) session.getAttribute("myWorkerOtp");

		if (attribute != 0) {
			m.addAttribute("sentOTP", "We have sent OTP to your email");
			return "verify_worker_otp";
		} else {
			m.addAttribute("otpSendingError", "OTP not sent..Something went wrong.");
			return "verify_worker_otp";
		}

	}
	
	// controllar for verify worker otp

	@PostMapping("/verify_worker_otp")
	public String verifyworkerOTP(@RequestParam("otp") int otp, HttpSession session, Model m) {

		int myOTP = (int) session.getAttribute("myWorkerOtp");
		//String userEmail = (String) session.getAttribute("email");
		System.out.println(myOTP);
		System.out.println("sdasd" + otp);
		if (myOTP == otp) {

			/*
			 * Worker worker = (Worker) session.getAttribute("workerDataFromForm");
			 * session.removeAttribute("myuserOTP"); if(worker!=null) { if
			 * (workerService.saveWorker(worker)) {
			 * 
			 * //m.addAttribute("title", "Log_In");
			 * 
			 * session.setAttribute("workerSave",true); return
			 * "redirect:/Worker/workerHomePage"; } else {
			 * m.addAttribute("msg","Try again.."); return "Register"; } } else {
			 * m.addAttribute("msg","something went wrorng.."); return "Register"; }
			 */
			
			boolean aadharStatus = (boolean) session.getAttribute("aadharStatus");
			boolean picStatus = (boolean) session.getAttribute("profileStatus");
			// boolean saveWorker = (boolean) session.getAttribute("workerSave");

			if (aadharStatus == true && picStatus == true /* && saveWorker == true */) {

				Worker worker = (Worker) session.getAttribute("workerDataFromForm");

				Worker saveWorker = WorkerService.saveWorker(worker);
				if (saveWorker != null) {
					session.removeAttribute("aadharStatus");
					session.removeAttribute("profileStatus");
					 session.removeAttribute("workerDataFromForm");

					return "redirect:/Worker/workerHomePage";
				} else {
					
					// logic for deleting images in deployement server when worker is not register
					
					session.removeAttribute("aadharStatus");
					session.removeAttribute("profileStatus");

					if (worker.getAadharCardPic().isEmpty()) {
						System.out.println("aadhar blank");
						String profilePic = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "component" + File.separator + "image" + File.separator + "AadharCardPics" + File.separator + worker.getProfilePic();

						WorkerService.deletePics(profilePic);
					} else {
						if (worker.getProfilePic().isEmpty()) {
							System.out.println("profile blank");
							String adharPic = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "component" + File.separator + "image" + File.separator + "profilePics" + File.separator + worker.getAadharCardPic();
							WorkerService.deletePics(adharPic);
						}
					}

					if (worker.getAadharCardPic().length() > 0 && worker.getProfilePic().length() > 0) {
						String profilePic = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "component" + File.separator + "image" + File.separator + "AadharCardPics" + File.separator + worker.getProfilePic();
						String adharPic = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "component" + File.separator + "image" + File.separator + "profilePics" + File.separator + worker.getAadharCardNomber();
						WorkerService.deletePics(adharPic, profilePic);
					}

					m.addAttribute("msg", "Something went wrong try again...");
					m.addAttribute("Worker", new Worker());
					return "WorkerSignUP";

				}

			} else {
				session.removeAttribute("aadharStatus");
				session.removeAttribute("profileStatus");
				session.removeAttribute("workerSave");

				m.addAttribute("msg", "Something went wrong try again...");
				m.addAttribute("Worker", new Worker());
				return "WorkerSignUP";
			}

		} else {
			m.addAttribute("otpInvalid", "Invalide OTP");
			return "verify_worker_otp";
		}

	}
	


	
	// resend OTP for user
	
		@RequestMapping("/resenduserdotp")
		public String resendOTPUser( HttpSession session, Model m) {
			// System.out.println(email);

			// genratin otp of 6 degit

			User user = (User) session.getAttribute("userDataFromForm");
			
			int otp = random.nextInt(999999);
			System.out.println(otp);

			int length = (int) (Math.log10(otp) + 1);

			System.out.println(length);

			// code for sending otp to email
			String subject = "OTP from Workers Provider";
			String message = "Your " + length + " digits one time password for Email verification is :" + otp + "";
			String to = user.getEmail();
			boolean flag = this.emailService.sendEmail(subject, message, to);

			if (flag) {

				session.setAttribute("myuserOTP", otp);
				// session.setAttribute("email", email);

				return "redirect:/user_verification";
				// return "change_password";
			} else {
				// session.setAttribute("otpSendingError", "OTP not Sent");

				//m.addAttribute("otpSendingError", "OTP not sent..Something went wrong.");
				return "redirect:/user_verification";
			}

		}
		
		
		// resend OTP for worker
		
			@RequestMapping("/resendworkerotp")
			public String resendOTPWorker( HttpSession session, Model m) {
				// System.out.println(email);

				// genratin otp of 6 degit

				Worker worker = (Worker) session.getAttribute("workerDataFromForm");
				
				int otp = random.nextInt(999999);
				System.out.println(otp);

				int length = (int) (Math.log10(otp) + 1);

				System.out.println(length);

				// code for sending otp to email
				String subject = "OTP from Workers Provider";
				String message = "Your " + length + " digits one time password for Email verification is :" + otp + "";
				String to = worker.getEmail();
				boolean flag = this.emailService.sendEmail(subject, message, "savnerji05@gmail.com");

				if (flag) {

					session.setAttribute("myWorkerOtp", otp);
					// session.setAttribute("email", email);

					return "redirect:/worker_verification";
					// return "change_password";
				} else {
					// session.setAttribute("otpSendingError", "OTP not Sent");

					//m.addAttribute("otpSendingError", "OTP not sent..Something went wrong.");
					return "redirect:/worker_verification";
				}

			}

	
	
}
