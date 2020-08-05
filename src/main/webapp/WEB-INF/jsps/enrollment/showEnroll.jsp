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
  .skill-info{
  width: 30%;
  }
  .enroll-checkout-button{
  margin: auto;
  width: 100%;
  align-items: center;
  display: inline-block;
  text-align: center;
  padding: 20px;
  }
  </style>
<title>Enroll</title>
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
        <li><a href="logout_wya">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="trendingskill-details-table">
<table class="table">
<tr>
<td class="skill-info">ID:<td>
<td>${skill.id}</td>
</tr>
<tr>
<td class="skill-info">NAME:<td>
<td>${skill.name}</td>
</tr>
<tr>
<td class="skill-info">DESCRIPTION:<td>
<td>${skill.description}</td>
</tr>
<tr>
<td class="skill-info">INSTRUCTOR'S NAME:<td>
<td>${skill.instructorName}</td>
</tr>
<tr>
<td class="skill-info">FEE:<td>
<td>${skill.fee}</td>
</tr>
<tr>
<td class="skill-info">RATING:<td>
<td>${skill.rating}</td>
</tr>
<tr>
<td class="skill-info">STUDENTS SO FAR: <td>
<td>${skill.studentsSoFar}</td>
</tr>
</table>
</div>
<div class="enroll-checkout-button">
<c:choose>
  <c:when test="${skill.fee != 0.0}">
  	<a href="showCheckout?skillId=${skill.id}"><button type="button" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspProceed to Checkout&nbsp&nbsp<span class="glyphicon glyphicon-credit-card"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button></a>
 </c:when>
 <c:otherwise>
   <a href="showCheckout?skillId=${skill.id}"><button type="button" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspEnroll&nbsp&nbsp<span class="glyphicon glyphicon-education"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button></a>
 </c:otherwise>
</c:choose>
</div>
</body>
</html>