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
  .trendingskill-details-table{
  width: 85%;
  	margin: 0 auto;
  	border-radius: 16px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffffff;
    font-family: Montserrat, sans-serif;
    padding-top: 100px;
  }
  </style>
<title>Hobby Finder</title>
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


<div class="trendingskill-details-table">
<table class="table table-hover">
	<tr>
    	<th>ID</th>
    	<th>NAME</th>
    	<th>DESCRIPTION</th>
    	<th>INSTRUCTOR'S NAME</th>
    	<th>FEE</th>
    	<th>RATING</th>
    	<th>STUDENTS SO FAR</th>
    </tr>
  	<c:forEach items="${allSkills}" var="skill">
    <tr>
    	<td>${skill.id}</td>
    	<td>${skill.name}</td>
    	<td>${skill.description}</td>
    	<td>${skill.instructorName}</td>
    	<td>${skill.fee}</td>
    	<td>${skill.rating}</td>
    	<td>${skill.studentsSoFar}</td>
    	<td><a href="showEnroll?skillId=${skill.id}"><button type="button" class="btn btn-success">Enroll</button></a></td>
    </tr>
    </c:forEach>
</table>
</div>
</body>
</html>