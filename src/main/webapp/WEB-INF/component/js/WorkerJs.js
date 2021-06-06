//js code for signUp validation



function openNav() {
	document.getElementById("mySidebar").style.width = "250px";
	document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
	document.getElementById("mySidebar").style.width = "0px";
	document.getElementById("main").style.marginLeft = "0px";
}

$(document).ready(function(){

openNav();
closeNav();
	
})


	//function for client side form validation
$(function() {

	$("#email_error_message").hide();
	$("#password_error_message").hide();
	$("#name_error_msg").hide();
	$("#city_error_message").hide();
	$("#address_error_message").hide();
	$("#contact_error_message").hide();
	$("#Addhar_Nomber_error_message").hide();
	$("#price_error_message").hide();

	$("#frm_email").focusout(function() {
		cheackEmail();
	});

	$("#frm_password").focusout(function() {

		cheackPassword();
	});

	$("#frmName").focusout(function() {

		cheackName();
	});

	$("#frmCity").focusout(function() {

		cheackCity();
	});

	$("#frmAddress").focusout(function() {

		cheackAddress();
	});

	$("#frmContact").focusout(function() {

		cheackContact();
	});

	$("#frmAadharNomber").focusout(function() {

		cheackAadharNomber();
	});

	$("#frmPrice").focusout(function() {

		cheackPrice();
	});




	//function for cheacking email 

	function cheackEmail() {
		var pattern = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

		var emailData = $("#frm_email").val();

		if (emailData != '' && pattern.test(emailData)) {

			$("#frm_email").css("border", "2px solid #226308");
			$("#email_error_message").hide();
		}
		else {
			if (pattern.test(emailData)) {
				$("#email_error_message").html("email is invalid");

			}
			else {

				$("#email_error_message").html("* email should not be empty");
			}

			$("#email_error_message").css("color", "#c41f3b");
			$("#email_error_message").show();
			$("#frm_email").css("border", "2px solid #F90A0A");

		}
	}


	//function for cheacking password

	function cheackPassword() {

		var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$/;

		var passwordValue = $("#frm_password").val();
		var password_length = $("#frm_password").val().length;

		if (pattern.test(passwordValue) && passwordValue !== '' && password_length >= 8) {

			$("#password_error_message").hide();
			$("#frm_password").css("border", "2px solid #226308");

		} else {

			$("#password_error_message")
				.html("Minimum 8 and maximum 10 characters, at least one uppercase letter, one lowercase letter, one number and one special character");
			$("#password_error_message").css("color", "#c41f3b");
			$("#password_error_message").show();
			$("#frm_password").css("border", "2px solid #F90A0A");

		}
	}





	//function for cheacking name

	function cheackName() {

		var pattern = /^[a-z A-Z]*$/;

		var name = $("#frmName").val()
		var nameLength = name.length;

		if (pattern.test(name) && name !== '' && nameLength >= 3) {

			$("#name_error_msg").hide();
			$("#frmName").css("border", "2px solid #226308");
		} else {
			$("#name_error_msg")
				.html(
					"Should contain only charecters and length must be greater than 3");
			$("#name_error_msg").css("color", "#c41f3b");
			$("#name_error_msg").show();
			$("#frmName").css("border", "2px solid #F90A0A")



		}

	}


	//function for cheacking city

	function cheackCity() {

		var pattern = /^[a-z A-Z]*$/;

		var name = $("#frmCity").val()
		var nameLength = name.length;

		if (pattern.test(name) && name !== '' && nameLength >= 3) {

			$("#city_error_message").hide();
			$("#frmCity").css("border", "2px solid #226308");
		} else {
			$("#city_error_message")
				.html(
					"Should contain only charecters and length must be greater than 3");
			$("#city_error_message").css("color", "#c41f3b");
			$("#city_error_message").show();
			$("#frmCity").css("border", "2px solid #F90A0A")


		}

	}

	//function for cheacking address

	function cheackAddress() {

		var pattern = /^[a-z A-Z]*$/;

		var name = $("#frmAddress").val()
		var nameLength = name.length;

		if (pattern.test(name) && name !== '' && nameLength >= 3) {

			$("#address_error_message").hide();
			$("#frmAddress").css("border", "2px solid #226308");
		} else {
			$("#address_error_message")
				.html(
					"Should contain only charecters and length must be greater than 3");
			$("#address_error_message").css("color", "#c41f3b");
			$("#address_error_message").show();
			$("#frmAddress").css("border", "2px solid #F90A0A")


		}

	}

	//function for cheacking contact nomber

	function cheackContact() {

		var pattern = /^[0-9]+$/;
		var contact = $("#frmContact").val();
		var contactlength = $("#frmContact").val().length;


		if (pattern.test(contact) && contact !== '' && contactlength === 10) {

			$("#contact_error_message").hide();
			$("#frmContact").css("border", "2px solid #226308");
		} else {
			$("#contact_error_message").html("contact has only Numbers and can't be empty");
			$("#contact_error_message").css("color", "#c41f3b");
			$("#contact_error_message").show();
			$("#frmContact").css("border", "2px solid #F90A0A");


		}
	}



	//function for cheacking AAdhar nomber

	function cheackAadharNomber() {

		var pattern = /^[0-9]+$/;
		var aadharNomber = $("#frmAadharNomber").val();
		var contactlength = $("#frmAadharNomber").val().length;


		if (pattern.test(aadharNomber) && aadharNomber !== '' && contactlength === 12) {

			$("#Addhar_Nomber_error_message").hide();
			$("#frmAadharNomber").css("border", "2px solid #226308");
		} else {
			$("#Addhar_Nomber_error_message").html("contact has only Numbers and can't be empty");
			$("#Addhar_Nomber_error_message").css("color", "#c41f3b");
			$("#Addhar_Nomber_error_message").show();
			$("#frmAadharNomber").css("border", "2px solid #F90A0A");


		}
	}


	//function for cheacking price

	function cheackPrice() {

		var pattern = /^[0-9]+$/;
		var price = $("#frmPrice").val();

		if (pattern.test(price) && price !== '') {

			$("#price_error_message").hide();
			$("#frmPrice").css("border", "2px solid #226308");
		} else {
			$("#price_error_message").html("contact has only Numbers and can't be empty");
			$("#price_error_message").css("color", "#c41f3b");
			$("#price_error_message").show();
			$("#frmPrice").css("border", "2px solid #F90A0A");


		}
	}





})

