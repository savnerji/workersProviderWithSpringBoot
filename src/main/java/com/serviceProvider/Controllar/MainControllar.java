package com.serviceProvider.Controllar;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.serviceProvider.Entities.Contact;
import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.WorkDataDescription;
import com.serviceProvider.Entities.Worker;
import com.serviceProvider.Helper.Entities.UserLogIn;
import com.serviceProvider.Services.EmailService;
import com.serviceProvider.Services.UserService;
import com.serviceProvider.Services.WorkerService;

@Controller
public class MainControllar {

	@Autowired
	private UserService userService;
	
	@Autowired
	private WorkerService workerService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private EmailService emailService;

	// render home page
	@GetMapping("/")
	public String render() {

		return "Home";
	}

	@GetMapping("/home")
	public String home() {

		return "Home";
	}


	// render register page
	@RequestMapping("/register")
	public String register(Model m) {
		m.addAttribute("User", new User());
		m.addAttribute("title", "Registration page");
		return "Register";
	}

	// do register of user
	@PostMapping(value = "/signUp")
	public String signUp(@Valid @ModelAttribute("User") User user, BindingResult result, HttpSession session, Model m) {
		if (result.hasErrors()) {

			System.out.println("form has error");

			List<ObjectError> allErrors = result.getAllErrors();

			for (ObjectError temp : allErrors) {
				System.out.println(temp);
			}
			return "Register";
		} else {

			User emailAlreadyInDb = userService.isEmailAlreadyInDb(user.getEmail());
			
			Worker emailAlreadyInDb2 = workerService.isEmailAlreadyInDb(user.getEmail());
			
			if (emailAlreadyInDb != null || emailAlreadyInDb2 != null) {
				m.addAttribute("emailExistMsg", "email is already taken");
				return "Register";
			}

			user.setPassword(passwordEncoder.encode(user.getPassword()));
			user.setName(user.getName().toUpperCase());
			user.setCity(user.getCity().toUpperCase());
			
			
			session.setAttribute("userDataFromForm", user);

			return "redirect:/send_otp_user";

		}

	}

	// do sign In for user
	@PostMapping(value = "/signIN")
	public String signIn(@ModelAttribute("User") @Valid UserLogIn user, BindingResult res, HttpSession session, RedirectAttributes redirectAttributes, Model m) {

		System.out.println("flow come=" + user);

		if (res.hasErrors()) {

			// System.out.println("form has error");

			List<ObjectError> allErrors = res.getAllErrors();

			for (ObjectError temp : allErrors) {
				System.out.println(temp);
			}
			return "SignIn";
		} else {
			User usr = userService.getUser(user);
			
			System.out.println("usr is==" + usr);
			if (usr != null) {
				session.setAttribute("User", usr);
				User attribute = (User) session.getAttribute("User");
				// System.out.println("asdasd=" + attribute);
				m.addAttribute("title", "User_home_page");

				return "redirect:/User/UserHome";

			} else {
				m.addAttribute("title", "User_home_page");

				redirectAttributes.addFlashAttribute("msg", "You are not a valid User..!");
				redirectAttributes.addFlashAttribute("style", "#bd0d22");
				return "redirect:/signInPage";
			}

		}

	}

	// render userHome page

	@RequestMapping("/User/UserHome")
	public String renderUserHome(Principal principal, HttpSession session,Model m) {

		User user = userService.getUserByEmail(principal.getName());
		
		
		List<WorkDataDescription> userSentRequest = userService.getUserSentRequest(user,1);

		
		if (user != null) {
			session.setAttribute("User", user);
		}

		System.out.println(userSentRequest);
		m.addAttribute("sentRequests",userSentRequest);
		m.addAttribute("sentRequestsCounts",userSentRequest.size());
		m.addAttribute("usr",user);
		return "UserHome";
	}

	// render signIn page
	@RequestMapping("/signInPage")
	public String loadSignInPage(@ModelAttribute("msg") String msg, Model m) {
		m.addAttribute("title", "signIn Page");
		m.addAttribute("msg", msg);
		m.addAttribute("User", new UserLogIn());
		return "SignIn";
	}

	// log out controllar
	@RequestMapping("/LogOut")
	public String logOut(HttpSession session, RedirectAttributes redirectAttributes) {
		session.removeAttribute("User");
		redirectAttributes.addFlashAttribute("msg", "You are successfully Log Out..!");
		redirectAttributes.addFlashAttribute("style", "#047a43");
		return "redirect:/signInPage";
	}

	// render about page
	@RequestMapping("/about")
	public String About(HttpServletRequest request, Model m) {

		// checking if user is logged in or not with their role
		if (request.isUserInRole("ROLE_USER")) {
			m.addAttribute("Role", "ROLE_USER");
			// System.out.println("yes he is in user");
		} else {

			if (request.isUserInRole("ROLE_WORKER")) {
				m.addAttribute("Role", "ROLE_WORKER");
				// System.out.println("yes he is in Worker");
			} else {
				m.addAttribute("Role", "Anonymus");
				// System.out.println("yes he is in Worker");

			}
		}
		return "about";

	}

	// render contact page
	@RequestMapping("/contact")
	public String Contact(HttpServletRequest request, Model m) {

		// checking if user is logged in or not with their role
		if (request.isUserInRole("ROLE_USER")) {
			m.addAttribute("Role", "ROLE_USER");
			// System.out.println("yes he is in user");
		} else {

			if (request.isUserInRole("ROLE_WORKER")) {
				m.addAttribute("Role", "ROLE_WORKER");
				// System.out.println("yes he is in Worker");
			} else {
				m.addAttribute("Role", "Anonymus");
				// System.out.println("yes he is in Worker");

			}
		}

		m.addAttribute("contact", new Contact());
		return "contact";
	}

	
	// render signIn page
		@RequestMapping("/services")
		public String loadSignInPage( HttpServletRequest request,Model m) {
			m.addAttribute("title", "Services");
			if (request.isUserInRole("ROLE_USER")) {
				m.addAttribute("Role", "ROLE_USER");
				// System.out.println("yes he is in user");
			} else {

				if (request.isUserInRole("ROLE_WORKER")) {
					m.addAttribute("Role", "ROLE_WORKER");
					// System.out.println("yes he is in Worker");
				} else {
					m.addAttribute("Role", "Anonymus");
					// System.out.println("yes he is in Worker");

				}
			}
			
			return "services";
		}
	

		// render signIn page
			@RequestMapping(value="/User/complete_request",method = RequestMethod.POST)
			@ResponseBody
			public String updaetWorkStatus( @RequestParam("id") int id,Model m) {
				
				WorkDataDescription data = userService.getWorkDataDescription(id);
				data.setWorkstatus(0);
				if(userService.completeRequest(data))
				{
					return "done";
				}
				else
				{
					return "error";
				}
				
				
				
			}
			
			
			// render all request page
			
			
			
			@RequestMapping("/User/sent_request/{id}")
			public String SentRequest(@PathVariable("id") int id,Model m) {

				WorkDataDescription details = userService.getWorkDataDescription(id);
				m.addAttribute("data",details);

				m.addAttribute("contact", new Contact());
				m.addAttribute("title","sentRequest");
				return "sentRequestData";
			}
		
		

}
