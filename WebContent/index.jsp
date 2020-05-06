<%@page import="com.online"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Online.js"></script>

</head>
<body>
<div class="container">
<div class="row">
<div class="col-6">
	<h1>Appointment Management</h1>

	<form id="formApp" name="formApp">
		<!-- Appointment ID :
 		<input id="appid" name="appid" type="text" class="form-control form-control-sm"> -->
 		<br> Date:
 		<input id="appDate" name="appDate" type="text" class="form-control form-control-sm">
 		<br> Time:
	 	<input id="appTime" name="appTime" type="text" class="form-control form-control-sm">
 		<br> Patient ID:
 		<input id="apppid" name="apppid" type="text" class="form-control form-control-sm">
 		<br> Doctor ID:
 		<input id="appdid" name="appdid" type="text" class="form-control form-control-sm">
 		<br> Hospital ID:
 		<input id="apphid" name="apphid" type="text" class="form-control form-control-sm">
 		<br>
 		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
 		<input type="hidden" id="hidAppIDSave" name="hidAppIDSave" value="">
	</form>
	
	<div id="alertSuccess" class="alert alert-success"></div>
	<div id="alertError" class="alert alert-danger"></div>

	<br>
	<div id="divAppGrid">
 		<%
 			online AppObj = new online();
 			out.print(AppObj.ReadAppointment());
	 	%>
	</div>
</div>
</div>
</div>

</body>
</html>