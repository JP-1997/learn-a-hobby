<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<style>
.navbar {
    margin-bottom: 0;
    background-color: #f4511e;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
   .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .profileheading{
  padding: 60px 10px 10px 20px;
  text-align: center;
  }
  .userdetail{
  width: 30%;
  }
  .user-details-table{
  	width: 85%;
  	margin: 0 auto;
  	border-radius: 16px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffffff;
    font-family: Montserrat, sans-serif;
  }
  .profile-buttons {
  	display: flex;
	height: 30px;
	justify-content: space-around;
	flex-wrap: wrap;
	align-content: center;
	align-items: stretch;
  }
  
  .profile-buttons a, button{
  	align-self: auto;
  	width: 200px;
  	padding: 20px;
  }
  
</style>
<title>My Profile</title>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
      <a class="navbar-brand" href="showDashboard">Learn-A-Hobby</a>
    </div>
</nav>
<h2 class="profileheading">My Profile</h2><br />

<div class="user-details-table">
<table class="table">
	<tr>
		<td class="userdetail">User Id</td>
		<td>${userDetails.id}</td>
	</tr>
	<tr>
		<td class="userdetail">First Name</td>
		<td>${userDetails.firstName}</td>
	</tr>
	<tr>
		<td class="userdetail">Last Name</td>
		<td>${userDetails.lastName}</td>
	</tr>
	<tr>
		<td class="userdetail">Date of birth</td>
		<td ><fmt:formatDate type = "date" value = "${userDetails.dateOfBirth}" /></td>
	</tr>
	<tr>
		<td class="userdetail">Gender</td>
		<td>${userDetails.gender}</td>
	</tr>
	<tr>
		<td class="userdetail">Country</td>
		<td>${userDetails.country}</td>
	</tr>
	<tr>
		<td class="userdetail">Phone Number</td>
		<td>${userDetails.phoneNumber}</td>
	</tr>
	<tr>
		<td class="userdetail">Email</td>
		<td>${userDetails.email}</td>
	</tr>
</table>
</div>

<div class="profile-buttons">
	<a href="showEditProfile"><button type="button" class="btn btn-primary">Edit</button></a>
	<a href="showDeleteProfile"><button type="button" class="btn btn-warning">Delete Profile</button></a>
</div>


</body>
</html>