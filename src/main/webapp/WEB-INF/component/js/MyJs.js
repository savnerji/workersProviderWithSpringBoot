

$(document).ready(function() {
	//function for client side form validation

	$(function() {

		$("#email_error_message").hide();
		$("#password_error_message").hide();

		$("#frm_email").focusout(function() {
			cheackEmail();
		});

		$("#frm_password").focusout(function() {

			cheackPassword();
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
			console.log(passwordValue);
			if (pattern.test(passwordValue) && passwordValue !== '' && password_length >= 8) {

				$("#password_error_message").hide();
				$("#frm_password").css("border", "2px solid #226308");

			} else {

				$("#password_error_message")
					.html("Password must have one starting Capital letter ,Minimum 8 and maximum 10 characters, , one number and one special character");
				$("#password_error_message").css("color", "#c41f3b");
				$("#password_error_message").show();
				$("#frm_password").css("border", "2px solid #F90A0A");

			}
		}


	})

})

//js code for signUp validation

$(function() {

	$("#usrname_error_message").hide();
	$("#eml_error_message").hide();
	$("#cont_error_message").hide();
	$("#pass_error_message").hide();
	$("#City_error_message").hide();

	$("#userName").focusout(function() {
		cheacsignUpName();
	});

	$("#userContact").focusout(function() {
		cheacksignUpContact();
	});


	$("#usrEmail").focusout(function() {
		cheacksignUpEmail();
	});

	$("#userPassword").focusout(function() {
		cheacksignUpPassword();
	});

	$("#userCity").focusout(function() {
		cheacsignUpCity();
	});



	//function for cheacking name

	function cheacsignUpName() {

		var pattern = /^[a-z A-Z]*$/;

		var name = $("#userName").val()
		var nameLength = name.length;

		if (pattern.test(name) && name !== '' && nameLength >= 3) {

			$("#usrname_error_message").hide();
			$("#userName").css("border", "2px solid #226308");
		} else {
			$("#usrname_error_message")
				.html(
					"Should contain only charecters and length must be greater than 3");
			$("#usrname_error_message").css("color", "#c41f3b");
			$("#usrname_error_message").show();
			$("#userName").css("border", "2px solid #F90A0A")


		}

	}

	//function for cheacking contact nomber

	function cheacksignUpContact() {

		var pattern = /^[0-9]+$/;
		var contact = $("#userContact").val();
		var contactlength = $("#userContact").val().length;


		if (pattern.test(contact) && contact !== '' && contactlength === 10) {

			$("#cont_error_message").hide();
			$("#userContact").css("border", "2px solid #226308");
		} else {
			$("#cont_error_message").html("contact has only Numbers and can't be empty");
			$("#cont_error_message").css("color", "#c41f3b");
			$("#cont_error_message").show();
			$("#userContact").css("border", "2px solid #F90A0A");
			error_cname = true;

		}
	}

	//function for cheacking email 

	function cheacksignUpEmail() {
		var pattern = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

		var emailData = $("#usrEmail").val();

		if (emailData != '' && pattern.test(emailData)) {

			$("#usrEmail").css("border", "2px solid #226308");
			$("#eml_error_message").hide();
		}
		else {
			if (pattern.test(emailData)) {
				$("#eml_error_message").html("email is invalid");

			}
			else {

				$("#eml_error_message").html("* email should not be empty");

			}

			$("#eml_error_message").css("color", "#c41f3b");
			$("#eml_error_message").show();
			$("#usrEmail").css("border", "2px solid #F90A0A");

		}
	}


	//function for cheacking password

	function cheacksignUpPassword() {

		var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$/;

		var passwordValue = $("#userPassword").val();
		var password_length = $("#userPassword").val().length;

		if (pattern.test(passwordValue) && passwordValue !== '' && password_length >= 8) {

			$("#pass_error_message").hide();
			$("#userPassword").css("border", "2px solid #226308");

		} else {

			$("#pass_error_message")
				.html("Minimum 8  characters, at least one uppercase letter, one lowercase letter, one number and one special character");
			$("#pass_error_message").css("color", "#c41f3b");
			$("#pass_error_message").show();
			$("#userPassword").css("border", "2px solid #F90A0A");

		}
	}



	//function for cheacking city

	function cheacsignUpCity() {

		var pattern = /^[a-z A-Z]*$/;

		var city = $("#userCity").val()


		if (pattern.test(city) && city !== '') {

			$("#city_error_message").hide();
			$("#userCity").css("border", "2px solid #226308");
		} else {
			$("#City_error_message").html("City can't be empty");
			$("#City_error_message").css("color", "#c41f3b");
			$("#City_error_message").show();
			$("#userCity").css("border", "2px solid #F90A0A")


		}

	}


})


function passwordTogller() {

	$("#eye-icon").toggleClass("fa-eye-slash");

	var x = document.getElementById("frm_password");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}



function passwordIconTogller() {

	$("#eye-icon").toggleClass("fa-eye-slash");

	var x = document.getElementById("frm_password");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}


function passwordIconSignUpToggler() {

	$("#eye-icon").toggleClass("fa-eye-slash");

	var x = document.getElementById("userPassword");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}


//method for updating the completed work request from the customer

function updateWorkStatus(workRequest_Id) {
	console.log(workRequest_Id)
	console.log(workRequest_Id)

	let link = '/WorkersProviderJavaBasedConfig';
	$.ajax({
		url:  '/User/complete_request',
		data: {
			'id': workRequest_Id,
		},

		type: 'POST',
		success: function(data) {
			if (data.trim() === 'done') {

				window.location.href = link + "/User/UserHome";

			}
			else {

				swal(data);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);

			swal("Something went wrong..try again.. .");
		}
	});

}



function rejectRequestByWorker(requestId) {
	console.log(requestId);

	$("#rejectSpinner").show();

	let link = '/WorkersProviderJavaBasedConfig';
	$.ajax({
		url:  '/Worker/delete_request',
		data: {
			'id': requestId,
		},

		type: 'GET',
		success: function(data) {
			if (data.trim() === 'done') {


				$("#rejectSpinner").hide();

				window.location.href = link + "/Worker/workerHomePage";

			}
			else {
				$("#rejectSpinner").hide();
				swal(data);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
			$("#rejectSpinner").hide();
			swal("Something went wrong..try again.. .");
		}
	});



}
