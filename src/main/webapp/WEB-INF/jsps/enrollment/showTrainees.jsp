<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
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
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #f4511e !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  .heading{
   text-align: center;
   padding-top: 100px;
  }
  .details-table{
    width: 85%;
  	margin: 0 auto;
  	border-radius: 16px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffffff;
    font-family: Montserrat, sans-serif;
  }
  .notrainees{
   border-radius: 2px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffffff;
    border: 1px solid #f4511e;
    font-size: 16px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    font-family: Montserrat, sans-serif;
    width: 80%;
    margin: 0 auto;
    padding: 16px;
    padding-top: 150px;
  }
</style>
<title>Trainees</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="showDashboard">Learn-A-Hobby</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
		<li><a href="showProfile">My Profile</a></li>
        <li><a href="performLogout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<h2 class="heading">My Trainees:-</h2>


<c:choose>
  <c:when test="${trainees.size() == 0}">
  	<p class="notrainees">You don't have any trainees yet.</p>
 </c:when>
 <c:otherwise>
 <div class="details-table">
   <table class="table table-hover">
<tr>
	<th>Skill ID</th>
	<th>Skill Name</th>
	<th>Trainee Name</th>
	<th>Trainee Email</th>
	<th>Trainee Phone Number</th>
	<th>acquired</th>
</tr>
<c:forEach items="${trainees}" var="trainee">
    <tr>
    	<td>${trainee.skillId}</td>
    	<td>${trainee.skillName}</td>
    	<td>${trainee.traineeName}</td>
    	<td>${trainee.traineeEmail}</td>
    	<td>${trainee.traineePhoneNumber}</td>
    	<td>${trainee.acquired}</td>
    	<td><form action="setCompleted" method="post"><input type="text" name="enrollmentId" value="${trainee.enrollmentId}" HIDDEN />
    	<input type="submit" value="Set as completed" ${trainee.acquired==true ? 'disabled' : ''} /></form></td>
    </tr>
    </c:forEach>
</table>
</div>
 </c:otherwise>
</c:choose>
</body>
</html>