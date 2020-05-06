$(document).ready(function() {
	$("#alertSuccess").hide();
	$("#alertSuccess").hide();

});


//SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------

	var type = ($("#hidAppIDSave").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "OnlineAPI",
		type : type,
		data : $("#formApp").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});
});


function onAppSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);

		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divAppGrid").html(resultSet.data);

		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}

	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();

	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidAppIDSave").val("");
	$("#formApp")[0].reset();
}


//UPDATE==========================================
$(document).on(
		"click",
		".btnUpdate",
		function(event) {
			$("#hidAppIDSave").val(
					$(this).closest("tr").find('#hidAppIDUpdate').val());
			$("#date").val($(this).closest("tr").find('td:eq(0)').text());
			$("#time").val($(this).closest("tr").find('td:eq(1)').text());
			$("#apmnt_id").val($(this).closest("tr").find('td:eq(2)').text());
			
		});


//REMOVE==========================================
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "OnlineAPI",
		type : "DELETE",
		data : "apmnt_id=" + $(this).data("AppID"),
		dataType : "text",
		complete : function(response, status) {
			onAppDeleteComplete(response.responseText, status);
		}
	});
});


function onAppDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divAppGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}


//CLIENTMODEL=========================================================================
function validateItemForm() {
	// Date
	if ($("#appDate").val().trim() == "") {
		return "Select a date.";
	}
	// Time
	if ($("#appTime").val().trim() == "") {
		return "Select a time.";
	}

	// PatientID-------------------------------
	if ($("#apppid").val().trim() == "") {
		return "Insert your patientID.";
	}
	// is numerical value
	var pid = $("#apppid").val().trim();
	if (!$.isNumeric(pid)) {
		return "Insert a numerical value for PatientID.";
	}
	
	// doctorID-------------------------------
	if ($("#appdid").val().trim() == "") {
		return "Insert your DoctorID.";
	}
	// is numerical value
	var did = $("#appdid").val().trim();
	if (!$.isNumeric(did)) {
		return "Insert a numerical value for DoctorID.";
	}
	
	// hospital ID-------------------------------
	if ($("#apphid").val().trim() == "") {
		return "Insert your hospitalID.";
	}
	// is numerical value
	var hid = $("#apphid").val().trim();
	if (!$.isNumeric(hid)) {
		return "Insert a numerical value for HospitalID.";
	}
	
	return true;
}
