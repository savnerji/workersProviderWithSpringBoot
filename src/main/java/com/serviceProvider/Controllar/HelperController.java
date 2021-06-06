package com.serviceProvider.Controllar;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.serviceProvider.DAO.ContactRepo;
import com.serviceProvider.Entities.Contact;
import com.serviceProvider.Services.NotificationService;

@Controller
public class HelperController {

	@Autowired
	private ContactRepo contactRepo;

	@Autowired
	private NotificationService notificationService;

	// create a controller for contact us

	@PostMapping("/connectUs")
	@ResponseBody
	public String updateProfile(@RequestBody() Contact contact, HttpSession session, Model m) {

		try {
			
			Contact save = contactRepo.save(contact);

			if (save != null) {
				return "done";
			} else {
				return "Something went wrong";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "error";

	}
	
	
	
	
	@RequestMapping("/book_worker")
	@ResponseBody
	public String sendsms() {

		
		
		
		if(notificationService.sendSms("hey brother"+"at"+" "+new Date().toLocaleString(), "9752540754"))
		{
			return"done";
		}

	return"fas";
	}
	

	/*
	 * public static final String acc_sid = "AC8ee5dd1091e8159ab4e879f9153f5b2b";
	 * 
	 * public static final String auth_token = "412c71fe6dc5a186eaa7a8ac05745374";
	 * 
	 * @RequestMapping("/sendsms")
	 * 
	 * @ResponseBody public String sendsms() {
	 * 
	 * 
	 * try {
	 * 
	 * Twilio.init(acc_sid, auth_token);
	 * 
	 * Message message = Message.creator( new PhoneNumber("+919752540754"), new
	 * PhoneNumber("+18503064226"), "hy bro...	?") .create();
	 * 
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * 
	 * 
	 * 
	 * return "done";
	 * 
	 * }
	 */

	

}
