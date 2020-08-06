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
   .neomorphism{
  	width: 85%;
  	margin: 0 auto;
  	border-radius: 16px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffffff;
    font-family: Montserrat, sans-serif;
    padding: 30px;
    padding-top: 50px;
    align-items: center;
  }
.neomorphism button {
 margin: auto;
  width: 100%;
  align-items: center;
  display: inline-block;
  text-align: center;
  padding: 20px;
}
.deleteButton{
	 margin: auto;
  width: 100%;
  align-items: center;
  display: inline-block;
  text-align: center;
  padding: 20px;
}
</style>
<title>Edit My Course</title>
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

<div class="neomorphism">
<h2>Edit Course</h2><hr />
<form class="form-horizontal" action="updateCourse" method="post">

<div class="form-group">
  <label class="col-md-4 control-label">ID</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
  <input class="form-control" value="${course.id}" type="text" name="id" READONLY/>
   </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
  <input class="form-control" value="${course.name}" type="text" name="name" />
   </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label">Description</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
  <input class="form-control" value="${course.description}" type="text" name="description"/>
   </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label">Fee</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
  <input class="form-control" value="${course.fee}" type="number" step="any" name="fee" />
   </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    <button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSAVE&nbsp&nbsp<span class="glyphicon glyphicon-check"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>
</form>
<br /><br />

<div class="deleteButton">
<a href="deleteMyCourse?courseId=${course.id}">
<button type="submit" class="btn btn-danger" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspDELETE THIS COURSE&nbsp&nbsp<span class="glyphicon glyphicon-remove-sign"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
</a>
</div>

</div>

</body>
</html>