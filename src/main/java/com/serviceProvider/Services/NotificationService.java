package com.serviceProvider.Services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {

	@Autowired
	private EmailService emailService;

	@Value("${API_KEY}")
	private String apiKey;

	public boolean sendSms(String message, String number) {
		boolean f = true;

		try {

			String senderId = "TXTIND";

			// important step
			message = URLEncoder.encode(message, "UTF-8");

			String language = "english";
			String route = "v3";

			String myUrl = "https://www.fast2sms.com/dev/bulkV2?authorization=" + apiKey + "&sender_id=" + senderId + "&message=" + message + "&route=" + route + "&numbers=" + number;

			// sending get request using java

			URL url = new URL(myUrl);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			con.setRequestProperty("cache-control", "no-cache");

			System.out.println("wait.......");
			int responseCode = con.getResponseCode();

			System.out.println("responseCode " + responseCode);
			StringBuffer response = new StringBuffer();

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

			while (true) {
				String line = br.readLine();

				if (line == null) {
					break;
				} else {
					response.append(line);
				}
			}

			System.out.println(response);

			/*
			 * System.out.println(message); System.out.println(number);
			 * System.out.println(myUrl);
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// send notification to the worker after requesting to active service from the
	// user side

	public boolean sendNotificationViaEmail(String subject, String message, String to) {

		// System.out.println(email);

		// genratin otp of 6 degit
		boolean f = false;

		boolean flag = this.emailService.sendEmail(subject, message, to);

		if (flag) {

			f = true;
			return f;

		} else {

			return f;
		}

	}

}
