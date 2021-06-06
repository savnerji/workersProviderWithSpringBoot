// ajax for update profile pic  of worker

$("#fileForm").on('submit', function(e) {

	e.preventDefault();

	var formData = new FormData();
	formData.append('profilePic', $('input[type=file]')[0].files[0]);
	console.log("form data " + formData);

	var link = $("#baseUrl").val();



	$.ajax({
		url: "/Worker/updatePic",
		data: formData,
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data) {
			if (data.trim() === 'done') {


				swal("Done..you updated your profile pic.")
					.then((value) => {
						window.location = "http://localhost:9090/WorkersProviderJavaBasedConfig/Worker/workerHomePage";
					});
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
})


// ajax for update status data of worker

$("#updateStatusFrm").on('submit', function(e) {

	e.preventDefault();

	var formUpdatedData = {};

	formUpdatedData["status"] = $("#updatedStatus").val();
	formUpdatedData["time"] = $("#updatedTime").val();

	console.log("form data " + formUpdatedData);
	var x = $("#updatedStatus").val();
	console.log(x);

	var link = $("#baseUrl").val();

	$.ajax({
		url: '/Worker/updateStatus',
		data: JSON.stringify(formUpdatedData),
		processData: false,
		contentType: "application/json",
		type: 'POST',
		success: function(data) {
			if (data.trim() === 'done') {


				swal("Done..you updated your profile pic.")
					.then((value) => {
						window.location = "http://localhost:9090/WorkersProviderJavaBasedConfig/Worker/workerHomePage";
					});
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
})


// ajax for add status data of worker

$("#addStatusFrm").on('submit', function(e) {

	e.preventDefault();

	var formData = {};
	formData["status"] = $("#status").val();
	formData["time"] = $("#time").val();

	console.log("form data " + formData);
	var link = $("#baseUrl").val();
	$.ajax({
		url: '/Worker/addStatus',
		data: JSON.stringify(formData),
		processData: false,
		contentType: "application/json",
		type: 'POST',
		success: function(data, textStatus, jqXHR) {
			console.log(data);
			if (data.trim() === 'done') {
				swal("Done..you are registered..we are rediricting to the log in page.")
					.then((value) => {
						window.location = "http://localhost:9090/WorkersProviderJavaBasedConfig/Worker/workerHomePage";
					});
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
})


// ajax for updating profile data of worker

$("#workerUpdateForm").on('submit', function(e) {

	e.preventDefault();

	var formData = {};
	formData["w_Id"] = $("#workerID").val();
	formData["w_Name"] = $("#frmName").val();
	formData["city"] = $("#frmCity").val();
	formData["address"] = $("#frmAddress").val();
	formData["contact"] = $("#frmContact").val();
	formData["work_Type"] = $("#type").val();
	formData["email"] = $("#frm_email").val();
	formData["aadharCardNomber"] = $("#aadharNumber").val();
	formData["password"] = $("#frm_password").val();
	formData["work_Price"] = $("#frmPrice").val();
	formData["profilePic"] = $("#profilePic").val();
	formData["aadharCardPic"] = $("#aadharPic").val();
	formData["role"] = $("#role").val();

	var link = $("#baseUrl").val();

	$.ajax({
		url: '/Worker/updateWorkerData',
		data: JSON.stringify(formData),
		processData: false,
		contentType: "application/json",
		type: 'POST',
		success: function(data) {
			if (data.trim() === 'done') {


				swal("Done..you updated your profile.")
					.then((value) => {
						window.location = "http://localhost:9090/WorkersProviderJavaBasedConfig/Worker/workerHomePage";
					});
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
})


//ajax request for updating forgot password


$("#updatePasswordForm").on('submit', function(e) {
	e.preventDefault();
	var formData = $("#frm_password").val();


	var link = $("#baseUrl").val();



	$.ajax({
		url: "/update_password",
		data: formData,
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data) {
			if (data.trim() === 'done') {


				swal("Done..you updated your Password..")
					.then((value) => {
						window.location = "http://localhost:9090/WorkersProviderJavaBasedConfig/User/UserHome";
					});
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

	console.log("asvhd");
})




// ajax for contact us

$("#contact_form").on('submit', function(e) {

	e.preventDefault();

	var formData = {};
	formData["name"] = $("#name").val();
	formData["email"] = $("#email").val();
	formData["subject"] = $("#subject").val();
	formData["message"] = $("#message").val();





	var link = $("#baseUrl").val();

	$.ajax({
		url:  '/connectUs',
		data: JSON.stringify(formData),
		processData: false,
		contentType: "application/json",
		type: 'POST',
		success: function(data) {
			if (data.trim() === 'done') {


				swal("Your message is sent.. we will contact you soon..")
					.then((value) => {
						window.location = "http://localhost:9090/WorkersProviderJavaBasedConfig";
					});
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
})





// ajax for book worker from the user side

$("#workDescription").on('submit', function(e) {

	e.preventDefault();

	$('#spinner').show();


	var formData = {};
	formData["customer_Name"] = $("#customer_Name").val();
	formData["customer_contact"] = $("#customer_contact").val();
	formData["address"] = $("#customer_address").val();
	formData["work_Description"] = $("#work_Description").val();



	var link = $("#baseUrl").val();
	console.log(link);

	$.ajax({
		url: '/User/send',
		data: JSON.stringify(formData),
		processData: false,
		contentType: "application/json",
		type: 'POST',
		success: function(data) {
			if (data.trim() === 'done') {

				$('#spinner').hide();
				swal("Done..your request sent to the worker. He will contact you soon")
					.then((value) => {
						window.location = "http://localhost:9090/WorkersProviderJavaBasedConfig/User/UserHome";
					});
			}
			else {
				$('#spinner').hide();
				swal(data);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
			$('#spinner').hide();
			swal("Something went wrong..try again.. .");
		}
	});
})






// ajax for sending response to the customer from the worker

$("#workerResponse").on('submit', function(e) {

	e.preventDefault();

	$('#spinner').show();


	var formData = {};
	formData["date"] = $("#date").val();
	formData["time"] = $("#time").val();
	formData["charges"] = $("#charges").val();
	formData["extraCharges"] = $("#extracharges").val();
	formData["condition"] = $("#condition").val();



	var link = $("#baseUrl").val();
	console.log(formData);

	$.ajax({
		url:  '/Worker/workerResponse',
		data: JSON.stringify(formData),
		processData: false,
		contentType: "application/json",
		type: 'POST',
		success: function(data) {
			if (data.trim() === 'done') {

				$('#spinner').hide();
				swal("Done..your response sent to the customer.")
					.then((value) => {
						window.location = "http://localhost:9090/WorkersProviderJavaBasedConfig/Worker/workerHomePage";
					});
			}
			else {
				$('#spinner').hide();
				swal(data);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
			$('#spinner').hide();
			swal("Something went wrong..try again.. .");
		}
	});
})




